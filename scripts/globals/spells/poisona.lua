-----------------------------------------
-- Spell: Poisona
-- Removes poison from target.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    if (target:hasStatusEffect(tpz.effect.POISON) == true) then
        local effect = target:getStatusEffect(tpz.effect.POISON)
        local effectFlags = effect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
            target:delStatusEffectSilent(tpz.effect.POISON)
            spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    end
    return tpz.effect.POISON
end
