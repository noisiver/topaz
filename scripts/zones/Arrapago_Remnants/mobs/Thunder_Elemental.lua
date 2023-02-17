-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Thunder Elemental
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
    -- 1st 
    if mob:getID(instance) == 17081081 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(233,0,-6, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > 233 and Path == 1 then
            mob:pathTo(232,0,19, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- 2nd
    if mob:getID(instance) == 17081082 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(235,0,-4, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(259,0,-6, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- 3rd 
    if mob:getID(instance) == 17081083 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(233,0,46, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(232,0,19, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- 4th
    if mob:getID(instance) == 17081084 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(235,0,48, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(259,0,46, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- 5th 
    if mob:getID(instance) == 17081085 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(286,0,-7, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(286,0,19, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end
    -- 6th
    if mob:getID(instance) == 17081086 then
        if os.time() > Wait and Path == 0 then
           mob:pathTo(288,0,-5, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(259,0,-6, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- 7th 
    if mob:getID(instance) == 17081087 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(286,0,46, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(286,0,19, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- 8th
    if mob:getID(instance) == 17081088 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(288,0,48, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(259,0,46, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
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
    for i = 17081081, 17081088 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081106, instance)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENTHUNDER, {chance = 100, power = math.random(200, 250)})
end