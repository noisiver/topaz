-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Baron Avnas
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
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.UDMGBREATH, -25)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        between = 60,
        specials =
        {
            {id = tpz.jsa.PERFECT_DODGE, cooldown = 0, hpp = 90},
            {id = tpz.jsa.BLOOD_WEAPON, cooldown = 0, hpp = 90},
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
