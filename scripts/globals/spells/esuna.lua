-----------------------------------------
-- Spell: Esuna
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
    local removables = {tpz.effect.BLINDNESS, removables, tpz.effect.POISON, tpz.effect.CURSE_I, tpz.effect.SILENCE, tpz.effect.DISEASE, tpz.effect.PLAGUE}

    -- remove all effects if possible
    for i, effect in ipairs(removables) do

		if (target:getStatusEffect(removables) ~= nil) then
			target:delStatusEffect(removables)
			spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
		else
			spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
		end
			return removables
    end
end
