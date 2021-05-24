-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	local skill = target:getSkillLevel(tpz.skill.SHIELD) * 15
    
	target:addMod(tpz.mod.SPIKES, 6)
     -- Spike damage is calculated on hit in battleutils::TakePhysicalDamage
    target:setMod(tpz.mod.SPIKES_DMG, 0)
	target:addMod(tpz.mod.SHIELD, skill)
    target:addMod(tpz.mod.SHIELDBLOCKRATE, 50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local skill = target:getSkillLevel(tpz.skill.SHIELD) * 15
    target:delMod(tpz.mod.SPIKES, 6)
    target:setMod(tpz.mod.SPIKES_DMG, 0)
	target:delMod(tpz.mod.SHIELD,  skill)
    target:delMod(tpz.mod.SHIELDBLOCKRATE, 50)
end
