-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Fallen Volunteer
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 500)
    mob:setMod(tpz.mod.SLASHRES, 750)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 1250)
    mob:setMod(tpz.mod.IMPACTRES, 750)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
	local mobID = mob:getID(instance)

    for v = 17081114, 17081116 do
        if mobID == v then
            for v = 17081114, 17081116 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081117, 17081119 do
        if mobID == v then
            for v = 17081117, 17081119 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081120, 17081122 do
        if mobID == v then
            for v = 17081120, 17081122 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081123, 17081126 do
        if mobID == v then
            for v = 17081123, 17081126 do
	            GetMobByID(v, instance):updateEnmity(target)
            end
        end
    end
    for v = 17081127, 17081130 do
        if mobID == v then
            for v = 17081127, 17081130 do
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
    for i = 17081114, 17081130 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081149, instance)
    salvageUtil.msgGroup(mob, "Bwixki amala zal qulllll...", 0, "Tutankhamun")
end