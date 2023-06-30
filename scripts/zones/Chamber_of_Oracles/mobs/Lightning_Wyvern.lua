-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Lightning Wyvern
-- KSNM: Eye of the Storm
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
end

function onMobEngaged(mob, target)
    mob:useMobAbility(815)
    mob:setMod(tpz.mod.REGAIN, 100)
end

function onMobFight(mob, target)

end

function onMobDeath(mob, player, isKiller)
end
