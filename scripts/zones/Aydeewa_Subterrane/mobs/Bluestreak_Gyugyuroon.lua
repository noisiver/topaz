------------------------------
-- Area: Aydeewa Subterrane
--   NM: Bluestreak Gyugyuroon
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------
local path = {
	-219, 14, -341,
	-218, 14, -380,
	-254, 10, -380,
	-272, 14, -381,
	-301, 14, -378,
	-305, 14, -349,
	-318, 14, -340,
	-343, 14, -336,
	-373, 14, -339,
	-413, 14, -305,
	-421, 14, -287, 
	-420, 14, -264,
	-452, 14, -263,
	-467, 11, -260,
	-459, 11, -224,
	-502, 11, -216,
	-501, 13, -183,
	-543, 17, -176,

}
function onMobSpawn(mob)
	mob:setMod(tpz.mod.UDMGMAGIC, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 0)
end

function onMobFight(mob, target)
	if mob:checkDistance(target)  <= 5 then
	mob:pathTo(target:getXPos() + 10, target:getYPos() +10, mob:getZPos())
	end
	
	if mob:getHPP() <= 25 then
		mob:addRoamFlag(512) -- ignore attacking
		if not mob:isFollowingPath() then
			mob:disengage()
			-- mob:pathThrough(path, tpz.path.flag.RUN)
			tpz.path.patrolsimple(mob, path, tpz.path.flag.RUN)
		end
	end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 464)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
