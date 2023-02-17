require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")

-- The TP modifier
TPMOD_NONE = 0
TPMOD_CRITICAL = 1
TPMOD_DAMAGE = 2
TPMOD_ACC = 3
TPMOD_ATTACK = 4
TPMOD_DURATION = 5

-- The SC the spell makes
SC_IMPACTION = 0
SC_TRANSFIXION = 1
SC_DETONATION = 2
SC_REVERBERATION = 3
SC_SCISSION = 4
SC_INDURATION = 5
SC_LIQUEFACTION = 6
SC_COMPRESSION = 7

SC_FUSION = 8
SC_FRAGMENTATION = 9
SC_DISTORTION = 10
SC_GRAVITATION = 11

SC_DARK = 12
SC_LIGHT = 13

INT_BASED = 1
CHR_BASED = 2
MND_BASED = 3

-- BLU ecosystem
ECO_BEAST = 1
ECO_LIZARD = 2
ECO_VERMIN = 3
ECO_PLANTOID = 4

ECO_AQUAN = 5
ECO_AMORPH = 6
ECO_BIRD = 7

ECO_UNDEAD = 8
ECO_ARCANA = 9

ECO_DRAGON = 10
ECO_DEMON = 11

ECO_LUMORIAN = 12
ECO_LUMINION = 13

ECO_NONE = 0 -- beastmen or other ecosystems that have no strength/weaknesses


-- Get the damage for a blue magic physical spell.
-- caster - The entity casting the spell.
-- target - The target of the spell.
-- spell - The blue magic spell itself.
-- params - The parameters for the spell. Broken down into:
--      .tpmod - The TP modifier for the spell (e.g. damage varies, critical varies with TP, etc). Should be a TPMOD_xxx enum.
--      .numHits - The number of hits in the spell.
--      .multiplier - The base multiplier for the spell (not under Chain Affinity) - Every spell must specify this. (equivalent to TP 0%)
--      .tp150 - The TP modifier @ 150% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%).
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .tp300 - The TP modifier @ 300% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .azuretp - The TP modifier under Azure Lore (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--                  This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .duppercap - The upper cap for D for this spell.
--      .str_wsc - The decimal % value for STR % (e.g. STR 20% becomes 0.2)
--      .dex_wsc - Same as above.
--      .vit_wsc - Same as above.
--      .int_wsc - Same as above.
--      .mnd_wsc - Same as above.
--      .chr_wsc - Same as above.
--      .agi_wsc - Same as above.
function BluePhysicalSpell(caster, target, spell, params, tp)
    -- store related values
    local magicskill = caster:getSkillLevel(tpz.skill.BLUE_MAGIC) -- skill + merits + equip bonuses
    local isRanged = params.attackType == tpz.attackType.RANGED
    -- TODO: Under Efflux?
    -- TODO: Under Azure Lore.

    ---------------------------------
    -- Calculate the final D value  -
    ---------------------------------
    -- worked out from http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- Final D value ??= floor(D+fSTR+WSC) * Multiplier

    local D =  math.floor((magicskill * 0.11)) * 2 + 3
    -- cap D
    if (D > params.duppercap) then
        D = params.duppercap
    end

    -- print("D val is ".. D)

    -- Ranged fSTR caps at 44, melee at 22
    local fStr = 0
    if isRanged then
        fStr = BluefSTR2(caster:getStat(tpz.mod.STR) - target:getStat(tpz.mod.VIT))
        if (fStr > 44) then
            fStr = 44
        end
    else
        fStr = BluefSTR(caster:getStat(tpz.mod.STR) - target:getStat(tpz.mod.VIT))
        if (fStr > 22) then
            fStr = 22 -- TODO: Smite of Rage doesn't have this cap applied.
        end
    end

    --printf("fStr val is %i", fStr)

    local WSC = BlueGetWsc(caster, params)

    -- print("wsc val is ".. WSC)

    local multiplier = params.multiplier

    -- Caculate for Bonus WSC Chance from Empyrean Set

    local bonusWSC = 0
    if caster:getMod(tpz.mod.AUGMENT_BLU_MAGIC) > math.random(0,99) then
       bonusWSC = 2 -- BLU Empyrean set triples the base WSC when it procs.
    end

    -- If under CA, replace multiplier with fTP(multiplier, tp150, tp300)
    local chainAffinity = caster:getStatusEffect(tpz.effect.CHAIN_AFFINITY)
    local azureLore = caster:getStatusEffect(tpz.effect.AZURE_LORE)
    if chainAffinity ~= nil or azureLore ~= nil then
        -- Calculate the total TP available for the fTP multiplier.
        local tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
        if tp > 3000 then
            tp = 3000
        end
        -- Azure Lore treats all spells like they're 3k TP'
        if azureLore ~= nil then
            tp = 3000
        end
        --printf("%u", tp)
        multiplier = BluefTP(tp, multiplier, params.tp150, params.tp300)
        bonusWSC = bonusWSC + 1 -- Chain Affinity Doubles the Base WSC.
    end

    -- Calculate final WSC bonuses

    WSC = WSC + (WSC * bonusWSC)

    -- See BG Wiki for reference. Chain Affinity is Double WSC. BLU Empyrean is Triple WSC
    -- when the set procs, and stacks with Chain Affinity for a maximum 4x WSC total.

    -- TODO: Modify multiplier to account for family bonus/penalty
    local finalD = math.floor(D + fStr + WSC) * multiplier

    -- print("Final D is ".. finalD)

    ----------------------------------------------
    -- Get the possible pDIF range and hit rate --
    ----------------------------------------------
    if (params.attkbonus == nil) then
		params.attkbonus = 0
	end
    if (params.AttkTPModifier == nil) then
		params.AttkTPModifier = false
	end
    if (params.atk300 == nil) then --Unused for now, but still in some files
		params.atk300 = 1.0
	end
    if (params.AccTPModifier == nil) then
		params.AccTPModifier = false
	end
    if (params.acc300 == nil) then
		params.acc300 = 0
	end
    if (params.CritTPModifier == nil) then
		params.CritTPModifier = false
	end
    if (params.crit300 == nil) then
		params.crit300 = 0
	end
		
	local AttkTPBonus =  1
	local AttkTPModifier = 0
	local CritTPBonus =  0
	local SpellCritPdifModifier = 0

	tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
	chainAffinity = caster:getStatusEffect(tpz.effect.CHAIN_AFFINITY)

    if chainAffinity ~= nil then
		if params.AttkTPModifier == true then --Check if "Attack varies with TP"
			AttkTPModifier =  getAttkTPModifier(caster:getTP()) 
		end
		if params.CritTPModifier == true then --Check if "Chance of critical strike varies with TP"
            CritTPBonus = 0.05
			CritTPBonus = CritTPBonus + getCritTPModifier(caster:getTP())
            CritTPBonus = CritTPBonus + target:getMod(tpz.mod.ENEMYCRITRATE)/100
            --caster:PrintToPlayer(string.format("native physical spell crit rate was %d", CritTPBonus*100))
		end
	end

    -- Ranged spells alawys have a chance to crit
    if isRanged then -- Ranged uses dAGI
        local nativecrit = 0.05
        local dAGI = (caster:getStat(tpz.mod.AGI) - target:getStat(tpz.mod.AGI))
        SpellCritPdifModifier = 1
        if dAGI > 0 then
            nativecrit = nativecrit + math.floor(dAGI/10)/100 -- no known cap
        nativecrit = nativecrit + caster:getMod(tpz.mod.CRITHITRATE)/100 + caster:getMerit(tpz.merit.CRIT_HIT_RATE)/100
                                + target:getMod(tpz.mod.ENEMYCRITRATE)/100  - target:getMerit(tpz.merit.ENEMY_CRIT_RATE)/100
            --caster:PrintToPlayer(string.format("native ranged spell crit rate was %d", nativecrit*100))
        end
        -- Always minimum 5% native crit
        if nativecrit < 0.05 then
            nativecrit = 0.05
        end
        if math.random() < nativecrit then
            SpellCritPdifModifier = 1.25 + ((caster:getMod(tpz.mod.CRIT_DMG_INCREASE) / 100) - (target:getMod(tpz.mod.CRIT_DEF_BONUS) / 100)) -- It crit!
            --caster:PrintToPlayer(string.format("Your ramged spell Crit!"))
        end
        -- Non-ranged spells require CA and "Chance to crit varies with TP" mod to have a chance to crit.
    elseif CritTPBonus > 0 then
        if math.random() < CritTPBonus then
            SpellCritPdifModifier = 1 + ((caster:getMod(tpz.mod.CRIT_DMG_INCREASE) / 100) - (target:getMod(tpz.mod.CRIT_DEF_BONUS) / 100)) -- It crit!
            --caster:PrintToPlayer(string.format("Your physical spell Crit!"))
        end
	else
		SpellCritPdifModifier = 0 -- It didn't crit
    end
	
	if caster:hasStatusEffect(tpz.effect.SNEAK_ATTACK) and spell:isAoE() == 0 and params.attackType ~= tpz.attackType.RANGED and caster:isBehind(target) then -- Has sneak attack
		SpellCritPdifModifier = 1 + ((caster:getMod(tpz.mod.CRIT_DMG_INCREASE) / 100) - (target:getMod(tpz.mod.CRIT_DEF_BONUS) / 100))
	end
	
	local BluAttkModifier = params.attkbonus + AttkTPModifier --End multiplier attack bonuses to bluphysattk
	if BluAttkModifier == 0 then --Don't want to multiply by 0 in bluphysattk forrmula
		BluAttkModifier = 1
	end

	local bluphysattk = caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
    --printf("Attack after Skill.. %u", bluphysattk)
    -- Add attack from food/gear/JA's
    bluphysattk = bluphysattk + caster:getStat(tpz.mod.ATT)
    --printf("Attack after food/gear/jas.. %u", bluphysattk)
    -- Remove skill from weapon(sword/club/etc)
    if (caster:getWeaponSkillType(tpz.slot.MAIN) == tpz.skill.SWORD) then
        bluphysattk = bluphysattk - (caster:getSkillLevel(tpz.skill.SWORD) + caster:getMod(tpz.mod.SKILL_SWORD))
    end
    if (caster:getWeaponSkillType(tpz.slot.MAIN) == tpz.skill.CLUB) then
        bluphysattk = bluphysattk - (caster:getSkillLevel(tpz.skill.CLUB) + caster:getMod(tpz.mod.CLUB))
    end
    --printf("Attack after weapon skill removed.. %u", bluphysattk)
    -- Add Physical Potency merits https://www.bg-wiki.com/ffxi/Merit_Points#Blue_Mage
    -- Add attack from TP bonus and attack bonus on specific BLU spells
    bluphysattk = math.floor(bluphysattk * BluAttkModifier)
    --printf("Attack after TP bonus.. %u", bluphysattk)
    if (params.offcratiomod == nil) then -- default to attack. Pretty much every physical spell will use this, Cannonball being the exception.
        params.offcratiomod = bluphysattk
    end
    local physPotency = 1 + ((caster:getMerit(tpz.merit.PHYSICAL_POTENCY) / 100))
    bluphysattk = math.floor(bluphysattk * physPotency)
    --printf("Attack after potency merits.. %u", bluphysattk)
    -- print(params.offcratiomod)
    local cratio = BluecRatio(params.offcratiomod / target:getStat(tpz.mod.DEF), caster:getMainLvl(), target:getMainLvl())
    local rangedcratio = BluecRangedRatio(params.offcratiomod / target:getStat(tpz.mod.DEF), caster:getMainLvl(), target:getMainLvl())
    local hitrate = BlueGetHitRate(caster, target, true, params)
    -- print("Hit rate "..hitrate)
    -- print("pdifmin "..cratio[1].." pdifmax "..cratio[2])

    -------------------------
    -- Perform the attacks --
    -------------------------
    local hitsdone = 0
    local hitslanded = 0
    local finaldmg = 0

    while (hitsdone < params.numhits) do
        if (target:getHP() <= finaldmg) then break end -- Stop adding hits if target would die before calculating other hits
        local chance = math.random()
        if (chance <= hitrate) then -- it hit
            -- TODO: Check for shadow absorbs.

            -- Generate a random pDIF between min and max
            local pdif = 1
            if isRanged then
                pdif = math.random((rangedcratio[1]*1000), (rangedcratio[2]*1000))
                pdif = pdif/1000 * SpellCritPdifModifier
                --printf("Ranged pdif: %s", pdif)
            else
                pdif = math.random((cratio[1]*1000), (cratio[2]*1000))
                pdif = pdif/1000 + SpellCritPdifModifier
                --printf("Melee pdif: %s", pdif)
            end

            -- Apply it to our final D
            if (hitsdone == 0) then -- only the first hit benefits from multiplier
                finaldmg = finaldmg + (finalD * pdif)
            else
                finaldmg = finaldmg + ((math.floor(D + fStr + WSC)) * pdif) -- same as finalD but without multiplier (it should be 1.0)
            end

            --handling phalanx
            finaldmg = finaldmg - target:getMod(tpz.mod.PHALANX)

            hitslanded = hitslanded + 1
            -- increment target's TP (100TP per hit landed)
			local subtleblow = (caster:getMod(tpz.mod.SUBTLE_BLOW) / 100)
			local TP =  (hitslanded  + 100) - hitslanded * (1 - subtleblow)
            target:addTP(TP)
        end

        hitsdone = hitsdone + 1
    end

    -- Weapon resist
    finaldmg = finaldmg * utils.HandleWeaponResist(target, params.damageType)
    
    -- Circle Effects
    if target:isMob() and finaldmg > 0 then
        local ecoC = target:getSystem()
        local circlemult = 100
        local mod = 0

        if     ecoC == 1  then mod = 1226
        elseif ecoC == 2  then mod = 1228
        elseif ecoC == 3  then mod = 1232
        elseif ecoC == 6  then mod = 1230
        elseif ecoC == 8  then mod = 1225
        elseif ecoC == 9  then mod = 1234
        elseif ecoC == 10 then mod = 1233
        elseif ecoC == 14 then mod = 1227
        elseif ecoC == 16 then mod = 1238
        elseif ecoC == 15 then mod = 1237
        elseif ecoC == 17 then mod = 1229
        elseif ecoC == 19 then mod = 1231
        elseif ecoC == 20 then mod = 1224
        end

        if mod > 0 then
            circlemult = 100 + caster:getMod(mod)
        end

        finaldmg = math.floor(finaldmg * circlemult / 100)
    end

    -- Handle Positional PDT
    if caster:isInfront(target, 90) and target:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) then -- Front
        if target:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):getPower() == 3 then
            finaldmg = 0
        end
        if target:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):getPower() == 5 then
            finaldmg = math.floor(finaldmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):getPower() == 6 then
            finaldmg = math.floor(finaldmg * 0.50) -- 50% DR
        end
    end
    if caster:isBehind(target, 90) and target:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) then -- Behind
        if target:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):getPower() == 4 then
            finaldmg = 0
        end
        if target:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):getPower() == 7 then
            finaldmg = math.floor(finaldmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):getPower() == 8 then
            finaldmg = math.floor(finaldmg * 0.50) -- 50% DR
        end
    end

    if finaldmg == 0 then
        spell:setMsg(tpz.msg.basic.MAGIC_FAIL)
    end

    -- print("Hits landed "..hitslanded.."/"..hitsdone.." for total damage: "..finaldmg)
    return finaldmg
end

-- Blue Magical type spells

function BlueMagicalSpell(caster, target, spell, params, statMod)
    local D = caster:getMainLvl() + 2

    if params.D ~= nil then D = params.D end -- breath attacks calculate their own D.

    if (D > params.duppercap) then
        D = params.duppercap
    end

    local ST = BlueGetWsc(caster, params) -- According to Wiki ST is the same as WSC, essentially Blue mage spells that are magical use the dmg formula of Magical type Weapon skills

    if (caster:hasStatusEffect(tpz.effect.BURST_AFFINITY)) then
        ST = ST * 2
    end


    local statBonus = 0
    local dStat = 0 -- Please make sure to add an additional stat check if there is to be a spell that uses neither INT, MND, or CHR. None currently exist.
    if (statMod == INT_BASED) then -- Stat mod is INT
        dStat = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    elseif (statMod == CHR_BASED) then -- Stat mod is CHR
        dStat = caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR)
    elseif (statMod == MND_BASED) then -- Stat mod is MND
        dStat = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
    end

    -- Only multiply positive dStat bonuses by the tMultiplier
    if (dStat > 0) then
        statBonus = (dStat)* params.tMultiplier
    else
        statBonus = dStat
    end

    D =(((D + ST) * params.multiplier) + statBonus)

    -- At this point according to wiki we apply standard magic attack calculations

    local magicAttack = 1.0
    local multTargetReduction = 1.0 -- Always 1.0
    magicAttack = math.floor(D * multTargetReduction)

    local rparams = {}
    rparams.diff = dStat
    rparams.skillType = tpz.skill.BLUE_MAGIC
    magicAttack = math.floor(magicAttack * applyResistance(caster, target, spell, rparams))

    local dmg = 0

    -- Use params.IGNORE_WSC and params.damage to set specific damage
    -- Only used for Self-Destruct ATM
    if (params.IGNORE_WSC ~= nil) then
        magicAttack = params.damage * applyResistance(caster, target, spell, rparams)
    end

    dmg = math.floor(addBonuses(caster, spell, target, magicAttack))

    if (dmg < 0) then
        dmg = 0
    end

    caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)

	if caster:hasStatusEffect(tpz.effect.CONVERGENCE) then
		local ConvergenceBonus = (1 + caster:getMerit(tpz.merit.CONVERGENCE) / 100)
		dmg = dmg * ConvergenceBonus
		caster:delStatusEffectSilent(tpz.effect.CONVERGENCE)
	end

    -- Handle Positional MDT
    if caster:isInfront(target, 90) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then -- Front
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 3 then
            dmg = 0
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 5 then
            dmg = math.floor(dmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 6 then
            dmg = math.floor(dmg * 0.50) -- 50% DR
        end
    end
    if caster:isBehind(target, 90) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then -- Behind
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 4 then
            dmg = 0
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 7 then
            dmg = math.floor(dmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 8 then
            dmg = math.floor(dmg * 0.50) -- 50% DR
        end
    end

    --handling phalanx
    dmg = dmg - target:getMod(tpz.mod.PHALANX)

	local subtleblow = (caster:getMod(tpz.mod.SUBTLE_BLOW) / 100)
	local TP =  100 * (1 - subtleblow)
	target:addTP(TP)

    return dmg
end

function BlueFinalAdjustments(caster, target, spell, dmg, params)
    local attackType = params.attackType or tpz.attackType.NONE
    local damageType = params.damageType or tpz.damageType.NONE
    if attackType == tpz.attackType.MAGICAL or attackType == tpz.attackType.SPECIAL then
        dmg = target:magicDmgTaken(dmg)
    elseif attackType == tpz.attackType.BREATH then
        dmg = target:breathDmgTaken(dmg)
    elseif attackType == tpz.attackType.RANGED then
        dmg = target:rangedDmgTaken(dmg)
    elseif attackType == tpz.attackType.PHYSICAL then
        dmg = target:physicalDmgTaken(dmg, damageType)
    end

    -- Handle Absorb
    if attackType == tpz.attackType.MAGICAL or attackType == tpz.attackType.BREATH or attackType == tpz.attackType.SPECIAL then
        local element = spell:getElement()
        dmg = adjustForTarget(target, dmg, element)
    end
    dmg = utils.clamp(dmg, -99999, 99999)
    -- Add HP if absorbed
    if (dmg < 0) then
        dmg = (target:addHP(-dmg))
        spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)
    else
        if attackType == tpz.attackType.MAGICAL or attackType == tpz.attackType.BREATH then
        --handling rampart stoneskin
            dmg = utils.rampartstoneskin(target, dmg)
            -- handling stoneskin
            dmg = utils.stoneskin(target, dmg)
            target:takeSpellDamage(caster, spell, dmg, attackType, damageType + spell:getElement())
        else
            -- handling stoneskin
            dmg = utils.stoneskin(target, dmg)
            target:takeDamage(dmg, caster, attackType, damageType)
        end
    end

    if (params.NO_ENMITY == nil) then -- Only used for Regurg / Corrosive Ooze atm
        target:updateEnmityFromDamage(caster, dmg)
    end
    target:handleAfflatusMiseryDamage(dmg)
    -- TP has already been dealt with.
    return dmg
end

-- Blue Breath Type spells
function BlueBreathSpell(caster, target, spell, params, hppercent)
    -- Formula is HP x gear x correlation x Magic Burst bonus x resist x dayweather bonus x mdt
    -- Get base damage
    local dmg = math.floor((caster:getMaxHP() * hppercent))

    -- Get element
    local element = spell:getElement()

    -- Get ecosystem
    local correlation = 0
    if (params.eco) ~= nil and target:isMob() then
        correlation = GetMonsterCorrelation(params.eco,GetTargetEcosystem(target))
    end

    -- Add bonus MACC(Mainly magic burst MACC)
    params.bonus = params.bonus + BluGetBonusMacc(caster, target, element, params)

    -- Add correlation MACC bonus
    if correlation > 0 then
        params.bonus = params.bonus + 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
    elseif correlation < 0 then
        params.bonus = params.bonus - 25 
    end

    -- Get resist
    local resist = applyResistance(caster, target, spell, params)


	-- Add convergence damage bonus
	if caster:hasStatusEffect(tpz.effect.CONVERGENCE) then
		local ConvergenceBonus = (1 + caster:getMerit(tpz.merit.CONVERGENCE) / 100)
		dmg = math.floor(dmg * ConvergenceBonus)
		caster:delStatusEffectSilent(tpz.effect.CONVERGENCE)
	end

	-- Add breath damage gear
	local head = caster:getEquipID(tpz.slot.HEAD)
    -- Saurian Helm and Mirage Keffiyeh(NQ/+1/+2)
	if head == 16150 or head == 11465 or head == 11466 or head == 10665 then 
		dmg = math.floor(dmg *1.1) 
	end

    -- Add correlation bonus
    if correlation > 0 then
        dmg = math.floor(dmg * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100))
    elseif correlation < 0 then
        dmg = math.floor(dmg * 0.75)
    end

    -- Add magic burst bonus
    params.AMIIburstBonus = 0
    local burst = calculateMagicBurst(caster, spell, target, params)

    if (burst > 1.0) then
        spell:setMsg(spell:getMagicBurstMessage()) -- "Magic Burst!"
    end

    dmg = math.floor(dmg * burst)

    -- Apply resist
    dmg = math.floor(dmg * resist)
    -- Add weather
    dmg = math.floor(dmg * BlueGetWeatherDayBonus(caster, element))

    caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)

    -- Cap damage for BLU mobs
    if caster:isMob() then
        if dmg > 500 then
            dmg = 500
        end
    end

    -- Handle Positional MDT
    if caster:isInfront(target, 90) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then -- Front
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 3 then
            dmg = 0
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 5 then
            dmg = math.floor(dmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 6 then
            dmg = math.floor(dmg * 0.50) -- 50% DR
        end
    end
    if caster:isBehind(target, 90) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then -- Behind
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 4 then
            dmg = 0
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 7 then
            dmg = math.floor(dmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 8 then
            dmg = math.floor(dmg * 0.50) -- 50% DR
        end
    end

    -- Handle Phalanx
    dmg = dmg - target:getMod(tpz.mod.PHALANX)

	local subtleblow = (caster:getMod(tpz.mod.SUBTLE_BLOW) / 100)
	local TP =  100 * (1 - subtleblow)
	target:addTP(TP)
    --printf("resist %i", resist*100)
    --printf("Correlation bonus: %i", correlation)
    --printf("final dmg %i", dmg)
    return dmg
end

------------------------------
-- Utility functions below ---
------------------------------

function BlueGetWsc(attacker, params)
    wsc = (attacker:getStat(tpz.mod.STR) * params.str_wsc + attacker:getStat(tpz.mod.DEX) * params.dex_wsc +
         attacker:getStat(tpz.mod.VIT) * params.vit_wsc + attacker:getStat(tpz.mod.AGI) * params.agi_wsc +
         attacker:getStat(tpz.mod.INT) * params.int_wsc + attacker:getStat(tpz.mod.MND) * params.mnd_wsc +
         attacker:getStat(tpz.mod.CHR) * params.chr_wsc) * BlueGetAlpha(attacker:getMainLvl())
    return wsc
end

-- Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function BluecRatio(ratio, atk_lvl, def_lvl)
    -- Level penalty...
    local levelcor = 0
    if (atk_lvl < def_lvl) then
        levelcor = 0.05 * (def_lvl - atk_lvl)
    end
    ratio = ratio - levelcor

    -- apply caps
    if (ratio<0) then
        ratio = 0
    elseif (ratio>2) then
        ratio = 2
    end

    -- Obtaining cRatio_MIN
    local cratiomin = 0
    if (ratio<1.25) then
        cratiomin = 1.2 * ratio - 0.5
    elseif (ratio>=1.25 and ratio<=1.5) then
        cratiomin = 1
    elseif (ratio>1.5 and ratio<=2) then
        cratiomin = 1.2 * ratio - 0.8
    end

    -- Obtaining cRatio_MAX
    local cratiomax = 0
    if (ratio<0.5) then
        cratiomax = 0.4 + 1.2 * ratio
    elseif (ratio<=0.833 and ratio>=0.5) then
        cratiomax = 1
    elseif (ratio<=2 and ratio>0.833) then
        cratiomax = 1.2 * ratio
    end
    cratio = {}
    if (cratiomin < 0) then
        cratiomin = 0
    end
    cratio[1] = cratiomin
    cratio[2] = cratiomax
    return cratio
end

function BluecRangedRatio(ratio, atk_lvl, def_lvl)
    -- Level penalty...
    local levelcor = 0
    if (atk_lvl < def_lvl) then
        levelcor = 0.025 * (def_lvl - atk_lvl)
    end
    ratio = ratio - levelcor

    if (ratio > 3 - levelcor) then
        ratio = 3 - levelcor
    end

    if (ratio < 0) then
        ratio = 0
    end

    -- min
    local cratiomin = 0
    if (ratio < 0.9) then
        cratiomin = ratio
    elseif (ratio < 1.1) then
        cratiomin = 1
    else
        cratiomin = (ratio * (20/19))-(3/19)
    end

    -- max
    local cratiomax = 0
    if (ratio < 0.9) then
        cratiomax = ratio * (10/9)
    elseif (ratio < 1.1) then
        cratiomax = 1
    else
        cratiomax = ratio
    end

    cratio = {}
    if (cratiomin < 0) then
        cratiomin = 0
    end
    cratio[1] = cratiomin
    cratio[2] = cratiomax
    return cratio
end

-- Gets the fTP multiplier by applying 2 straight lines between ftp1-ftp2 and ftp2-ftp3
-- tp - The current TP
-- ftp1 - The TP 0% value
-- ftp2 - The TP 150% value
-- ftp3 - The TP 300% value
function BluefTP(tp, ftp1, ftp2, ftp3)
    if tp >= 0 and tp < 1500 then
        return ftp1 + ((ftp2-ftp1) /1500) * tp
    elseif tp >= 1500 and tp <= 3000 then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ((ftp3-ftp2) / 1500) * (tp-1500)
    else
        print("blue fTP error: TP value is not between 0-3000!")
    end
    return 1 -- no ftp mod
end

function getTPModifier(tp)
  return 1.0 + (tp / 3000);
end

function getAttkTPModifier(tp)
  return 1.5 + (tp / 2000);
end

function getCritTPModifier(tp)
  return ((tp / 3000) * 100) / 100
end

function getAccTPModifier(tp)
  return (20+ ((tp - 1000) * 0.010))
end


function BluefSTR(dSTR)
    local fSTR = 0
    if (dSTR >= 12) then
        fSTR = (dSTR + 4) / 4
    elseif (dSTR >= 6) then
        fSTR = (dSTR + 6) / 4
    elseif (dSTR >= 1) then
        fSTR = (dSTR + 7) / 4
    elseif (dSTR >= -2) then
        fSTR = (dSTR + 8) / 4
    elseif (dSTR >= -7) then
        fSTR = (dSTR + 9) / 4
    elseif (dSTR >= -15) then
        fSTR = (dSTR + 10) / 4
    elseif (dSTR >= -21) then
        fSTR = (dSTR + 12) / 4
    else
        fSTR = (dSTR + 13) / 4
    end

    return fSTR
end

function BluefSTR2(dSTR)
    local fSTR2 = nil
    if (dSTR >= 12) then
        fSTR2 = ((dSTR+4)/2)
    elseif (dSTR >= 6) then
        fSTR2 = ((dSTR+6)/2)
    elseif (dSTR >= 1) then
        fSTR2 = ((dSTR+7)/2)
    elseif (dSTR >= -2) then
        fSTR2 = ((dSTR+8)/2)
    elseif (dSTR >= -7) then
        fSTR2 = ((dSTR+9)/2)
    elseif (dSTR >= -15) then
        fSTR2 = ((dSTR+10)/2)
    elseif (dSTR >= -21) then
        fSTR2 = ((dSTR+12)/2)
    else
        fSTR2 = ((dSTR+13)/2)
    end

    return fSTR2
end

function BlueGetHitRate(attacker, target, capHitRate, params)
    local AccTPBonus = 0
	tp = attacker:getTP() + attacker:getMerit(tpz.merit.ENCHAINMENT)
    if chainAffinity ~= nil then
		if params.AccTPModifier == true then --Check if "Accuracy varies with TP"
			AccTPBonus = getAccTPModifier(caster:getTP()) 
		end
	end
    local acc = attacker:getACC() + 30 + AccTPBonus + attacker:getMerit(tpz.merit.PHYSICAL_POTENCY) -- https://www.bluegartr.com/threads/37619-Blue-Mage-Best-thread-ever?p=2097460&viewfull=1#post2097460 
    local eva = target:getEVA()

    if (attacker:getMainLvl() > target:getMainLvl()) then -- acc bonus!
        acc = acc + ((attacker:getMainLvl()-target:getMainLvl())*4)
    elseif (attacker:getMainLvl() < target:getMainLvl()) then -- acc penalty :(
        acc = acc - ((target:getMainLvl()-attacker:getMainLvl())*4)
    end

    local hitdiff = 0
    local hitrate = 75
    if (acc>eva) then
        hitdiff = (acc-eva)/2
    end
    if (eva>acc) then
        hitdiff = ((-1)*(eva-acc))/2
    end

    hitrate = hitrate+hitdiff
    hitrate = hitrate/100


    -- Applying hitrate caps
    if (capHitRate) then -- this isn't capped for when acc varies with tp, as more penalties are due
        if (hitrate>0.99) then
            hitrate = 0.99
        end
        if (hitrate<0.2) then
            hitrate = 0.2
        end
    end
    return hitrate
end

function BlueTryEnfeeble(caster, target, spell, damage, power, tick, duration, params)
    local immunities = {
        { tpz.effect.SLEEP_I, 1},
        { tpz.effect.SLEEP_II, 1},
        { tpz.effect.SLEEP_I, 4096},
        { tpz.effect.SLEEP_II, 4096},
        { tpz.effect.POISON, 256},
        { tpz.effect.PARALYSIS, 32},
        { tpz.effect.BLINDNESS, 64},
        { tpz.effect.SILENCE, 16},
        { tpz.effect.STUN, 8},
        { tpz.effect.BIND, 4},
        { tpz.effect.WEIGHT, 2},
        { tpz.effect.SLOW, 128},
        { tpz.effect.ELEGY, 512},
        { tpz.effect.REQUIEM, 1024},
        { tpz.effect.LULLABY, 2048},
        { tpz.effect.LULLABY, 1},
        { tpz.effect.PETRIFICATION, 8192},
    }

    local effect = params.effect
    -- Check for immunity
    for i,statusEffect in pairs(immunities) do
        local immunity = 0
        if effect == statusEffect[1] then
            immunity = statusEffect[2]
        end
        if target:hasImmunity(immunity) then
            return false
        end
    end

    local resist = applyResistanceEffect(caster, target, spell, params)
    -- Check for resist trait proc
    if (resist == 0) then
        return false
    end

    if (spell:getMsg() ~= tpz.msg.basic.MAGIC_FAIL and resist >= 0.5) then
        duration = duration * resist
        target:addStatusEffect(params.effect, power, tick, duration)
        return true
    end
    return false
end

-- Function to stagger duration of effects by using the resistance to change the value
function getBlueEffectDuration(caster, resist, effect, varieswithtp)
    local duration = 0

    if (resist < 0.5) then
      resist = 0
    end

    if (effect == tpz.effect.BIND) then
        duration = 30 * resist
    elseif (effect == tpz.effect.STUN) then
        duration = 4 * resist
        -- printf("Duration of stun is %i", duration)
    elseif (effect == tpz.effect.WEIGHT) then
        duration = 120 * resist
    elseif (effect == tpz.effect.PARALYSIS) then
        duration = 180 * resist
    elseif (effect == tpz.effect.SLOW) then
        duration = 180 * resist
    elseif (effect == tpz.effect.SILENCE) then
        duration = 120 * resist
    elseif (effect == tpz.effect.POISON) then
        duration = 180 * resist
    elseif (effect == tpz.effect.PETRIFICATION) then
        duration = 8 * resist
    else
        duration = 180 * resist
    end

    if (varieswithtp and caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY)) then
        duration = duration * getTPModifier(caster:getTP())
    end

    return duration
end

function GetTargetEcosystem(target)
	local sys = target:getSystem()

    -- honestly just taking the topaz enum standard and converting it an easier enum standard
    -- this makes it very easy to explain the strengths/weaknesses (in the next function)

	if sys == 6 then return 1
	elseif sys == 14 then return 2
	elseif sys == 20 then return 3
	elseif sys == 17 then return 4
	elseif sys == 2 then return 5
	elseif sys == 1 then return 6
	elseif sys == 8 then return 7
	elseif sys == 19 then return 8
	elseif sys == 3 then return 9
	elseif sys == 10 then return 10
	elseif sys == 9 then return 11
	elseif sys == 15 then return 12
	elseif sys == 16 then return 13 end

	return 0
end

-- Gets ectosystem bonus / penalty
function GetMonsterCorrelation(eco,targeco)

    -- see top of document for the five ecosystem groups
    -- they work as a rotating rock-paper-scissors system for each group
    -- 1 beats 2 beats 3 beats 4 beats 1
    -- 5 beats 6 beats 7 beats 5
    -- 8/9 beat each other. 10/11 beat each other. 12/13 beat each other.
    -- https://ffxiclopedia.fandom.com/wiki/Category:Bestiary
    -- return value ... -1 = negative correlation, 0 = neutral, 1 = positive correlation

	if eco == 1 then
		if targeco == 2 then return  1 end
		if targeco == 4 then return -1 end
	elseif eco == 2 then
		if targeco == 3 then return  1 end
		if targeco == 1 then return -1 end
	elseif eco == 3 then
		if targeco == 4 then return  1 end
		if targeco == 2 then return -1 end
	elseif eco == 4 then
		if targeco == 1 then return  1 end
		if targeco == 3 then return -1 end
	elseif eco == 5 then
		if targeco == 6 then return  1 end
		if targeco == 7 then return -1 end
	elseif eco == 6 then
		if targeco == 7 then return  1 end
		if targeco == 5 then return -1 end
	elseif eco == 7 then
		if targeco == 5 then return  1 end
		if targeco == 6 then return -1 end
	elseif eco == 8 and targeco == 9 then
		return 1
	elseif eco == 9 and targeco == 8 then
		return 1
	elseif eco == 10 and targeco == 11 then
		return 1
	elseif eco == 11 and targeco == 10 then
		return 1
	elseif eco == 12 and targeco == 13 then
		return 1
	elseif eco == 13 and targeco == 12 then
		return 1
	end

	return 0
end

function BluGetBonusMacc(caster, target, element, params)
    local magicAccBonus = 0
    local skillchainTier, skillchainCount = FormMagicBurst(element, target)

    --add macc for skillchains
    if (skillchainTier > 0) then
        magicAccBonus = magicAccBonus + 50 -- 30 in retail
    end

    return magicAccBonus
end

function BlueGetWeatherDayBonus(caster, element)
    dayWeatherBonus = 1.00

    if caster:getWeather() == tpz.magic.singleWeatherStrong[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif caster:getWeather() == tpz.magic.singleWeatherWeak[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif caster:getWeather() == tpz.magic.doubleWeatherStrong[element] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif caster:getWeather() == tpz.magic.doubleWeatherWeak[element] then
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



-- obtains alpha, used for working out WSC
function BlueGetAlpha(level)
    local alpha = 1.00
    if (level <= 5) then
        alpha = 1.00
    elseif (level <= 11) then
        alpha = 0.99
    elseif (level <= 17) then
        alpha = 0.98
    elseif (level <= 23) then
        alpha = 0.97
    elseif (level <= 29) then
        alpha = 0.96
    elseif (level <= 35) then
        alpha = 0.95
    elseif (level <= 41) then
        alpha = 0.94
    elseif (level <= 47) then
        alpha = 0.93
    elseif (level <= 53) then
        alpha = 0.92
    elseif (level <= 59) then
        alpha = 0.91
    elseif (level <= 61) then
        alpha = 0.90
    elseif (level <= 63) then
        alpha = 0.89
    elseif (level <= 65) then
        alpha = 0.88
    elseif (level <= 67) then
        alpha = 0.87
    elseif (level <= 69) then
        alpha = 0.86
    elseif (level <= 71) then
        alpha = 0.85
    elseif (level <= 73) then
        alpha = 0.84
    elseif (level <= 75) then
        alpha = 0.83
    elseif (level <= 99) then
        alpha = 0.85
    end
    return alpha
end

