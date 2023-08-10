-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Andrealphus
--  Quest: Better the Demon You Know(Goblin Grenade)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

--Every 33% health, he'll Escape whoever has hate out to Xarcabard (unless it's a solo player).

function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
