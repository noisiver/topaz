-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Nightmare Funguar
-----------------------------------
mixins = {require("scripts/mixins/dynamis_dreamland")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1455)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
