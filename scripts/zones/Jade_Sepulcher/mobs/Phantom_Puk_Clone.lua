-----------------------------------
-- Area: Jade Sepulcher
-- MOB: Phantom Puk Clone
-- ISNM3000: Shadows of the Mind
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Jade_Sepulcher/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.UDMGMAGIC, 200)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    local battleTime = mob:getbattleTime()
    local despawnTimer = mob:getLocalVar("boreasDespawnTimer")
    -- Despawn after 15-20s
    if (battleTime >= despawnTimer then
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
