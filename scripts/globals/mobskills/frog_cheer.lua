---------------------------------------------
-- Frog Cheer
-- Increases magical attack, physical attack, magical evasion, and evasion.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
		local typeEffect = tpz.effect.MAGIC_ATK_BOOST
    if (mob:getPool() == 2914) then -- Novv the Whitehearted
		MobBuffMove(mob, tpz.effect.ATTACK_BOOST, 20, 0, 300)
		MobBuffMove(mob, tpz.effect.EVASION_BOOST, 25, 0, 300)
		MobBuffMove(mob, tpz.effect.MAGIC_EVASION_BOOST_II, 12, 0, 300)
		skill:setMsg(MobBuffMove(mob, typeEffect, 25, 0, 300))
	else
		MobBuffMove(mob, tpz.effect.INTENSION, 200, 0, 300)
		skill:setMsg(MobBuffMove(mob, typeEffect, 25, 0, 300))
	end
    return typeEffect
end
