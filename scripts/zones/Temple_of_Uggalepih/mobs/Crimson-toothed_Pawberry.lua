-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Crimson-toothed Pawberry
-----------------------------------
require("scripts/globals/hunts")
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 15)
    mob:addMod(tpz.mod.DEFP, 15)
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UFASTCAST, 25)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 18000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.ASTRAL_FLOW, cooldown = 45, hpp = 100},
        },
    })
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 392)
end
