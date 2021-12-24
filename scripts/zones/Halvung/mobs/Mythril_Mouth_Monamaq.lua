-----------------------------------
-- Area: Halvung
--  Mob: Mythril_Mouth_Monamaq
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
	mob:setMod(tpz.mod.DEF, 10000)
    mob:setMod(tpz.mod.VIT, 200)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setAggressive(0)
end

function onMobFight(mob, target)
     tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.CHAINSPELL, cooldown = 180, hpp = 90},
        },
     })
end

function onMobDeath(mob, player, isKiller)
end

