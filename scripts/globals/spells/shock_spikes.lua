-----------------------------------------
-- Spell: Shock Spikes
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(SPIKE_EFFECT_DURATION, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local typeEffect = tpz.effect.SHOCK_SPIKES
    
	local INT = caster:getStat(tpz.mod.INT)
    local MAB = caster:getMod(tpz.mod.MATT)
    local power = math.floor((INT + 50) / 20) * (1 + MAB / 100)

	if power > 15 then
		power = 15
	end

	-- Add Enhances effect of "Spikes" spells gear
    -- https://www.bg-wiki.com/ffxi/Dls._Tights_%2B2
	local legs = caster:getEquipID(tpz.slot.LEGS)
	if legs == 15121 or legs == 15584 then -- Duelist's Tights / +1
		power = power + math.floor(INT*(3/256))
	elseif legs == 10714 then -- Duelist's Tights +2
		power = power + math.floor(INT*(4/256))
	end

    if target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end
