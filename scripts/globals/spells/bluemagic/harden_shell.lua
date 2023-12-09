-----------------------------------------
-- Spell: Harden Shell
-- Grants Protect V and Shell V
-- Spell cost: 10 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 1
-- Stat Bonus: VIT+3
-- Level: 8
-- Casting Time: 1.75 seconds
-- Recast Time: 60 seconds
-- Duration: 90 seconds
--
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
    local duration = 300

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit
        end

        caster:delStatusEffectSilent(tpz.effect.DIFFUSION)
    end

    -- Apply unbridled duration mod
    duration = math.floor(duration * (1 + caster:getMod(tpz.mod.UNBRIDLED_DURATION) / 100))

    target:addStatusEffect(tpz.effect.PROTECT, 60, 0, duration)
    target:addStatusEffect(tpz.effect.SHELL, 24, 0, duration)

    return tpz.effect.PROTECT
end
