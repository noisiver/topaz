-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Light Elemental
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
    if mob:getID(instance) == 17081097 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(393,0,153, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(419,0,153, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    --2nd
    if mob:getID(instance) == 17081098 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(421,0,155, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+12)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(446,0,153, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+12)
        end
    end

    -- 3rd 
    if mob:getID(instance) == 17081099 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(448,0,155, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(446,0,179, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    --4th
    if mob:getID(instance) == 17081100 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(448,0,181, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+12)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(446,0,206, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+12)
        end
    end

    -- 5th
    if mob:getID(instance) == 17081101 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(448,0,208, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(420,0,206, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    --6th
    if mob:getID(instance) == 17081102 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(422,0,208, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+12)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(393,0,206, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+12)
        end
    end

    -- 7th
    if mob:getID(instance) == 17081103 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(395,0,208, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(393,0,180, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    --8th
    if mob:getID(instance) == 17081104 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(393,0,179, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+12)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(393,0,153, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+12)
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
    for i = 17081097, 17081104 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081113, instance)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENLIGHT, {chance = 100, power = math.random(200, 250)})
end