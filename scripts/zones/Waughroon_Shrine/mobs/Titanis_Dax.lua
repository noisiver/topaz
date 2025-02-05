-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Titanis Dax
-- KSNM: Prehistoric Pigeons
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.SOUL_VOICE, cooldown = 200, hpp = 95},
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
