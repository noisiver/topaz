-----------------------------------------
-- Spell: Filamented Hold
-- Reduces the attack speed of enemies within a fan-shaped area originating from the caster
-- Slow II scaling
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+1
-- Level: 52
-- Casting Time: 2 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: Scission, Gravitation, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dMND = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
    local params = {}
    params.diff = dMND
    params.attribute = tpz.mod.MND
    params.skillType = tpz.skill.BLUE_MAGIC
    params.eco = ECO_VERMIN
    params.bonus = BlueHandleCorrelationMACC(caster, target, spell, params, 0)
    local resist = applyResistanceEffect(caster, target, spell, params)
    params.effect = tpz.effect.SLOW
    local power = utils.clamp(math.floor(dMND * 226 / 15) + 2380, 1250, 3510)

    if resist >= 0.5 then -- Do it!
        if target:addStatusEffect(params.effect, power, 0, getBlueEffectDuration(caster, resist, params.effect, true)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end
