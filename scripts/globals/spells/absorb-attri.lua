-----------------------------------------
-- Spell: Absorb Attribute
-- Steals an enemy's buff
-- Spell Type: Magical (Dark)
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.DARK_MAGIC
    params.bonus = 175
    local resist = applyResistanceEffect(caster, target, spell, params)
    local stolen = 0

    if resist >= 0.5 then
        stolen = caster:stealStatusEffect(target)
        if stolen ~= 0 then
            spell:setMsg(tpz.msg.basic.MAGIC_STEAL)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return stolen
end
