-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Tipha
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobFight(mob, target)
    if mob:getHPP() <= 50 then
        DespawnMob(mob:getID())
    end
end

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120)
end

function onMobDeath(mob, player, isKiller)
    local BroDead = GetMobByID(17281031):isDead()
    local BigBoss = GetMobByID(17281063)
    if BroDead then
        BigBoss:spawn()
    end
end

