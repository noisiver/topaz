-----------------------------------
-- Area: Horlais Peak
--  Mob: Dragonian Berzerker
-- KSNM30
--       50% HP/MP reduction pre-2 hour and 75% HP/MP reduction post-2 hour.
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    local ChaosBladeBoost = mob:getLocalVar("ChaosBladeBoost")
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.MIGHTY_STRIKES,
                endCode = function(mob)
                    mob:setDamage(150)
					mob:setLocalVar("ChaosBladeBoost", 1)
                end,
            },
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
