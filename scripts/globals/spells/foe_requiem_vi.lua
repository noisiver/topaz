-----------------------------------------
-- Spell: Foe Requiem VI
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
    local duration = 143
    local power = 55

    if (sLvl+iLvl > 204) then
        power = power + 10
    elseif (sLvl+iLvl > 211) then
        power = power + 15
    elseif (sLvl+iLvl > 218) then
        power = power + 20
    elseif (sLvl+iLvl > 229) then
        power = power + 25
    elseif (sLvl+iLvl > 239) then
        power = power + 30
    elseif (sLvl+iLvl > 249) then
        power = power + 35
    end

    local pCHR = caster:getStat(tpz.mod.CHR)
    local mCHR = target:getStat(tpz.mod.CHR)
    local dCHR = (pCHR - mCHR)
    local params = {}
    params.diff = nil
    params.attribute = tpz.mod.CHR
    params.skillType = tpz.skill.SINGING
    params.bonus = 0
    params.effect = nil
    resm = applyResistance(caster, target, spell, params)
   --[[ if (resm < 0.25) then
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST) -- resist message
        return 1
    end
    --]]
        if caster:isPC() then
        local instrument = caster:getSkillLevel(caster:getWeaponSkillType(tpz.slot.RANGED))
        local skillcap = caster:getMaxSkillLevel(caster:getMainLvl(), tpz.job.BRD, tpz.skill.STRING_INSTRUMENT) -- will return the same whether string or wind, both are C for bard
    
        if instrument > skillcap then
            params.skillBonus = instrument - skillcap -- every point over the skillcap (only attainable from gear/merits) is an extra +1 magic accuracy
        end
    end
    resm = applyResistance(caster, target, spell, params)
    if (resm < 0.5) then
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST) -- resist message
        return 1
    end
    -- level 75 gets a bonus
    if (caster:getMainLvl() >= 75) then
        power = power + 1
    end

    local iBoost = caster:getMod(tpz.mod.REQUIEM_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost

    if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(tpz.effect.MARCATO)

    duration = duration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        duration = duration * 2
    end
    -- Try to overwrite weaker slow / haste
    if (canOverwrite(target, effect, power)) then
        -- overwrite them
        target:delStatusEffect(effect)
        target:addStatusEffect(effect, power, 3, duration)
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return effect
end
