-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Count Bifrons
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25)
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UFASTCAST, 25)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, cooldown = 60, hpp = 75},
        },
    })
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 355)
    player:addTitle(tpz.title.HELLSBANE)
end
