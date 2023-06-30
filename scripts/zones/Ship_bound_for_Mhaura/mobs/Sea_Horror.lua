-----------------------------------
-- Area: Ship bound for Mhaura
--  Mob: Sea Horror
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, hpp = math.random(25, 75)},
        },
    })
end

function onMobDeath(mob, player)

end

function onMobDespawn(mob, player)
    mob:setLocalVar("respawnTime", os.time() + 60)
end