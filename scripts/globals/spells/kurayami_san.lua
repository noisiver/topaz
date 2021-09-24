-----------------------------------------
-- Spell: Kurayami:Ni
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    -- Base Stats
    local params = {}
    params.diff = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.NINJUTSU
    params.bonus = 0
    local resist = applyResistance(caster, target, spell, params)

    if (resist < 0.5) then
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST) -- resist message
        return 1
    end
   --Kurayami base power is 30 and is not affected by resistaces.
	local effect = tpz.effect.BLINDNESS
	local power = 80
    local duration = math.ceil(420 * resist)
    -- Try to overwrite weaker blind
    if (canOverwrite(target, effect, power)) then
        -- overwrite them
        target:delStatusEffectSilent(effect)
        target:addStatusEffect(effect, power, 0, duration)
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return effect
end
