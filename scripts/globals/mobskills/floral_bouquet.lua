---------------------------------------------
-- Floral Bouquet
-- Family: Rafflesia
-- Description: Inflicts Sleep + charms nearby Bees in AOE. Ignores shadows.
-- Type: Enfeebling
---------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() > 50 and mob:getPool() == 3326) then
        -- Raskovnik doesn't use this for the 1st half of its HP.
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.SLEEP_I
	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 300))

	return typeEffect
end
