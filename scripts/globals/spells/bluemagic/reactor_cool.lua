-----------------------------------------
-- Spell: Reactor Cool
-- Enhances defense and covers you with magical ice spikes. Enemies that hit you take ice damage
-- Spell cost: 28 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 5
-- Stat Bonus: INT+3 MND+3
-- Level: 74
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 120 seconds (2 minutes)
--
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
    local typeEffectOne = tpz.effect.ICE_SPIKES
    local duration = 300
    local typeEffectTwo = tpz.effect.AQUAVEIL
    local powerTwo = 3
    local durationTwo = 900
    local returnEffect = typeEffectOne

    local INT = caster:getStat(tpz.mod.INT)
    local MAB = caster:getMod(tpz.mod.MATT)
    local powerOne = math.floor((INT + 50) / 20) * (1 + MAB / 100)

	if powerOne > 15 then
		powerOne = 15
	end

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit
        end

        caster:delStatusEffectSilent(tpz.effect.DIFFUSION)
    end

    if (target:addStatusEffect(typeEffectOne, powerOne, 0, duration) == false and target:addStatusEffect(typeEffectTwo, powerTwo, 0, duration) == false) then -- both statuses fail to apply
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return returnEffect
    elseif (target:addStatusEffect(typeEffectOne, powerOne, 0, duration) == false) then -- the first status fails to apply
        target:addStatusEffect(typeEffectTwo, powerTwo, 0, durationTwo)
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
        returnEffect = typeEffectTwo
    else
        target:addStatusEffect(typeEffectOne, powerOne, 0, duration)
		target:getStatusEffect(typeEffectOne):unsetFlag(tpz.effectFlag.DISPELABLE)
        target:addStatusEffect(typeEffectTwo, powerTwo, 0, durationTwo)
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    end

    -- For tracking what skill to use for spikes MACC formula in C++
    target:setCharVar("bluSpikes", 1)

    return returnEffect
end
