-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Tee Zaksa the Ceaseless
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special"),
    require("scripts/mixins/remove_doom")
}
-----------------------------------
function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 30) 
     mob:addMod(tpz.mod.ATTP, 20)
     mob:addMod(tpz.mod.ACC, 50) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        between = 120,
        specials =
        {
            {id = tpz.jsa.INVINCIBLE, cooldown = 0, hpp = 90},
            {id = tpz.jsa.MIJIN_GAKURE, cooldown = 0, hpp = 50},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
