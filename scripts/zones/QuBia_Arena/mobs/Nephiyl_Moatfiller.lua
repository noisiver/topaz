-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Nephiyl Moatfiller
-- BCNM: Demolition Squad
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.CHARM, hpp = math.random(25, 50)},
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
