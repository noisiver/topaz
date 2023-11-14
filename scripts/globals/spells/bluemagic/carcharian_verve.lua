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
    local duration = 300
    local durationTwo = 900
    local aquaveilPower = 10 + caster:getMod(tpz.mod.AQUAVEIL_COUNT)

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit
            durationTwo = durationTwo + (durationTwo/100)* diffMerit
        end

        caster:delStatusEffectSilent(tpz.effect.DIFFUSION)
    end

    -- Apply unbridled duration mod
    duration = math.floor(duration * (1 + caster:getMod(tpz.mod.UNBRIDLED_DURATION) / 100))
    durationTwo = math.floor(durationTwo * (1 + caster:getMod(tpz.mod.UNBRIDLED_DURATION) / 100))

    target:delStatusEffectSilent(tpz.effect.AQUAVEIL)

    target:addStatusEffect(tpz.effect.ATTACK_BOOST, 20, 0, duration)
    target:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST, 20, 0, duration)
    target:addStatusEffect(tpz.effect.AQUAVEIL, aquaveilPower, 0, durationTwo)
    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)

    return tpz.effect.AQUAVEIL
end
