-----------------------------------------
-- Spell: Erase
--
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local effect = target:eraseStatusEffect()

	target:delStatusEffect(tpz.effect.POISON)
	target:delStatusEffect(tpz.effect.PARALYSIS)
	target:delStatusEffect(tpz.effect.SILENCE)
	target:delStatusEffect(tpz.effect.BLINDNESS)
	target:delStatusEffect(tpz.effect.DISEASE)
	target:delStatusEffect(tpz.effect.PLAGUE)
	target:delStatusEffect(tpz.effect.CURSE_I)
    if (effect == tpz.effect.NONE) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        spell:setMsg(tpz.msg.basic.MAGIC_ERASE)
    end

    return effect
end
