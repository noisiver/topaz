-----------------------------------
-- Area: Mount Zhayolm
--   NM: Cerberus
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobFight(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(tpz.mod.REGAIN, 10)
    else
        mob:setMod(tpz.mod.REGAIN, 70)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.CERBERUS_MUZZLER)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end
