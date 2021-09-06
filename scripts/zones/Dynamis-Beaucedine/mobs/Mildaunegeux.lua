-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Mildaunegeux
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 30) 
     mob:addMod(tpz.mod.ATTP, 20)
     mob:addMod(tpz.mod.ACC, 50) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        between = 60,
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, cooldown = 0, hpp = 90},
            {id = tpz.jsa.PERFECT_DODGE, cooldown = 0, hpp = 90},
            {id = tpz.jsa.MIJIN_GAKURE, cooldown = 0, hpp = 50},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
