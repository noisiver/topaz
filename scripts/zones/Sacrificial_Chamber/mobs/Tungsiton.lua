-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Tungs'iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
	local X = mob:getXPos()
	local Y = mob:getYPos()
	local Z = mob:getZPos()
	SpawnMob(mob:getID() + 1)
	GetMobByID(mob:getID() + 1):setPos(X, Y, Z)
	GetMobByID(mob:getID() + 1):setSpawn(X, Y, Z)
end

function onMobDeath(mob, player, isKiller)
end
