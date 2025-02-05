-----------------------------------------
-- Spell: Foe Requiem II
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local effect = tpz.effect.REQUIEM
    local duration = 79
    local power = 3

    local pCHR = caster:getStat(tpz.mod.CHR)
    local mCHR = target:getStat(tpz.mod.CHR)
    local dCHR = (pCHR - mCHR)
    local params = {}
    params.diff = dCHR
    params.attribute = tpz.mod.CHR
    params.skillType = tpz.skill.SINGING
    params.bonus = 0
    params.effect = effect
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
    if (resist < 0.5) then
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST) -- resist message
        return 1
    end
    local iBoost = caster:getMod(tpz.mod.REQUIEM_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost

    -- JP Bonus
    power = power + caster:getJobPointLevel(tpz.jp.REQUIEM_EFFECT) * 3

    if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
    end

    caster:delStatusEffectSilent(tpz.effect.MARCATO)

    duration = duration + ((iBoost * 7) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    -- Try to overwrite weaker Requiem
    if (canOverwrite(target, effect, power)) then
        TryApplyEffect(caster, target, spell, params.effect, power, 0, duration, resist, 0.5)
    end

    return effect
end
