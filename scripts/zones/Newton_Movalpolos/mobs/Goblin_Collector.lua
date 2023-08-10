------------------------------
-- Area: Newton Movalpolos
--   NM: Goblin Collector
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
	mob:setDamage(350) -- melee hits at 300-600 damage 
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.BINDRESTRAIT, 75)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 75)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
end

function onMobFight(mob, target)
    mob:addListener("ATTACK","COLLECTOR_ATTACK", function(mob)
        local target = mob:getTarget()
        mob:resetEnmity(target)
    end)
end


function onMobDeath(mob, player, isKiller, noKiller)
end
