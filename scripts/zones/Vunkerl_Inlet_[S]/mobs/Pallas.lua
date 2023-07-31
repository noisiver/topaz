------------------------------
-- Area: Vunkerl Inlet [S]
--   NM: Pallas
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs")
mixins = {require("scripts/mixins/job_special")}
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
	mob:setMod(tpz.mod.MOVE, 12)
end

function onMobFight(mob, target)
	local TigerOne = GetMobByID(mob:getID()+1)
	local TigerTwo = GetMobByID(mob:getID()+2)
	local TigerThree = GetMobByID(mob:getID()+3)
	
	 if TigerOne:isSpawned() then
		TigerOne:updateEnmity(target)
	end
	if  TigerTwo:isSpawned() then
		TigerTwo:updateEnmity(target)
	end
	if  TigerThree:isSpawned() then
		TigerThree:updateEnmity(target)
	end
	

	if not TigerOne:isSpawned() then
		TigerOne:setPos(mob:getPos())
		TigerOne:spawn()
		TigerOne:updateEnmity(target)
	elseif not TigerTwo:isSpawned() then
		TigerTwo:setPos(mob:getPos())
		TigerTwo:spawn()
		TigerTwo:updateEnmity(target)
	elseif not TigerThree:isSpawned() then
		TigerThree:setPos(mob:getPos())
		TigerThree:spawn()
		TigerThree:updateEnmity(target)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 489)
    DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)
    DespawnMob(mob:getID()+3)
end
