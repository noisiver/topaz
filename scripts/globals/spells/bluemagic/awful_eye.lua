-----------------------------------------
-- Spell: Awful Eye
-- Lowers Strength of enemies within a fan-shaped area originating from the caster
-- Spell cost: 32 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 46
-- Casting Time: 2.5 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
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
        local typeEffectOne = tpz.effect.STR_DOWN
        local typeEffectTwo = tpz.effect.ATTACK_DOWN
        local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
        local params = {}
        params.diff = dINT
        params.attribute = tpz.mod.INT
        params.skillType = tpz.skill.BLUE_MAGIC
        params.eco = ECO_LIZARD
		local power = (caster:getMainLvl()  / 5) 

        if ((target:isFacing(caster))) then 
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
                BlueTryEnfeeble(caster, target, spell, damage, 17, 0, 180, params)
                spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
            else
                params.effect = typeEffectOne
                BlueTryEnfeeble(caster, target, spell, damage, 17, 0, 180, params)
                params.effect = typeEffectTwo
                BlueTryEnfeeble(caster, target, spell, damage, 8, 0, 180, params)
                spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
            end
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end

    return tpz.effect.STR_DOWN
end
