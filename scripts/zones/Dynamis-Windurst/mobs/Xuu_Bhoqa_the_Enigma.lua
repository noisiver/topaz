-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Xuu Bhoqa the Enigma
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
        between = 60,
        specials =
        {
            {id = tpz.jsa.ASTRAL_FLOW_MAAT, cooldown = 0, hpp = 90},
            {id = tpz.jsa.PERFECT_DODGE, cooldown = 0, hpp = 90},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
