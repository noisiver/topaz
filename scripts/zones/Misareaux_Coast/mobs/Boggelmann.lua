-----------------------------------
-- Area: Misareaux Coast
--  Mob: Boggelmann
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
end

function onMobFight(mob)
	local TwoHourUsed = mob:getLocalVar("TwoHourUsed")
	if mob:getHPP() <= 50 and TwoHourUsed == 0 then
		mob:useMobAbility(695) -- Blood weapon
		mob:setLocalVar("TwoHourUsed", 1)
	end
end


function onMobWeaponSkillPrepare(mob, target)
	if mob:getHPP() < 25 then
		return 1363
	end
end


function onMobDeath(mob, player, isKiller, noKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("COP_Boggelmann_KILL") == 0) then
        player:setCharVar("COP_Boggelmann_KILL", 1)
    end
end
