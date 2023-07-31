-----------------------------------
-- Area: Horlais Peak
--  Mob: Dragonian Minstrel
-- KSNM30
--       50% HP/MP reduction pre-2 hour and 75% HP/MP reduction post-2 hour.
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ATTP, 25)
	mob:addMod(tpz.mod.ACC, 30) 
	mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.UFASTCAST, 50)
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    local ChaosBladeBoost = mob:getLocalVar("ChaosBladeBoost")
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.SOUL_VOICE,
                endCode = function(mob)
                    mob:addMod(tpz.mod.ATT, 200)
					mob:setLocalVar("ChaosBladeBoost", 1)
                end,
            },
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
