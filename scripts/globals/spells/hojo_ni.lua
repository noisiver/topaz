-----------------------------------------
-- Spell: Hojo:Ichi
-- Description: Inflicts Slow on target.
-- Edited from slow.lua
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    --Duration and Resistance calculation
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.NINJUTSU
    params.bonus = 0
    local resist = applyResistance(caster, target, spell, params)
    
    local duration =  math.ceil(180 * resist)
    -- Spell succeeds if a 1 or 1/2 resist check is achieved
    if resist >= 0.5 then
        --Power for Hojo is a flat 14.6% reduction
        local power = 2000
        if target:addStatusEffect(tpz.effect.SLOW, power, 0, duration) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end

    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return tpz.effect.SLOW
end
