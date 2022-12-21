-----------------------------------
-- Area: La Vaule [S]
--   NM: Ashmaker Gotblut
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMobMod(tpz.mobMod.GA_CHANCE, 70)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 14)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end