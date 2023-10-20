-----------------------------------------
-- Spell: Enervation
-- Lowers the defense and magical defense of enemies within range
-- Spell cost: 48 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 5
-- Stat Bonus: HP-5, MP+5
-- Level: 67
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Counter
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
    local typeEffectOne = tpz.effect.DEFENSE_DOWN
    local typeEffectTwo = tpz.effect.MAGIC_DEF_DOWN
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    local returnEffect = typeEffectOne

    if (target:hasStatusEffect(typeEffectOne) and target:hasStatusEffect(typeEffectTwo)) then -- the def/mag def down does not overwrite the same debuff from any other source
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    elseif (target:hasStatusEffect(typeEffectOne)) then
        params.effect = typeEffectTwo
        BlueTryEnfeeble(caster, target, spell, damage, 8, 0, 180, params)
        returnEffect = typeEffectTwo
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    elseif (target:hasStatusEffect(typeEffectTwo)) then
        params.effect = typeEffectOne
        BlueTryEnfeeble(caster, target, spell, damage, 8, 0, 180, params)
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    else
        params.effect = typeEffectOne
        BlueTryEnfeeble(caster, target, spell, damage, 8, 0, 180, params)
        params.effect = typeEffectTwo
        BlueTryEnfeeble(caster, target, spell, damage, 8, 0, 180, params)
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    end

    return returnEffect
end
