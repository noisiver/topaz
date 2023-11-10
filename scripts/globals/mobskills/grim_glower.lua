---------------------------------------------
-- Grim Glower
-- Description: Inflicts Petrification while eyes are glowing yellow and the player faces the enemy's gaze.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Conal gaze
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Can only used if not Blinded
    if (mob:hasStatusEffect(tpz.effect.BLINDNESS) == false) then
        return 0
    end
    -- Don't reuse when eyes are already glowing
    if os.time() < mob:getLocalVar("swapTimeGlower") then
        return 1
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
	mob:AnimationSub(1)
	mob:setLocalVar("swapTimeGlower", os.time() + 30)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end
