---------------------------------------------
--  Biomagnet
--
--  Description: Draws in target.
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local tp = mob:getTP()
	if tp >= 1000 then
		mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
	else
		mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
	end
end
