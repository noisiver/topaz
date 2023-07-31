-----------------------------------
-- Area: Newton Movapolis
--  Swashtox Beadblinker's Guard'
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 16826517)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    onPath(mob)
end

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.SHARE_TARGET, 16826517)
end

function onPath(mob)
	local Swashtox = GetMobByID(16826517)
	mob:pathTo(Swashtox:getXPos(), Swashtox:getYPos(), Swashtox:getZPos())
end

function onMobDeath(mob, player, isKiller, noKiller)
end
