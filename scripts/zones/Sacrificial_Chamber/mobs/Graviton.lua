-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Grav'iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:setLocalVar("everyonesRancorHPP", math.random(20, 30))
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    if mob:getLocalVar("everyonesRancorUsed") == 0 and mob:getHPP() <= mob:getLocalVar("everyonesRancorHPP") then
        mob:setLocalVar("everyonesRancorUsed", 1)
        mob:useMobAbility(921)
    end
end

function onMobDisengage(mob, weather)
    mob:setLocalVar("everyonesRancorUsed", 0)
end

function onMobDeath(mob, player, isKiller)
end
