-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Nightmare Sabotender
-----------------------------------
mixins = {require("scripts/mixins/dynamis_dreamland")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1452)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
