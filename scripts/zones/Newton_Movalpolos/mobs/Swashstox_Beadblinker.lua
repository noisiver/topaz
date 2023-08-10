------------------------------
-- Area: Newton Movalpolos
--   NM: Swashstox Beadblinker
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(150) 
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 400)
    local GuardOne = GetMobByID(mob:getID()+-1)
	local GuardTwo = GetMobByID(mob:getID()+-2)
	GuardOne:spawn()
    GuardTwo:spawn()
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 247)
end
