-----------------------------------------
-- Spell: Sandspray
-- Blinds enemies within a fan-shaped area originating from the caster
-- Spell cost: 43 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 66
-- Casting Time: 3 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Clear Mind
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
    local typeEffectOne = tpz.effect.BLINDNESS
    local typeEffectTwo = tpz.effect.MAGIC_ACC_DOWN
    local dINT = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)-- blind uses caster INT vs target MND
    local params = {}
    params.diff = nil
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    local returnEffect = typeEffectOne
    -- Min cap: 15 at -80 dINT
    -- Max cap: 45 
    local blindPotency = utils.clamp(math.floor(dINT / 3 * 8 + 45), 15, 45)

    if (target:hasStatusEffect(typeEffectOne) and target:hasStatusEffect(typeEffectTwo)) then -- the def/mag def down does not overwrite the same debuff from any other source
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    elseif (target:hasStatusEffect(typeEffectOne)) then
        params.effect = typeEffectTwo
        BlueTryEnfeeble(caster, target, spell, damage, 10, 0, 180, params)
        returnEffect = typeEffectTwo
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    elseif (target:hasStatusEffect(typeEffectTwo)) then
        params.effect = typeEffectOne
        BlueTryEnfeeble(caster, target, spell, damage, blindPotency, 0, 180, params)
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    else
        params.effect = typeEffectOne
        BlueTryEnfeeble(caster, target, spell, damage, blindPotency, 0, 180, params)
        params.effect = typeEffectTwo
        BlueTryEnfeeble(caster, target, spell, damage, 10, 0, 180, params)
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    end

    return returnEffect
end
