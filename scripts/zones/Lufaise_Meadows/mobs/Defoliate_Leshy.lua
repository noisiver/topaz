-----------------------------------
-- Area: Lufaise Meadows
--  Mob: Defoliate Leshy
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (isKiller) then
        GetMobByID(mob:getID()-1):setLocalVar("timeToGrow", os.time() + math.random(36000, 43200)) -- Colorful in 11 to 12 hours
    end
end

function onMobDespawn(mob)
    local phIndex = mob:getLocalVar("phIndex")
    mob:setLocalVar("phIndex", 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(phIndex, false)
    GetMobByID(phIndex):setRespawnTime(GetMobRespawnTime(phIndex))
end
