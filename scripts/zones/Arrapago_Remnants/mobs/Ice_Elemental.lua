-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Ice Elemental
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
    if mob:getID(instance) == 17081073 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(234,0,153, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(232,0,206, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081074 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(236,0,155, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(234,0,208, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end

    -- 2nd set
    if mob:getID(instance) == 17081075 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(287,0,153, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(285,0,206, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081076 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(285,0,153, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(287,0,206, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end

    -- 3rd set
    if mob:getID(instance) == 17081077 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(236,0,155, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(285,0,153, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081078 then
        if os.time() > Wait and Path == 0 then
           mob:pathTo(238,0,157, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(287,0,155, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end

    -- 4th set
    if mob:getID(instance) == 17081079 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(285,0,206, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(232,0,206, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
        end
    end
    if mob:getID(instance) == 17081080 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(287,0,208, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+9)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(234,0,208, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+9)
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
    salvageUtil.spawnRandomEvent(mob, player, isKiller, 5, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081073, 17081080 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081107, instance)
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENBLIZZARD, {chance = 100, power = math.random(200, 250)})
end
