-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Ephramadian Shade
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------
parties =
{
    [1] = { 17081131, 17081132, 17081133 },
    [2] = { 17081134, 17081135, 17081136 },
    [3] = { 17081137, 17081138, 17081139 },
    [4] = { 17081140, 17081141, 17081142, 17081143 },
    [5] = { 17081144, 17081145, 17081146, 17081147 },
}

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 500)
    mob:setMod(tpz.mod.SLASHRES, 1250)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 500)
    mob:setMod(tpz.mod.IMPACTRES, 750)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
	local mobID = mob:getID(instance)

    for v = 17081131, 17081133 do
        if mobID == v then
            for v = 17081131, 17081133 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081134, 17081136 do
        if mobID == v then
            for v = 17081134, 17081136 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081137, 17081139 do
        if mobID == v then
            for v = 17081137, 17081139 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081140, 17081143 do
        if mobID == v then
            for v = 17081140, 17081143 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081144, 17081147 do
        if mobID == v then
            for v = 17081144, 17081147 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, 5, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081131, 17081147 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081148, instance)
    salvageUtil.msgGroup(mob, "Enruomtsorf hungers.", 0, "Sahtra Lihtenem")
end