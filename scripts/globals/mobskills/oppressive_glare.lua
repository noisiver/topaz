---------------------------------------------
-- Oppressive Glare
-- Description: Inflicts terror and zombie while eyes are glowing blue and the player faces the enemy's gaze.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Conal gaze
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:isNM() then
		-- can only used if not binded
		if (mob:hasStatusEffect(tpz.effect.BLINDNESS) == false) then
			return 0
		end
	end
		return 1
end

function onMobWeaponSkill(target, mob, skill)
	mob:AnimationSub(2)
	mob:setLocalVar("swapTimeGlare", os.time() + 60)

    return 1
end
