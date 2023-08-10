-----------------------------------
-- Area: The Boyahda Tree
--   NM: Ancient Goobbue
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(125)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 20)
    mob:setMod(tpz.mod.CRITHITRATE, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN,30000)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 30000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, cooldown = 60, hpp = math.random(85, 95)},
        },
    })
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 21 to 24 hours
end
