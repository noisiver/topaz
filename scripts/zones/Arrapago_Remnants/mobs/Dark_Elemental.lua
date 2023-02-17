-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Dark Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------

function onMobSpawn(mob)
    salvageUtil.setElementalMods(mob)
    mob:setMobMod(tpz.mobMod.RETURN_TO_SPAWN, 0)
end

function onMobRoam(mob)
	local Path = mob:getLocalVar("Path")
	local Wait = mob:getLocalVar("Wait")
    local flags = tpz.path.flag.RUN
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    -- 1st set
    if mob:getID(instance) == 17081089 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(393,0,46, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(393,0,-6, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081090 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(395,0,48, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+18)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(395,0,-4, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+18)
        end
    end

    -- 2nd set
    if mob:getID(instance) == 17081091 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(446,0,-6, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(393,0,-6, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081092 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(448,0,-4, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+18)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(395,0,-4, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+18)
        end
    end

    -- 3rd set
    if mob:getID(instance) == 17081093 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(446,0,46, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(446,0,-6, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081094 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(448,0,48, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+18)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(448,0,-4, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+18)
        end
    end

    -- 4th set
    if mob:getID(instance) == 17081095 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(393,0,46, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(446,0,46, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081096 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(395,0,48, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+18)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(448,0,48, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+18)
        end
    end
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081089, 17081096 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081105, instance)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK, {chance = 100, power = math.random(200, 250)})
end
