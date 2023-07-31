-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Carthi
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobFight(mob, target)
    if mob:getHPP() <= 50 then
        target:PrintToPlayer("Oh no! He's coming! I'm out of here!",0,"Carthi")
        DespawnMob(mob:getID())
		DespawnMob(mob:getID()-1)
    end
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17281030)
end


function onMobDespawn(mob)
    local BigBoss = GetMobByID(17281686)
    BigBoss:spawn()
end

function onMobDeath(mob, player, isKiller, noKiller)
end
