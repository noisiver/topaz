-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end
--[[
function onSpellCast(caster, target, spell)
    -- Pull base stats.
    local dINT = (caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND))

    local params = {}

    params.diff = nil

    params.attribute = tpz.mod.INT

    params.skillType = tpz.skill.DIVINE_MAGIC

    params.bonus =  150

    params.effect = nil

    local resist = applyResistance(caster, target, spell, params)
    local duration = 12 * resist

    if (resist > 0.0625) then
        if (target:addStatusEffect(tpz.effect.FLASH, 200, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
    return tpz.effect.FLASH
end
--]]
function onSpellCast(caster, target, spell)
    -- Pull base stats.
    local dMND = (caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND))

    local params = {}

    params.diff = dMND

    params.attribute = tpz.mod.MND

    params.skillType = tpz.skill.DIVINE_MAGIC

    params.bonus =  200

    params.effect = tpz.effect.FLASH

    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 12 * resist
    duration = math.ceil(duration * tryBuildResistance(tpz.magic.buildcat.BLIND, target))

     -- Flash can't be applied if target is already flashed
    if target:hasStatusEffect(params.effect) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return params.effect
    end

    if (resist >= 0.0625) then
        if (target:addStatusEffect(params.effect, 300, 3, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
            CheckForMagicBurst(caster, spell, target)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
	caster:delStatusEffectSilent(tpz.effect.DIVINE_EMBLEM)
    return params.effect
end