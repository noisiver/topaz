-----------------------------------------
-- Spell: Refueling
-- Increases attack speed(10% magic haste) and grants refresh(2/tick)
-- Spell cost: 29 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: AGI+2
-- Level: 48
-- Casting Time: 1.5 seconds
-- Recast Time: 30 seconds
-- Duration: 5 minutes
--
-- Combos: None
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local typeEffect = tpz.effect.HASTE
    local power = 1000 -- 10%
    local duration = 300
    local typeEffect2 = tpz.effect.REFRESH
    local power2 = 2 
    local duration2 = 300

    if caster:hasStatusEffect(tpz.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration / 100)* diffMerit
        end

        caster:delStatusEffectSilent(tpz.effect.DIFFUSION)
    end

    if not target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    target:addStatusEffect(typeEffect2, power2, 3, duration2)

    return typeEffect
end
