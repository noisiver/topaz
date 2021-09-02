require("scripts/globals/status")
require("scripts/globals/magic")

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
    -- TODO: Under Chain affinity?
    -- TODO: Under Efflux?
    -- TODO: Merits.
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

    local fStr = BluefSTR(caster:getStat(tpz.mod.STR) - target:getStat(tpz.mod.VIT))
    if (fStr > 22) then
        fStr = 22 -- TODO: Smite of Rage doesn't have this cap applied.
    end

    -- print("fStr val is ".. fStr)

    local WSC = BlueGetWsc(caster, params)

    -- print("wsc val is ".. WSC)

    local multiplier = params.multiplier

    -- If under CA, replace multiplier with fTP(multiplier, tp150, tp300)
    local chainAffinity = caster:getStatusEffect(tpz.effect.CHAIN_AFFINITY)
    if chainAffinity ~= nil then
        -- Calculate the total TP available for the fTP multiplier.
        local tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
        if tp > 3000 then
            tp = 3000
        end

        multiplier = BluefTP(tp, multiplier, params.tp150, params.tp300)
    end

    -- TODO: Modify multiplier to account for family bonus/penalty
    local finalD = math.floor(D + fStr + WSC) * multiplier

    -- print("Final D is ".. finalD)

    ----------------------------------------------
    -- Get the possible pDIF range and hit rate --
    ----------------------------------------------
    if (params.attkbonus == nil) then
		params.attkbonus = 1.0
	end
    if (params.AttkTPModifier == nil) then
		params.AttkTPModifier = false
	end
    if (params.atk300 == nil) then
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
	local AttkTPModifier = 1
	local CritTPBonus =  0
	local SpellCrit = 0
	tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
	chainAffinity = caster:getStatusEffect(tpz.effect.CHAIN_AFFINITY)
    if chainAffinity ~= nil then
		if params.AttkTPModifier == true then
			AttkTPModifier =  getAttkTPModifier(caster:getTP())
		end
		if params.CritTPModifier == true then
			CritTPBonus = getCritTPModifier(caster:getTP()) 
		end
	end

    if CritTPBonus > 1 then
        if math.random(100) < CritTPBonus then
            SpellCrit = 1
        end
	else
		SpellCrit = 0
    end

	local bluphysattk = (((caster:getSkillLevel(tpz.skill.BLUE_MAGIC) + 8 + (caster:getStat(tpz.mod.STR) / 2))) * (params.attkbonus + AttkTPModifier)) 
    if (params.offcratiomod == nil) then -- default to attack. Pretty much every physical spell will use this, Cannonball being the exception.
        params.offcratiomod = bluphysattk
    end
    -- print(params.offcratiomod)
    local cratio = BluecRatio(params.offcratiomod / target:getStat(tpz.mod.DEF), caster:getMainLvl(), target:getMainLvl()) 
    local hitrate = BlueGetHitRate(caster, target, true)
    -- print("Hit rate "..hitrate)
    -- print("pdifmin "..cratio[1].." pdifmax "..cratio[2])

    -------------------------
    -- Perform the attacks --
    -------------------------
    local hitsdone = 0
    local hitslanded = 0
    local finaldmg = 0

    while (hitsdone < params.numhits) do
        local chance = math.random()
        if (chance <= hitrate) then -- it hit
            -- TODO: Check for shadow absorbs.

            -- Generate a random pDIF between min and max
            local pdif = math.random((cratio[1]*1000), (cratio[2]*1000))
            pdif = pdif/1000 + SpellCrit

            -- Apply it to our final D
            if (hitsdone == 0) then -- only the first hit benefits from multiplier
                finaldmg = finaldmg + (finalD * pdif)
            else
                finaldmg = finaldmg + ((math.floor(D + fStr + WSC)) * pdif) -- same as finalD but without multiplier (it should be 1.0)
            end

            hitslanded = hitslanded + 1
            -- increment target's TP (100TP per hit landed)
			local subtleblow = (caster:getMod(tpz.mod.SUBTLE_BLOW) / 100)
			local TP =  (hitslanded  + 99) * (1 - subtleblow)
            target:addTP(TP)
			GetPlayerByID(6):PrintToPlayer(string.format("TP Given %u",TP))
        end

        hitsdone = hitsdone + 1
    end
    local hthres = target:getMod(tpz.mod.HTHRES)
    local pierceres = target:getMod(tpz.mod.PIERCERES)
    local impactres = target:getMod(tpz.mod.IMPACTRES)
    local slashres = target:getMod(tpz.mod.SLASHRES)
    local spdefdown = target:getMod(tpz.mod.SPDEF_DOWN)
    
    if params.damageType == tpz.damageType.HTH then
        if hthres < 1000 then
            finaldmg = finaldmg * (1 - ((1 - hthres / 1000) * (1 - spdefdown/100)))
        else
            finaldmg = finaldmg * hthres / 1000
        end
    elseif params.damageType == tpz.damageType.PIERCING then
        if pierceres < 1000 then
            finaldmg = finaldmg * (1 - ((1 - pierceres / 1000) * (1 - spdefdown/100)))
        else
            finaldmg = finaldmg * pierceres / 1000
        end
    elseif params.damageType == tpz.damageType.BLUNT then
        if impactres < 1000 then
            finaldmg = finaldmg * (1 - ((1 - impactres / 1000) * (1 - spdefdown/100)))
        else
            finaldmg = finaldmg * impactres / 1000
        end
    elseif params.damageType == tpz.damageType.SLASHING then
        if slashres < 1000 then
            finaldmg = finaldmg * (1 - ((1 - slashres / 1000) * (1 - spdefdown/100)))
        else
            finaldmg = finaldmg * slashres / 1000
        end
    end
    
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

    if finaldmg == 0 then
        spell:setMsg(tpz.msg.basic.MAGIC_FAIL)
    end

    -- print("Hits landed "..hitslanded.."/"..hitsdone.." for total damage: "..finaldmg)

    return finaldmg
end

-- Blue Magical type spells

function BlueMagicalSpell(caster, target, spell, params, statMod)
    local D = caster:getMainLvl() + 2

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
        statBonus = (dStat)* params.tMultiplier
    elseif (statMod == CHR_BASED) then -- Stat mod is CHR
        dStat = caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR)
        statBonus = (dStat)* params.tMultiplier
    elseif (statMod == MND_BASED) then -- Stat mod is MND
        dStat = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
        statBonus = (dStat)* params.tMultiplier
    end

    D =(((D + ST) * params.multiplier) + statBonus)

    -- At this point according to wiki we apply standard magic attack calculations

    local magicAttack = 1.0
    local multTargetReduction = 1.0 -- TODO: Make this dynamically change, temp static till implemented.
    magicAttack = math.floor(D * multTargetReduction)

    local rparams = {}
    rparams.diff = dStat
    rparams.skillType = tpz.skill.BLUE_MAGIC
    magicAttack = math.floor(magicAttack * applyResistance(caster, target, spell, rparams))

    local dmg = math.floor(addBonuses(caster, spell, target, magicAttack))

    caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)
	if caster:hasStatusEffect(tpz.effect.CONVERGENCE) then
		local ConvergenceBonus = (1 + caster:getMerit(tpz.merit.CONVERGENCE) / 100)
		dmg = dmg * ConvergenceBonus
		caster:delStatusEffectSilent(tpz.effect.CONVERGENCE)
	end
	local subtleblow = (caster:getMod(tpz.mod.SUBTLE_BLOW) / 100)
	local TP =  100 * (1 - subtleblow)
	target:addTP(TP)

    return dmg
end

function BlueFinalAdjustments(caster, target, spell, dmg, params)
    if (dmg < 0) then
        dmg = 0
    end

    dmg = dmg * BLUE_POWER

    dmg = dmg - target:getMod(tpz.mod.PHALANX)
    if (dmg < 0) then
        dmg = 0
    end

    -- handling stoneskin
    dmg = utils.stoneskin(target, dmg)

    local attackType = params.attackType or tpz.attackType.NONE
    local damageType = params.damageType or tpz.damageType.NONE
    if attackType == tpz.attackType.MAGICAL or attackType == tpz.attackType.SPECIAL or attackType == tpz.attackType.BREATH then
        dmg = target:magicDmgTaken(dmg)
    elseif attackType == tpz.attackType.RANGED then
        dmg = target:rangedDmgTaken(dmg)
    elseif attackType == tpz.attackType.PHYSICAL then
        dmg = target:physicalDmgTaken(dmg, damageType)
    end

	target:takeDamage(dmg, caster, attackType, damageType)
    target:updateEnmityFromDamage(caster, dmg)
    target:handleAfflatusMiseryDamage(dmg)
    -- TP has already been dealt with.
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

-- Gets the fTP multiplier by applying 2 straight lines between ftp1-ftp2 and ftp2-ftp3
-- tp - The current TP
-- ftp1 - The TP 0% value
-- ftp2 - The TP 150% value
-- ftp3 - The TP 300% value
function BluefTP(tp, ftp1, ftp2, ftp3)
    if (tp >= 0 and tp < 1500) then
        return ftp1 + ( ((ftp2-ftp1)/100) * (tp / 10))
    elseif (tp >= 1500 and tp <= 3000) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/100) * ((tp-1500) / 10))
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
  return (tp / 3000) * 100;
end

function getAccTPModifier(tp)
  return (20+ ((tp - 1000) * 0.010))
end


function BluefSTR(dSTR)
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

function BlueGetHitRate(attacker, target, capHitRate)
    local AccTPBonus = 0
	tp = attacker:getTP() + attacker:getMerit(tpz.merit.ENCHAINMENT)
    if chainAffinity ~= nil then
		if params.AccTPModifier == true then
			AccTPBonus = getAccTPModifier(caster:getTP()) 
		end
	end
    local acc = attacker:getACC() + 35 + AccTPBonus 
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
        if (hitrate>0.95) then
            hitrate = 0.95
        end
        if (hitrate<0.2) then
            hitrate = 0.2
        end
    end
    return hitrate
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
        duration = 60 * resist
    elseif (effect == tpz.effect.PARALYSIS) then
        duration = 120 * resist
    elseif (effect == tpz.effect.SLOW) then
        duration = 120 * resist
    elseif (effect == tpz.effect.SILENCE) then
        duration = 90 * resist
    elseif (effect == tpz.effect.POISON) then
        duration = 90 * resist
    else
        duration = 120 * resist
    end

    if (varieswithtp and caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY)) then
        duration = duration * getTPModifier(caster:getTP())
    end

    return duration
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

