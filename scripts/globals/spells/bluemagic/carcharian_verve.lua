-----------------------------------------
-- Spell: Carcharian Verve
-- Enhances attack and magic attack. Reduces spell interruption rate.
-- Spell cost: 28 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 5
-- Stat Bonus: INT+3 MND+3
-- Level: 74
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Attack Bonus of +20% and Magic Attack Bonus of +20 last for one minute.
-- Aquaveil effect lasts 15 minutes and prevents 10 interruptions.
-- Combos: Magic Attack Bonus
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/bluemagic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit
        end

        caster:delStatusEffectSilent(tpz.effect.DIFFUSION)
    end

    target:addStatusEffect(tpz.effect.ATTACK_BOOST, 20, 0, 300)
    target:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST, 20, 0, 300)
    target:addStatusEffect(tpz.effect.AQUAVEIL, 10, 0, 900)
    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)

    return tpz.effect.AQUAVEIL
end
