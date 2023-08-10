-----------------------------------------
-- Spell: Adloquium
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(1800, spell:getSkillType(), spell:getSpellGroup(), caster, target)
	duration = calculateDurationForLvl(duration, 40, target:getMainLvl())

    if not target:addStatusEffect(tpz.effect.REGAIN, 10, 3, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    end

    return tpz.effect.REGAIN
end
