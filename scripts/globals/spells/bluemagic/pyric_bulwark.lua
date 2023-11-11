-----------------------------------------
-- Spell: Pyric Bulwark
-- Grants ncreases Chance of parrying and gives an enmity bonus upon a successful parry attempt.
-- Spell cost: 10 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 1
-- Stat Bonus: VIT+3
-- Level: 8
-- Casting Time: 1.75 seconds
-- Recast Time: 60 seconds
-- Duration: 5 minutes
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 60

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit
        end

        caster:delStatusEffectSilent(tpz.effect.DIFFUSION)
    end

    -- Apply unbridled duration mod
    duration = math.floor(duration * (1 + caster:getMod(tpz.mod.UNBRIDLED_DURATION) / 100))

    target:addStatusEffect(tpz.effect.ISSEKIGAN, 50, 0, 60)

    return tpz.effect.ISSEKIGAN
end
