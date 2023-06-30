--------------------------------------
-- Spell: Myoshu: Ichi
-- Grants "Endark" effect
--------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
--------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local effect = tpz.effect.ENDARK
    local magicskill = target:getSkillLevel(tpz.skill.NINJUTSU)
    local potency = math.floor((magicskill / 8) + 12.5)

    if target:addStatusEffect(effect, potency, 0, 1800) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end

