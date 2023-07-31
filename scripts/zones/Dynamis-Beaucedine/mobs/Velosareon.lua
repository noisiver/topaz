-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Velosareon
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
        between = 30,
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, cooldown = 0, hpp = 50},
            {id = tpz.jsa.EES_SHADE, cooldown = 0, hpp = 90},
            {id = tpz.jsa.MEIKYO_SHISUI, cooldown = 0, hpp = 90},
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
