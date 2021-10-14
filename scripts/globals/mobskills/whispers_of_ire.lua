---------------------------------------------
-- Whispers of Ire
-- Randomly absorbs 1 to 7 attributes from target.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

---------------------------------------------
-- Whispers of Ire
-- Randomly absorbs 2 to 5 attributes from target.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local roll = math.random(2, 5)
	if roll == 2 then -- Drain 2 status effects
		local EffectTypeOne = math.random(136, 138) -- 136 to 142 is STR to CHR statusID
		local EffectTypeTwo = math.random(139, 142)
		MobDrainAttribute(mob, target, EffectTypeOne, 10, 3, 120)
		skill:setMsg(MobDrainAttribute(mob, target, EffectTypeTwo, 10, 3, 120))
	elseif roll == 3 then -- Drain 3 status effects
		local EffectTypeOne = math.random(136, 137)
		local EffectTypeTwo = math.random(138, 139)
		local EffectTypeThree = math.random(140, 142)
		MobDrainAttribute(mob, target, EffectTypeOne, 10, 3, 120)
		MobDrainAttribute(mob, target, EffectTypeTwo, 10, 3, 120)
		skill:setMsg(MobDrainAttribute(mob, target, EffectTypeThree, 10, 3, 120))
	elseif roll == 4 then -- Drain 24status effects
		local EffectTypeOne = math.random(136, 137)
		local EffectTypeTwo = math.random(138, 139)
		local EffectTypeThree = math.random(140, 141)
		local EffectTypeFour = 142
		MobDrainAttribute(mob, target, EffectTypeOne, 10, 3, 120)
		MobDrainAttribute(mob, target, EffectTypeTwo, 10, 3, 120)
		MobDrainAttribute(mob, target, EffectTypeThree, 10, 3, 120)
		skill:setMsg(MobDrainAttribute(mob, target, EffectTypeFour, 10, 3, 120))
	elseif roll == 5 then -- Drain 5 status effects
		local EffectTypeOne = 136
		local EffectTypeTwo = 137
		local EffectTypeThree = 138
		local EffectTypeFour = math.random(139, 140)
		local EffectTypeFive = math.random(141, 142)
		MobDrainAttribute(mob, target, EffectTypeOne, 10, 3, 120)
		MobDrainAttribute(mob, target, EffectTypeTwo, 10, 3, 120)
		MobDrainAttribute(mob, target, EffectTypeThree, 10, 3, 120)
		MobDrainAttribute(mob, target, EffectTypeFour, 10, 3, 120)
		skill:setMsg(MobDrainAttribute(mob, target, EffectTypeFive, 10, 3, 120))
	end

    return 1
end