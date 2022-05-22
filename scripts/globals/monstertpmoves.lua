require("scripts/globals/magicburst")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")

-- Foreword: A lot of this is good estimating since the FFXI playerbase has not found all of info for individual moves.
--            What is known is that they roughly follow player Weaponskill calculations (pDIF, dMOD, ratio, etc) so this is what
--            this set of functions emulates.

-- mob types
-- used in mob:isMobType()
MOBTYPE_NORMAL            = 0x00
MOBTYPE_0X01             = 0x01
MOBTYPE_NOTORIOUS        = 0x02
MOBTYPE_FISHED            = 0x04
MOBTYPE_CALLED            = 0x08
MOBTYPE_BATTLEFIELD        = 0x10
MOBTYPE_EVENT            = 0x20

MOBDRAIN_HP = 0
MOBDRAIN_MP = 1
MOBDRAIN_TP = 2

--shadowbehav (number of shadows to take off)
MOBPARAM_IGNORE_SHADOWS = 0
MOBPARAM_1_SHADOW = 1
MOBPARAM_2_SHADOW = 2
MOBPARAM_3_SHADOW = 3
MOBPARAM_4_SHADOW = 4
MOBPARAM_WIPE_SHADOWS = 999

TP_ACC_VARIES = 0
TP_ATK_VARIES = 1
TP_DMG_VARIES = 2
TP_CRIT_VARIES = 3
TP_NO_EFFECT = 0
TP_MACC_BONUS = 1
TP_MAB_BONUS = 2
TP_DMG_BONUS = 3
TP_RANGED = 4

BOMB_TOSS_HPP = 1

function MobRangedMove(mob, target, skill, numberofhits, accmod, dmgmod, tpeffect)
    -- this will eventually contian ranged attack code
    return MobPhysicalMove(mob, target, skill, numberofhits, accmod, dmgmod, TP_RANGED)
end

-- PHYSICAL MOVE FUNCTION
-- Call this on every physical move!
-- accmod is a linear multiplier for accuracy (1 default)
-- dmgmod is a linear multiplier for damage (1 default)
-- tpeffect is an enum which can be one of:
-- 0 TP_ACC_VARIES
-- 1 TP_ATK_VARIES
-- 2 TP_DMG_VARIES
-- 3 TP_CRIT_VARIES
-- mtp100/200/300 are the three values for 100% TP, 200% TP, 300% TP just like weaponskills.lua
-- if TP_ACC_VARIES -> three values are acc %s (1.0 is 100% acc, 0.8 is 80% acc, 1.2 is 120% acc)
-- if TP_ATK_VARIES -> three values are attack multiplier (1.5x 0.5x etc)
-- if TP_DMG_VARIES -> three values are

function MobPhysicalMove(mob, target, skill, numberofhits, accmod, dmgmod, tpeffect, params_phys, mtp150, mtp300, offcratiomod)
    local returninfo = {}

    --get fSTR
    local weaponDmg = mob:getWeaponDmg()
    local fSTR = getMobFSTR(weaponDmg, mob:getStat(tpz.mod.STR), target:getStat(tpz.mod.VIT))

    local lvluser = mob:getMainLvl()
    local lvltarget = target:getMainLvl()
    local acc = mob:getACC()
    local eva = target:getEVA()
    if (target:hasStatusEffect(tpz.effect.YONIN) and mob:isFacing(target, 23)) then -- Yonin evasion boost if mob is facing target
        eva = eva + target:getStatusEffect(tpz.effect.YONIN):getPower()
    end

    --apply WSC
    local WSC = getMobWSC(mob, params_phys)
    --printf("WSC %u", WSC)
    local withoutws = mob:getWeaponDmg() + fSTR
    --printf("dmg without wsc %u", withoutws)
    local base = mob:getWeaponDmg() + WSC + fSTR
    --printf("dmg WITH wsc %u", base)
    if (base < 1) then
        base = 1
    end

    --work out and cap ratio
    if (offcratiomod == nil) then -- default to attack. Pretty much every physical mobskill will use this, Cannonball being the exception.
        offcratiomod = mob:getStat(tpz.mod.ATT)
        -- print ("Nothing passed, defaulting to attack")
    end
    local ratio = offcratiomod/target:getStat(tpz.mod.DEF)

    local lvldiff = lvluser - lvltarget
    if lvldiff < 0 then
        lvldiff = 0
    end

    ratio = ratio + lvldiff * 0.05
    ratio = utils.clamp(ratio, 0, 4)

    --work out hit rate for mobs (bias towards them)
    local hitrate = (acc*accmod) - eva + (lvldiff*2) + 75

    -- printf("acc: %f, eva: %f, hitrate: %f", acc, eva, hitrate)
    hitrate = utils.clamp(hitrate, 20, 95)

    --work out the base damage for a single hit
    local hitdamage = base + lvldiff
    if (hitdamage < 1) then
        hitdamage = 1
    end

    local multiHitDmg = hitdamage * 1

    hitdamage = hitdamage * dmgmod

    if (tpeffect == TP_DMG_VARIES) then
        hitdamage = hitdamage * MobTPMod(skill:getTP() / 10)
    end

    --work out min and max cRatio
    local maxRatio = 1
    local minRatio = 0

    -- https://www.bg-wiki.com/bg/Critical_Hit_Rate
    -- Crit rate has a base of 5% and no cap, 0-100% are valid
    -- Dex contribution to crit rate is capped and works in tiers
    local baseCritRate = 5
    local maxCritRate = 1 -- 100%
    local minCritRate = 0 -- 0%

    local critRate = baseCritRate + getMobDexCritRate(mob, target) + mob:getMod(tpz.mod.CRITHITRATE) + target:getMod(tpz.mod.ENEMYCRITRATE)
    --printf("ddex critRate %u", critRate)
    --printf("critRate before param %i", critRate)
    if tpeffect == TP_CRIT_VARIES then
        critRate = critRate + 25

        --printf("critRate after param %i", critRate)

        critRate = critRate / 100
        --printf("final crit %d", critRate * 100)
        critRate = utils.clamp(critRate, minCritRate, maxCritRate)
    else
        critRate = 0  -- Cannot crit unless TP_CRIT_VARIES
    end
    --printf("critRate with mod %u", critRate * 100)
    if (ratio < 0.5) then
        maxRatio = ratio + 0.5
    elseif ((0.5 <= ratio) and (ratio <= 0.7)) then
        maxRatio = 1
    elseif ((0.7 < ratio) and (ratio <= 1.2)) then
        maxRatio = ratio + 0.3
    elseif ((1.2 < ratio) and (ratio <= 1.5)) then
        maxRatio = (ratio * 0.25) + ratio
    elseif ((1.5 < ratio) and (ratio <= 2.0)) then
        maxRatio = 2 -- https://forum.square-enix.com/ffxi/threads/31310-March-27-2013-%28JST%29-Version-Update 2.0 in era
    else
        maxRatio = ratio
    end


    if (ratio < 0.38) then
        minRatio =  0
    elseif ((0.38 <= ratio) and (ratio <= 1.25)) then
        minRatio = ratio * (1176 / 1024) - (448 / 1024)
    elseif ((1.25 < ratio) and (ratio <= 1.51)) then
        minRatio = 1
    elseif ((1.51 < ratio) and (ratio <= 2.44)) then
        minRatio = ratio * (1176 / 1024) - (775 / 1024)
    else
        minRatio = ratio - 0.375
    end

    --apply ftp (assumes 1~3 scalar linear mod)
    if (tpeffect==TP_DMG_BONUS) then
        hitdamage = hitdamage * fTP(skill:getTP(), 1, 1.5, 2)
    end

    --Applying pDIF
    local pdif = 0

    -- start the hits
    local hitchance = math.random()
    local finaldmg = 0
    local hitsdone = 1
    local bonusHits = 0
    local quadRate = 0
    local tripleRate = 0
    local hitslanded = 0

    local chance = math.random()

    -- first hit has a higher chance to land
    local firstHitChance = hitrate +50 -- changed from * 1.5 to +50 meaning 50% hit rate aka +100 acc

    if (tpeffect==TP_RANGED) then
        firstHitChance = hitrate +50    -- changed from * 1.5 to +50 meaning 50% hit rate aka +100 acc
    end

    --firstHitChance = utils.clamp(firstHitChance, 35, 95)
    firstHitChance = utils.clamp(firstHitChance, 20, 100)
    local critAttackBonus = 1 + ((mob:getMod(tpz.mod.CRIT_DMG_INCREASE) - target:getMod(tpz.mod.CRIT_DEF_BONUS)) / 100)

    if ((chance*100) <= firstHitChance) then
        local isCrit = math.random() < critRate

        pdif = math.random((minRatio*1000), (maxRatio*1000)) --generate random PDIF
        pdif = pdif/1000  --multiplier set.
        if isCrit then
            -- Ranged crits are pdif * 1.25
            if attackType == tpz.attackType.RANGED then
                pdif = pdif * 1.25
                pdif = pdif * critAttackBonus
            else
                pdif = pdif + 1
                pdif = pdif * critAttackBonus
            end
            -- Pdif cannot go past 2.0 for mobs
            if pdif > 2.0 then pdif = 2.0 end
        end
        if math.random()*100 < target:getGuardRate(mob) then -- Try to guard
            target:trySkillUp(mob, tpz.skill.GUARD, 1)
            --target:PrintToPlayer("Successfully guarded first hit TP move swing!")
            pdif = pdif - 1
            if pdif < 0.25 then pdif = 0.25 end -- Cap at 0.25 pdif
        end
        if math.random()*100 < target:getParryRate(mob) then -- Try to parry
            target:trySkillUp(mob, tpz.skill.PARRY, 1)
            --target:PrintToPlayer("Successfully parried first hit TP move swing!")
            hitdamage = 0
        end
        if math.random()*100 < target:getBlockRate(mob) then -- Try To block
            target:trySkillUp(mob, tpz.skill.SHIELD, 1)
            --target:PrintToPlayer("Successfully blocked first hit TP move swing!")
            hitdamage = target:getBlockedDamage(hitdamage)
            --printf("Potency : %u", potency)
        end
        --printf("pdif first hit %u", pdif * 100)
        finaldmg = finaldmg + hitdamage * pdif
        hitslanded = hitslanded + 1
    end
    -- Check multihit(qa/ta/da)
    local quadRate = mob:getMod(tpz.mod.QUAD_ATTACK) / 100
    local tripleRate = mob:getMod(tpz.mod.TRIPLE_ATTACK) / 100
    local doubleRate = mob:getMod(tpz.mod.DOUBLE_ATTACK) / 100

    if math.random() < quadRate then
        bonusHits = bonusHits + 3
    elseif math.random() < tripleRate then
        bonusHits = bonusHits + 2
    elseif math.random() < doubleRate then
        bonusHits = bonusHits + 1
    end
    -- Add multi-hit procs
    numberofhits = numberofhits + bonusHits
    -- Cap at 8 hits
    if numberofhits > 8 then numberofhits = 8 end

    while (hitsdone < numberofhits) do
        chance = math.random()
        local isCrit = math.random() < critRate

        if ((chance*100)<=hitrate) then --it hit
            pdif = math.random((minRatio*1000), (maxRatio*1000)) --generate random PDIF
            pdif = pdif/1000  --multiplier set.
            if isCrit then
                -- Ranged crits are pdif * 1.25
                if attackType == tpz.attackType.RANGED then
                    pdif = pdif * 1.25
                    pdif = pdif * critAttackBonus
                else
                    pdif = pdif + 1
                    pdif = pdif * critAttackBonus
                end
                -- Pdif cannot go past 2.0 for mobs
                if pdif > 2.0 then pdif = 2.0 end
            end
            if math.random()*100 < target:getGuardRate(mob) then -- Try to guard
                target:trySkillUp(mob, tpz.skill.GUARD, 1)
                --target:PrintToPlayer("Successfully guarded a TP move swing!")
                pdif = pdif - 1
                if pdif < 0.25 then pdif = 0.25 end -- Cap at 0.25 pdif
            end
            if math.random()*100 < target:getParryRate(mob) then -- Try to parry
                target:trySkillUp(mob, tpz.skill.PARRY, 1)
                --target:PrintToPlayer("Successfully parried a TP move swing!")
                hitdamage = 0
            end
            if math.random()*100 < target:getBlockRate(mob) then  -- Try To block
                target:trySkillUp(mob, tpz.skill.SHIELD, 1)
                --target:PrintToPlayer("Successfully blocked a TP move swing!")
                hitdamage = target:getBlockedDamage(hitdamage)
            end
            --printf("pdif multihits %u", pdif * 100)
            finaldmg = finaldmg + multiHitDmg * pdif
            hitslanded = hitslanded + 1
        end
        hitsdone = hitsdone + 1
    end

    -- printf("final: %f, hits: %f, acc: %f", finaldmg, hitslanded, hitrate)
    -- printf("ratio: %f, min: %f, max: %f, pdif, %f hitdmg: %f", ratio, minRatio, maxRatio, pdif, hitdamage)

    -- Reduce the damage by half on 5+ hit TP moves or else they become out of control
    if hitslanded >= 5 then
        finaldmg = finaldmg / 2
    end
    -- Fully parried the attack(Displays miss)
    if (hitslanded >= 1 and finaldmg < 1) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    end

    -- all hits missed
    if (hitslanded == 0 or finaldmg == 0) then
        finaldmg = 0
        hitslanded = 0
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    end

    returninfo.dmg = finaldmg
    returninfo.hitslanded = hitslanded

    return returninfo
end

-- MAGICAL MOVE
-- Call this on every magical move!
-- mob/target/skill should be passed from onMobWeaponSkill.
-- dmg is the base damage (V value), accmod is a multiplier for accuracy (1 default, more than 1 = higher macc for mob),
-- ditto for dmg mod but more damage >1 (equivalent of M value)
-- tpeffect is an enum from one of:
-- 0 = TP_NO_EFFECT
-- 1 = TP_MACC_BONUS
-- 2 = TP_MAB_BONUS
-- 3 = TP_DMG_BONUS
-- tpvalue affects the strength of having more TP along the following lines:
-- TP_NO_EFFECT -> tpvalue has no tpz.effect.
-- TP_MACC_BONUS -> direct multiplier to macc (1 for default)
-- TP_MAB_BONUS -> direct multiplier to mab (1 for default)
-- TP_DMG_BONUS -> direct multiplier to damage (V+dINT) (1 for default)
--Examples:
-- TP_DMG_BONUS and TP=100, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 150
-- TP_DMG_BONUS and TP=200, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 300
-- TP_DMG_BONUS and TP=100, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 300
-- TP_DMG_BONUS and TP=200, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 600

function MobMagicalMove(mob, target, skill, damage, element, dmgmod, tpeffect, tpvalue)
    returninfo = {}
    -- Below NYI
    local params = {}
    params.multiplier = dmgmod
    params.tp150 = 1
    params.tp300 = 1
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local statmod = INT_BASED
    -- Above NYI
    local resist = 1
    if bonus == nil then bonus = 0 end -- bonus macc
    local maccBonus = bonus
    maccBonus = maccBonus + getMobBonusMacc(mob, target, element, params)
    -- damage = mob:getMainLvl()
    -- local mobLevel = damage
    -- Maybe?
    local mobLevel = mob:getMainLvl()
    -- get WSC
    local WSC = getMobMagicWSC(mob, params)
    -- get ftp
    -- local tp = mob:getLocalVar("TP") NYI needs to be added to every mob TP move onskillcheck like summoner
    local tp = 1000
    local multiplier = params.multiplier
    local tp150 = params.tp150
    local tp300 = params.tp300
    local ftp = MobMagicfTPModifier(tp, multiplier, tp150, tp300)
    -- get dStat
    local dStat = getMobDStat(statmod, mob, target)
    local magicBurstBonus = getMobMagicBurstBonus(mob, target, skill, element)
    -- get resist
    if params.NO_RESIST ~= nil then -- Only used for Netherblast currently
         resist = 1
    else
        resist = applyPlayerResistance(mob, nil, target, mob:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT), mobAccBonus, element)
        local eleres = target:getMod(element+53)
        if     eleres < 0  and resist < 0.5  then resist = 0.5
        elseif eleres < 1 and resist < 0.25 then resist = 0.25 end
    end
    -- get weather
    local weatherBonus = getMobWeatherBonus(mob, element)
    -- get magic attack bonus
    local magicAttkBonus = getMobMAB(mob, target)
    -- Do the formula!
    local finaldmg = getMobMagicalDamage(mobLevel, WSC, ftp, dStat, magicBurstBonus, resist, weatherBonus, magicAttkBonus)

    --((Lvl+2 + WSC) x fTP + dstat) x Magic Burst bonus x resist x dayweather bonus x  MAB/MDB x mdt
    --printf("mutiplier %i", multiplier * 100)
    --printf("tp %i", tp)
    --printf("wsc %i", WSC)
    --printf("tp150 %i", params.tp150 * 100)
    --printf("tp300 %i", params.tp300 * 100)
    --printf("ftp %i", ftp * 100)
    --printf("bonus magic burst macc %i", bonus)
    --printf("magicBurstBonus %i", magicBurstBonus)
    --printf("dStat %i", dStat)
    --printf("resist %i", resist * 100)
    --printf("weatherbonus %i", weatherBonus * 100)
    --printf("finaldmg %i", finaldmg)

    returninfo.dmg = finaldmg

    return returninfo
end

-- mob version
-- effect = tpz.effect.WHATEVER if enfeeble
-- statmod = the stat to account for resist (INT, MND, etc) e.g. tpz.mod.INT
-- This determines how much the monsters ability resists on the player.
function applyPlayerResistance(mob, effect, target, diff, bonus, element)
    local percentBonus = 0
    local magicaccbonus = 0
	
    if effect ~= nil and math.random() < getEffectResistanceTraitChance(mob, target, effect) then
        return 1/16 -- this will make any status effect fail. this takes into account trait+food+gear
    end


    if (diff > 10) then
        magicaccbonus = magicaccbonus + 10 + (diff - 10)/2
    else
        magicaccbonus = magicaccbonus + diff
    end

    if (bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus
    end

    if (effect ~= nil) then
        percentBonus = percentBonus - getEffectResistance(target, effect)
    end

    local p = getMagicHitRate(mob, target, 0, element, percentBonus, magicaccbonus)

    return getMagicResist(p)
end

function mobAddBonuses(caster, spell, target, dmg, ele)

    local magicDefense = getElementalDamageReduction(target, ele)
    dmg = math.floor(dmg * magicDefense)

    dayWeatherBonus = 1.00

    if caster:getWeather() == tpz.magic.singleWeatherStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif caster:getWeather() == tpz.magic.singleWeatherWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif caster:getWeather() == tpz.magic.doubleWeatherStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif caster:getWeather() == tpz.magic.doubleWeatherWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    if VanadielDayElement() == tpz.magic.dayStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif VanadielDayElement() == tpz.magic.dayWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    if dayWeatherBonus > 1.35 then
        dayWeatherBonus = 1.35
    end

    dmg = math.floor(dmg * dayWeatherBonus)

    burst = calculateMobMagicBurst(caster, ele, target)

    -- not sure what to do for this yet
    -- if (burst > 1.0) then
        -- spell:setMsg(spell:getMagicBurstMessage()) -- "Magic Burst!"
    -- end

    dmg = math.floor(dmg * burst)

    local mdefBarBonus = 0
    if
        ele >= tpz.magic.element.FIRE and
        ele <= tpz.magic.element.WATER and
        target:hasStatusEffect(tpz.magic.barSpell[ele])
    then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(tpz.magic.barSpell[ele]):getSubPower()
    end
    mab = (100 + caster:getMod(tpz.mod.MATT)) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)

    dmg = math.floor(dmg * mab)

    magicDmgMod = (256 + target:getMod(tpz.mod.DMGMAGIC)) / 256

    dmg = math.floor(dmg * magicDmgMod)

    -- print(affinityBonus)
    -- print(speciesReduction)
    -- print(dayWeatherBonus)
    -- print(burst)
    -- print(mab)
    -- print(magicDmgMod)

    return dmg
end

function calculateMobMagicBurst(caster, ele, target)

    local burst = 1.0

    local skillchainTier, skillchainCount = MobFormMagicBurst(ele, target)

    if (skillchainTier > 0) then
        if (skillchainCount == 1) then
            burst = 1.3
        elseif (skillchainCount == 2) then
            burst = 1.35
        elseif (skillchainCount == 3) then
             burst = 1.40
        elseif (skillchainCount == 4) then
            burst = 1.45
        elseif (skillchainCount == 5) then
            burst = 1.50
        else
            -- Something strange is going on if this occurs.
            burst = 1.0
        end
    end

    return burst
end

-- Calculates breath damage
-- mob is a mob reference to get hp and lvl
-- percent is the percentage to take from HP
-- base is calculated from main level to create a minimum
-- Equation: (HP * percent) + (LVL / base)
-- cap is optional, defines a maximum damage
function MobBreathMove(mob, target, percent, base, element, cap)
    local damage = (mob:getHP() * percent) + (mob:getMainLvl() / base)

    if (cap == nil) then
        -- cap max damage
        cap = math.floor(mob:getHP()/5)
    end

    -- Deal bonus damage vs mob ecosystem
    local systemBonus = utils.getSystemStrengthBonus(mob, target)
    damage = damage + (damage * (systemBonus * 0.25))

    -- elemental resistence
    if (element ~= nil and element > 0) then
        -- no skill available, pass nil
        local resist = applyPlayerResistance(mob, nil, target, mob:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT), 0, element)
        local eleres = target:getMod(element+53)
        if     eleres < 0  and resist < 0.5  then resist = 0.5
        elseif eleres < 1 and resist < 0.25 then resist = 0.25 end

        -- get elemental damage reduction
        local defense = getElementalDamageReduction(target, element)

        damage = damage * resist * defense
    end

    damage = utils.clamp(damage, 1, cap)

    return damage
end

function MobFinalAdjustments(dmg, mob, skill, target, attackType, damageType, shadowbehav)

    -- physical attack missed, skip rest
    if (skill:hasMissMsg()) then
        return 0
    end

    --handle pd
    if ((target:hasStatusEffect(tpz.effect.PERFECT_DODGE) or target:hasStatusEffect(tpz.effect.TOO_HIGH) )
            and attackType==tpz.attackType.PHYSICAL) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
        return 0
    end
    -- handle fanatics drink/tonic/powder
    if target:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
        return 0
    end

    -- set message to damage
    -- this is for AoE because its only set once
    skill:setMsg(tpz.msg.basic.DAMAGE)

    --Handle shadows depending on shadow behaviour / attackType
    if (shadowbehav ~= MOBPARAM_WIPE_SHADOWS and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows.

        if (skill:isAoE() or skill:isConal()) then
            shadowbehav = MobTakeAoEShadow(mob, target, shadowbehav)
        end

        dmg = utils.takeShadows(target, dmg, shadowbehav)

        -- dealt zero damage, so shadows took hit
        if (dmg == 0) then
            skill:setMsg(tpz.msg.basic.SHADOW_ABSORB)
			target:addHP(shadowbehav)
            return shadowbehav
        end

    elseif (shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
        target:delStatusEffect(tpz.effect.COPY_IMAGE)
        target:delStatusEffect(tpz.effect.BLINK)
        target:delStatusEffect(tpz.effect.THIRD_EYE)
    end

    if (attackType == tpz.attackType.PHYSICAL and skill:isSingle() == false) then
        target:delStatusEffect(tpz.effect.THIRD_EYE)
    end

    --handle Third Eye using shadowbehav as a guide
    if (attackType == tpz.attackType.PHYSICAL and utils.thirdeye(target)) then
        skill:setMsg(tpz.msg.basic.ANTICIPATE)
        return 0
    end

    -- Handle Automaton Analyzer which decreases damage from successive special attacks
    if target:getMod(tpz.mod.AUTO_ANALYZER) > 0 then
        local analyzerSkill = target:getLocalVar("analyzer_skill")
        local analyzerHits = target:getLocalVar("analyzer_hits")
        if analyzerSkill == skill:getID() and target:getMod(tpz.mod.AUTO_ANALYZER) > analyzerHits then
            -- Successfully mitigating damage at a fixed 40%
            dmg = dmg * 0.6
            analyzerHits = analyzerHits + 1
        else
            target:setLocalVar("analyzer_skill", skill:getID())
            analyzerHits = 0
        end
        target:setLocalVar("analyzer_hits", analyzerHits)
    end

    if attackType == tpz.attackType.PHYSICAL or attackType == tpz.attackType.RANGED then

        dmg = target:physicalDmgTaken(dmg, damageType)
        if not target:isPC() then
                local hthres = target:getMod(tpz.mod.HTHRES)
                local pierceres = target:getMod(tpz.mod.PIERCERES)
                local impactres = target:getMod(tpz.mod.IMPACTRES)
                local slashres = target:getMod(tpz.mod.SLASHRES)
                local spdefdown = target:getMod(tpz.mod.SPDEF_DOWN)
                
                if damageType == tpz.damageType.HTH then
                    if hthres < 1000 then
                        dmg = dmg * (1 - ((1 - hthres / 1000) * (1 - spdefdown/100)))
                    else
                        dmg = dmg * hthres / 1000
                    end
                elseif damageType == tpz.damageType.PIERCING then
                    if pierceres < 1000 then
                        dmg = dmg * (1 - ((1 - pierceres / 1000) * (1 - spdefdown/100)))
                    else
                        dmg = dmg * pierceres / 1000
                    end
                elseif damageType == tpz.damageType.BLUNT then
                    if impactres < 1000 then
                        dmg = dmg * (1 - ((1 - impactres / 1000) * (1 - spdefdown/100)))
                    else
                        dmg = dmg * impactres / 1000
                    end
                else
                    if slashres < 1000 then
                        dmg = dmg * (1 - ((1 - slashres / 1000) * (1 - spdefdown/100)))
                    else
                        dmg = dmg * slashres / 1000
                    end
                end
        end

    elseif (attackType == tpz.attackType.MAGICAL) then

        dmg = target:magicDmgTaken(dmg)

    elseif (attackType == tpz.attackType.BREATH) then

        dmg = target:breathDmgTaken(dmg)

    elseif (attackType == tpz.attackType.RANGED) then

        dmg = target:rangedDmgTaken(dmg)

    end

    --handling phalanx
    dmg = dmg - target:getMod(tpz.mod.PHALANX)

    if (dmg < 0) then
        return 0
    end

    --handling magic stoneskin / stoneskin
    --printf("dmg before %u",dmg)
    if attackType == tpz.attackType.MAGICAL or attackType == tpz.attackType.BREATH then
        dmg = utils.rampartstoneskin(target, dmg)
    end
    dmg = utils.stoneskin(target, dmg)
    --printf("dmg after %u",dmg)
    if (dmg > 0) then
        target:updateEnmityFromDamage(mob, dmg)
        target:handleAfflatusMiseryDamage(dmg)
    end

    return dmg
end

-- returns true if mob attack hit
-- used to stop tp move status effects
function MobPhysicalHit(skill)
    -- if message is not the default. Then there was a miss, shadow taken etc
    return skill:hasMissMsg() == false
end

-- function MobHit()
-- end

-- function MobAoEHit()
-- end

-- function MobMagicHit()
-- end

-- function MobMagicAoEHit()
-- end

function MobDrainMove(mob, target, drainType, drain, attackType, damageType)

    if (target:isUndead() == false) then
        if (drainType == MOBDRAIN_MP) then
            -- can't go over limited mp
            if (target:getMP() < drain) then
                drain = target:getMP()
            end

            target:delMP(drain)
            mob:addMP(drain)

            return tpz.msg.basic.SKILL_DRAIN_MP
        elseif (drainType == MOBDRAIN_TP) then
            -- can't go over limited tp
            if (target:getTP() < drain) then
                drain = target:getTP()
            end

            target:delTP(drain)
            mob:addTP(drain)

            return tpz.msg.basic.SKILL_DRAIN_TP
        elseif (drainType == MOBDRAIN_HP) then
            -- can't go over limited hp
            if (target:getHP() < drain) then
                drain = target:getHP()
            end

            target:takeDamage(drain, mob, attackType, damageType)
            mob:addHP(drain)

            return tpz.msg.basic.SKILL_DRAIN_HP
        end
    else
        -- it's undead so just deal damage
        -- can't go over limited hp
        if (target:getHP() < drain) then
            drain = target:getHP()
        end

        target:takeDamage(drain, mob, attackType, damageType)
        return tpz.msg.basic.DAMAGE
    end

    return tpz.msg.basic.SKILL_NO_EFFECT
end

function MobPhysicalDrainMove(mob, target, skill, drainType, drain)
    if (MobPhysicalHit(skill)) then
        return MobDrainMove(mob, target, drainType, drain)
    end

    return tpz.msg.basic.SKILL_MISS
end

function MobDrainAttribute(mob, target, typeEffect, power, tick, duration)
    local positive = nil
    if (typeEffect == tpz.effect.STR_DOWN) then
        positive = tpz.effect.STR_BOOST
    elseif (typeEffect == tpz.effect.DEX_DOWN) then
        positive = tpz.effect.DEX_BOOST
    elseif (typeEffect == tpz.effect.AGI_DOWN) then
        positive = tpz.effect.AGI_BOOST
    elseif (typeEffect == tpz.effect.VIT_DOWN) then
        positive = tpz.effect.VIT_BOOST
    elseif (typeEffect == tpz.effect.MND_DOWN) then
        positive = tpz.effect.MND_BOOST
    elseif (typeEffect == tpz.effect.INT_DOWN) then
        positive = tpz.effect.INT_BOOST
    elseif (typeEffect == tpz.effect.CHR_DOWN) then
        positive = tpz.effect.CHR_BOOST
    end

    if (positive ~= nil) then
        local results = MobStatusEffectMove(mob, target, typeEffect, power, tick, duration)

        if (results == tpz.msg.basic.SKILL_ENFEEB_IS) then
            mob:addStatusEffect(positive, power, tick, duration)

            return tpz.msg.basic.ATTR_DRAINED
        end

        return tpz.msg.basic.SKILL_MISS
    end

    return tpz.msg.basic.SKILL_NO_EFFECT
end

function DrainMultipleAttributes(mob, target, power, tick, count, duration)
    -- return a variable equal to drain count in the skill file
    -- if draining 1-7 random attributes, local count = math.random(1,7) then return count 
    local attributes = {};
    local currIndex = 1;
    while (currIndex <= count) do
      local newAttr = math.random(136, 142);
      for _, attr in pairs(attributes) do
        if (attr == newAttr) then
          newAttr = -1;
        end
      end
      if (newAttr ~= -1) then
        attributes[currIndex] = newAttr;
        currIndex = currIndex + 1;
      end
    end

    local msg = tpz.msg.basic.SKILL_MISS;
    
    for i = 1,count,1 do
      local newMsg = MobDrainAttribute(mob, target, attributes[i], power, tick, duration);
      if (newMsg == tpz.msg.basic.ATTR_DRAINED) then
        msg = newMsg;
      elseif (msg == tpz.msg.basic.SKILL_MISS) then
        msg = newMsg;
      end
    end
    
    return msg;
end

function MobDrainStatusEffectMove(mob, target)
    -- try to drain buff
    local effect = mob:stealStatusEffect(target)

    if (effect ~= 0) then
        return tpz.msg.basic.EFFECT_DRAINED
    end

    return tpz.msg.basic.SKILL_NO_EFFECT
end

-- Adds a status effect to a target
function MobStatusEffectMove(mob, target, typeEffect, power, tick, duration)

    if target:hasStatusEffect(tpz.effect.FEALTY) or target:hasStatusEffect(tpz.effect.ELEMENTAL_SFORZO) then
	    return tpz.msg.basic.SKILL_NO_EFFECT
    end

    if (target:canGainStatusEffect(typeEffect, power)) then
        local statmod = tpz.mod.INT
        local element = mob:getStatusEffectElement(typeEffect)

        local resist = applyPlayerResistance(mob, typeEffect, target, mob:getStat(statmod)-target:getStat(statmod), 0, element)
        local eleres = target:getMod(element+53)
        if     eleres < 0  and resist < 0.5  then resist = 0.5
        elseif eleres < 1 and resist < 0.25 then resist = 0.25 end

        if (resist >= 0.50) then

            -- Reduce duration by resist percentage
            local totalDuration = duration * resist
            target:addStatusEffect(typeEffect, power, tick, totalDuration)

            return tpz.msg.basic.SKILL_ENFEEB_IS
        end

        return tpz.msg.basic.SKILL_MISS -- resist !
    end
    return tpz.msg.basic.SKILL_NO_EFFECT -- no effect
end

-- similar to status effect move except, this will not land if the attack missed
function MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, tick, duration)

    if (MobPhysicalHit(skill)) then
        return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration)
    end

    return tpz.msg.basic.SKILL_MISS
end

-- similar to statuseffect move except it will only take effect if facing
function MobGazeMove(mob, target, typeEffect, power, tick, duration)
    if (target:isFacing(mob)) then
		if target:hasStatusEffect(tpz.effect.BLINDNESS) then
			return tpz.msg.basic.SKILL_NO_EFFECT
		else
			return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration)
		end
    end
    return tpz.msg.basic.SKILL_NO_EFFECT
end

function MobBuffMove(mob, typeEffect, power, tick, duration)

    if (mob:addStatusEffect(typeEffect, power, tick, duration)) then
        return tpz.msg.basic.SKILL_GAIN_EFFECT
    end
    return tpz.msg.basic.SKILL_NO_EFFECT
end

function MobHealMove(target, heal)

    local mobHP = target:getHP()
    local mobMaxHP = target:getMaxHP()

    if (mobHP+heal > mobMaxHP) then
        heal = mobMaxHP - mobHP
    end

    target:wakeUp()

    target:addHP(heal)

    return heal
end

function MobEncumberMove(mob, target, maxSlots, duration)
    local statmod = tpz.mod.INT
    local element = mob:getStatusEffectElement(tpz.effect.ENCUMBRANCE_I)

    local resist = applyPlayerResistance(mob, tpz.effect.ENCUMBRANCE_I, target, mob:getStat(statmod)-target:getStat(statmod), 0, element)
    local eleres = target:getMod(element+53)
    if     eleres < 0  and resist < 0.5  then resist = 0.5
    elseif eleres < 1 and resist < 0.25 then resist = 0.25 end

    if target:hasStatusEffect(tpz.effect.FEALTY) or target:hasStatusEffect(tpz.effect.ELEMENTAL_SFORZO) then
	    resist = 0.25
    end

    local encumberSlots = {};
    local currIndex = 1;
	while (currIndex <= maxSlots) and (#encumberSlots < 16) do
      local newSlot = math.random(0, 15);
      for _, slot in pairs(encumberSlots) do
        if (slot == newSlot) then
          newSlot = -1;
        end
      end
      if (newSlot ~= -1) then
        encumberSlots[currIndex] = newSlot;
        currIndex = currIndex + 1;
        if (newSlot == 0) then
            encumberSlots[currIndex] = 1;
            currIndex = currIndex + 1;
            maxSlots = maxSlots + 1;
        elseif (newSlot == 1) then
            encumberSlots[currIndex] = 0;
            currIndex = currIndex + 1;
            maxSlots = maxSlots + 1;
        elseif (newSlot == 2) then
            encumberSlots[currIndex] = 3;
            currIndex = currIndex + 1;
            maxSlots = maxSlots + 1;
        elseif (newSlot == 3) then
            encumberSlots[currIndex] = 2;
            currIndex = currIndex + 1;
            maxSlots = maxSlots + 1;
	    end
	  end
	end

    local mask = 0;
    for i = 1,#encumberSlots,1 do
      target:unequipItem(encumberSlots[i]);
      mask = mask + math.pow(2, encumberSlots[i]);
    end
    if resist >= 0.5 then
        target:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, mask, 0, duration * resist);
    end
end

function MobCharmMove(mob, target, skill, costume, duration)
	-- 0 costume = none
        local statmod = tpz.mod.CHR
        local element = mob:getStatusEffectElement(tpz.effect.CHARM_I)

        local resist = applyPlayerResistance(mob, tpz.effect.CHARM_I, target, mob:getStat(statmod)-target:getStat(statmod), 0, element)
        local eleres = target:getMod(element+53)
        if     eleres < 0  and resist < 0.5  then resist = 0.5
        elseif eleres < 1 and resist < 0.25 then resist = 0.25 end
	    --GetPlayerByID(6):PrintToPlayer(string.format("Resist: %u",resist))
	if (not target:isPC()) then
		skill:setMsg(tpz.msg.basic.SKILL_MISS)
	end
	
	if resist >= 0.5 and mob:getCharmChance(target, false) > 0 then
		if target:hasStatusEffect(tpz.effect.FEALTY) or target:hasStatusEffect(tpz.effect.ELEMENTAL_SFORZO) then
		    return skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
		else
        	MobStatusEffectMove(mob, target, tpz.effect.CHARM_I, 0, 3, duration * resist)
			mob:charm(target)
			target:costume(costume)
            return skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_IS)
        end
	else
	    return skill:setMsg(tpz.msg.basic.SKILL_MISS)
	end
end

function MobTakeAoEShadow(mob, target, max)

    return max
end

function MobTPMod(tp)
    -- increase damage based on tp
    if (tp >= 3000) then
        return 2
    elseif (tp >= 2000) then
        return 1.5
    end
    return 1
end

function MobMagicfTPModifier(tp, ftp1, ftp2, ftp3)
    if tp >= 0 and tp < 1500 then
        return ftp1 + ((ftp2-ftp1) /1500) * tp
    elseif tp >= 1500 and tp <= 3000 then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ((ftp3-ftp2) / 1500) * (tp-1500)
    else
        printf("mob fTP error: TP value is not between 0-3000!")
    end
    return 1 -- no ftp mod
end

function fTP(tp, ftp1, ftp2, ftp3)
    if (tp < 1000) then
        tp = 1000
    end
    if (tp >= 1000 and tp < 1500) then
        return ftp1 + ( ((ftp2-ftp1)/500) * (tp-1000))
    elseif (tp >= 1500 and tp <= 3000) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/1500) * (tp-1500))
    end
    return 1 -- no ftp mod
end

function getMobDexCritRate(mob, target)
    -- https://www.bg-wiki.com/bg/Critical_Hit_Rate
    local dDex = mob:getStat(tpz.mod.DEX) - target:getStat(tpz.mod.AGI)
    local dDexAbs = math.abs(dDex)

    local sign = 1
    if dDex < 0 then
        -- target has higher AGI so this will be a decrease to crit rate
        sign = -1
    end

    -- default to +0 crit rate for a delta of 0-6
    local critRate = 0
    if dDexAbs > 39 then
        -- 40-50: (dDEX-35)
        critRate = dDexAbs - 35
    elseif dDexAbs > 29 then
        -- 30-39: +4
        critRate = 4
    elseif dDexAbs > 19 then
        -- 20-29: +3
        critRate = 3
    elseif dDexAbs > 13 then
        -- 14-19: +2
        critRate = 2
    elseif dDexAbs > 6 then
        -- 7-13: +1
        critRate = 1
    end

    -- Crit rate from stats caps at +-15
    return math.min(critRate, 15) * sign
end

function getMobFSTR(weaponDmg, mobStr, targetVit)
    -- https://www.bluegartr.com/threads/114636-Monster-Avatar-Pet-damage
    -- fSTR for mobs has no cap and a lower bound of floor(weaponDmg/9)
    local dSTR = mobStr - targetVit
    local fSTR = dSTR
    if fSTR >= 12 then
        fSTR = (dSTR + 4) / 4
    elseif fSTR >= 6 then
        fSTR = (dSTR + 6) / 4
    elseif fSTR >= 1 then
        fSTR = (dSTR + 7) / 4
    elseif fSTR >= -2 then
        fSTR = (dSTR + 8) / 4
    elseif fSTR >= -7 then
        fSTR = (dSTR + 9) / 4
    elseif fSTR >= -15 then
        fSTR = (dSTR + 10) / 4
    elseif fSTR >= -21 then
        fSTR = (dSTR + 12) / 4
    else
        fSTR = (dSTR + 13) / 4
    end

    local min = math.floor(weaponDmg/9)
    return math.max(-min, fSTR)
end

function getMobWSC(mob, tpeffect)
    --TODO: add parms.str_wsc params.dex_wsc etc to every mob TP move file
    if params_phys == nil then
        wsc = mob:getStat(tpz.mod.STR) * 0.2 + mob:getStat(tpz.mod.DEX) * 0.2 -- Place holder WSC for phys until I'm no longer lazy
        --printf("wsc: %u", wsc)
        return wsc
    end

    if params_phys.str_wsc ~= nil and params_phys.dex_wsc ~= nil and params_phys.vit_wsc ~= nil and params_phys.agi_wsc ~= nil and
        params_phys.int_wsc ~= nil and params_phys.mnd_wsc ~= nil and params_phys.chr_wsc ~= nil then
        wsc = (mob:getStat(tpz.mod.STR) * params_phys.str_wsc + mob:getStat(tpz.mod.DEX) * params_phys.dex_wsc +
            mob:getStat(tpz.mod.VIT) * params_phys.vit_wsc + mob:getStat(tpz.mod.AGI) * params_phys.agi_wsc +
            mob:getStat(tpz.mod.INT) * params_phys.int_wsc + mob:getStat(tpz.mod.MND) * params_phys.mnd_wsc +
            mob:getStat(tpz.mod.CHR) * params_phys.chr_wsc)
        return wsc
    end
        --printf("wsc: %u", wsc)
    return wsc
end

function getMobMagicWSC(mob, tpeffect)
    if  params == nil then
        wsc = mob:getStat(tpz.mod.INT) * 0.3 -- Place holder WSC for magic
        --printf("wsc: %u", wsc)
        return wsc
    end
    
    return wsc
end

function getMobWeatherBonus(mob, element)
    dayWeatherBonus = 1.00

    if mob:getWeather() == tpz.magic.singleWeatherStrong[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif mob:getWeather() == tpz.magic.singleWeatherWeak[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif mob:getWeather() == tpz.magic.doubleWeatherStrong[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif mob:getWeather() == tpz.magic.doubleWeatherWeak[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    if VanadielDayElement() == tpz.magic.dayStrong[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif VanadielDayElement() == tpz.magic.dayWeak[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    if dayWeatherBonus > 1.35 then
        dayWeatherBonus = 1.35
    end

    return dayWeatherBonus
end

--  The stat difference is multiplied by 1.5 when it is positive and multiplied by 1 when it is negative.
function getMobDStat(statmod, mob, target)
    local dSTat = 0
    if (statmod == INT_BASED) then -- Stat mod is INT
        dStat = mob:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    elseif (statmod == CHR_BASED) then -- Stat mod is CHR
        dStat = mob:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR)
    elseif (statmod == MND_BASED) then -- Stat mod is MND
        dStat = mob:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
    elseif (statmod == NONE) then -- Stat mod doesn't exist!
        return 0
    end

    if dSTat > 0 then
        dStat = math.floor(dStat * 1.5)
    else
        dSTat = math.floor(dStat * 1)
    end

    return dSTat
end

function getMobMAB(mob, target)
    -- Get magic attack bonus
    local mab = 100 + mob:getMod(tpz.mod.MATT)
    --printf("mab %i", mab)
    -- Get targets mdef
    local mdef = 100 + target:getMod(tpz.mod.MDEF)
    --printf("mdef %i", mdef)
    -- Get dmg bonus from MAB / MDB
    local magicAttkBonus = mab / mdef
    --printf("magicAttkBonus %i", magicAttkBonus * 100)

    return magicAttkBonus
end

function getMobBonusMacc(mob, target, element, params)
    local magicAccBonus = 0
    local skillchainTier, skillchainCount = FormMagicBurst(element, target)

    --add macc for skillchains
    if (skillchainTier > 0) then
        magicAccBonus = magicAccBonus + 50 -- 30 in retail
    end

    return magicAccBonus
end

function getMobMagicBurstBonus(mob, target, skill, element)
    local burst = 1.0
    local skillchainburst = 1.0
    local modburst = 1.0

    -- Obtain first multiplier from gear, atma and job traits
    modburst = modburst + (mob:getMod(tpz.mod.MAG_BURST_BONUS)) / 100

    -- Cap bonuses from first multiplier at 40% or 1.4
    if (modburst > 1.4) then
        modburst = 1.4
    end

    -- Obtain second multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = FormMagicBurst(element, target)

    if (skillchainTier > 0) then
        if (skillchainCount == 1) then -- two weaponskills
            skillchainburst = 1.5 -- was 1.35
        elseif (skillchainCount == 2) then -- three weaponskills
            skillchainburst = 1.6 -- was 1.45
        elseif (skillchainCount == 3) then -- four weaponskills
             skillchainburst = 1.7 -- was 1.55
        elseif (skillchainCount == 4) then -- five weaponskills
            skillchainburst = 1.8 -- was 1.65
        elseif (skillchainCount == 5) then -- six weaponskills
            skillchainburst = 2.0 -- was 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1.0
        end
    end

    -- Multiply
    if (skillchainburst > 1) then
        burst = burst * modburst * skillchainburst
        local spell = getSpell(147)
        skill:setMsg(spell:getMagicBurstMessage())
    end


    return burst
end

function getMobMagicalDamage(mobLevel, WSC, ftp, dStat, magicBurstBonus, resist, weatherBonus, magicAttkBonus)
    -- Formula is ((Lvl*2 + WSC) x fTP + dstat) x Magic Burst bonus x resist x dayweather bonus x  MAB/MDB x mdt
    -- Avatars Formula is ((Lvl+2 + WSC) x fTP + dstat) x Magic Burst bonus x resist x dayweather bonus x  MAB/MDB x mdt
    return math.floor(((mobLevel*2 + WSC) * ftp + dStat) * magicBurstBonus * resist * weatherBonus * magicAttkBonus)
end
