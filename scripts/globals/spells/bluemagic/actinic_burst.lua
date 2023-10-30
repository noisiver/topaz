-----------------------------------------
-- Spell: Actinic Burst
-- Greatly lowers the accuracy of enemies within range for a brief period of time
-- Spell cost: 24 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+2, HP+20
-- Level: 74
-- Casting Time: 0.5 seconds
-- Recast Time: 60 seconds
-- Effect Time: About 15 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local typeEffect = tpz.effect.FLASH
    local dMND = (caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND))
    local params = {}
    params.diff = dMND
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.eco = ECO_LUMINION
    params.bonus =  BlueHandleCorrelationMACC(caster, target, spell, 256)
    params.effect = tpz.effect.FLASH
    
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 12 * resist
    local power = 300

    -- Flash can't be applied if target is already flashed
    if target:hasStatusEffect(tpz.effect.FLASH) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return typeEffect
    end

    if (resist > 0.0625) then -- Do it!
        if (target:addStatusEffect(typeEffect, power, 3, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end
