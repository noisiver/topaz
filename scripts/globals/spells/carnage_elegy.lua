-----------------------------------------
-- Spell: Carnage Elegy
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 180
    local power = 5000

    local pCHR = caster:getStat(tpz.mod.CHR)
    local mCHR = target:getStat(tpz.mod.CHR)
    local dCHR = pCHR - mCHR
    local params = {}
    params.diff = dCHR
    params.attribute = tpz.mod.CHR
    params.skillType = tpz.skill.SINGING
    params.bonus = 0
    params.effect = tpz.effect.ELEGY
    params.skillBonus = 0
    if caster:isPC() then
        local sLvl = caster:getSkillLevel(tpz.skill.SINGING) -- Gets skill level of Singing
        local iLvl = caster:getWeaponSkillLevel(tpz.slot.RANGED)
        local skillcap = caster:getMaxSkillLevel(caster:getMainLvl(), tpz.job.BRD, tpz.skill.STRING_INSTRUMENT) -- will return the same whether string or wind, both are C for bard
        
        local rangedType = caster:getWeaponSkillType(tpz.slot.RANGED)
        if rangedType ~= tpz.skill.STRING_INSTRUMENT and rangedType ~= tpz.skill.WIND_INSTRUMENT then iLvl = sLvl end
        
        if sLvl + iLvl > skillcap*2 then
            params.skillBonus = sLvl + iLvl - skillcap*2 -- every point over the skillcap (only attainable from gear/merits) is an extra +1 magic accuracy
        end
    end

    resist = applyResistanceEffect(caster, target, spell, params)

    local iBoost = caster:getMod(tpz.mod.ELEGY_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost * 100

    if caster:hasStatusEffect(tpz.effect.SOUL_VOICE) then
        power = power * 1
    elseif caster:hasStatusEffect(tpz.effect.MARCATO) then
        power = power * 1
    end
    caster:delStatusEffectSilent(tpz.effect.MARCATO)

    duration = duration + (iBoost * 18 + caster:getMod(tpz.mod.SONG_DURATION_BONUS) / 100 + 1)
    duration = math.ceil(duration * tryBuildResistance(tpz.magic.buildcat.SLOW, target))

    if caster:hasStatusEffect(tpz.effect.TROUBADOUR) then
        duration = duration * 2
    end
		
	-- Cap slow at 50%
	if power > 5000 then
		power = 5000
	end

    TryApplyEffect(caster, target, spell, params.effect, 1, 0, duration, resist, 0.5)


    return params.effect
end
