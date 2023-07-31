-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Quiebitiel
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
     mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobFight(mob, target)
mob:setMod(tpz.mod.REGAIN, 250)
    tpz.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            {id = tpz.jsa.BENEDICTION, cooldown = 0, hpp = 50},
            {id = tpz.jsa.SOUL_VOICE, cooldown = 0, hpp = 90},
            {id = tpz.jsa.MANAFONT, cooldown = 0, hpp = 90},
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
