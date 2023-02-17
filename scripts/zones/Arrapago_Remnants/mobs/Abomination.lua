-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Abomination
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
mixins = { require("scripts/mixins/families/acrolith")}
require("scripts/globals/pathfind")
-----------------------------------
parties =
{
    [1] = { 17081225, 17081226 },
    [2] = { 17081227, 17081228 },
    [3] = { 17081229, 17081230 },
    [4] = { 17081231, 17081232 },
    [5] = { 17081221, 17081222 },
    [6] = { 17081215, 17081216 },
}

local slimes =
{17081212, 17081213, 17081214, 17081216, 17081217, 17081218, 17081222, 17081223, 17081224, 17081226, 17081228, 17081230, 17081232}

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.RETURN_TO_SPAWN, 0)
    mob:AnimationSub(0) 
end

function onMobRoam(mob)
	local Path = mob:getLocalVar("Path")
	local Wait = mob:getLocalVar("Wait")
    local flags = tpz.path.flag.RUN
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end

    -- H-6/7 
    if mob:getID(instance) == 17081215 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-330,0,10, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-330,0,28, flags)
            mob:setLocalVar("Path", 2)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 2 then
            mob:pathTo(-349,0,28, flags)
            mob:setLocalVar("Path", 3)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 3 then
            mob:pathTo(-348,0,11, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+3)
        end
    end

    -- H-7/8
    if mob:getID(instance) == 17081219 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-330,0,10, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-330,0,28, flags)
            mob:setLocalVar("Path", 2)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 2 then
            mob:pathTo(-349,0,28, flags)
            mob:setLocalVar("Path", 3)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 3 then
            mob:pathTo(-348,0,11, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+3)
        end
    end

    -- Patrol H-8 to H-6
    if mob:getID(instance) == 17081220 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-340,-4,-69, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+15)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-339,-4,-30, flags)
            mob:setLocalVar("Path", 2)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 2 then
            mob:pathTo(-340,0,-10, flags)
            mob:setLocalVar("Path", 3)
            mob:setLocalVar("Wait", os.time()+3)
        end
        if os.time() > Wait and Path == 3 then
            mob:pathTo(-340,0,11, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+3)
        end
    end

    -- Patrol G-7 to H-6
    if mob:getID(instance) == 17081221 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-349,0,29, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-381,0,20, flags)
            mob:setLocalVar("Path", 2)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 2 then
            mob:pathTo(-380,0,-10, flags)
            mob:setLocalVar("Path", 3)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 3 then
            mob:pathTo(-395,-0,-19, flags)
            mob:setLocalVar("Path", 4)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 4 then
            mob:pathTo(-421,-0,-19, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- Patrol G-8 Big Room
    if mob:getID(instance) == 17081227 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-420,0,-73, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+10)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-419,0,-126, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+10)
        end
    end

    if mob:getID(instance) == 17081229 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-446,0,-100, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+10)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-393,0,-99, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+10)
        end
    end
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()
    local animationSub = mob:AnimationSub()
    local leak = mob:getLocalVar("leak")
    local armLost = mob:getLocalVar("armLost")
    local slime = salvageUtil.getAvailableMob(mob, slimes)
    print(slime)

    if (slime ~= nil) and mob:actionQueueEmpty() then
        if (hp < 75) and (animationSub == 0) and (leak == 0) then
            mob:setLocalVar("leak", 1)
            mob:useMobAbility(2070)
            SpawnInstancedMob(mob, target, slime, true)
            salvageUtil.msgGroup(mob, "The " .. MobName(mob) .. " starts to leak." , 0xD, none)
        elseif (hp < 50) and (armLost == 1) and (leak == 1) then
            mob:setLocalVar("leak", 2)
            mob:useMobAbility(2072)
            mob:AnimationSub(2) 
            SpawnInstancedMob(mob, target, slime, true)
            salvageUtil.msgGroup(mob, "The " .. MobName(mob) .. " leaks more chemicals." , 0xD, none)
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    local acroliths = {17081215, 17081219, 17081220, 17081221, 17081225, 17081227, 17081229, 17081231}

    for _, mobId in pairs(acroliths) do
        if not GetMobByID(mobId, instance):isDead() then
            return
        end
    end

    professorP = GetMobByID(17081233, instance)
    if not professorP:isSpawned() then
        SpawnMob(17081233, instance)
        salvageUtil.msgGroup(mob, "Great news, everyone! I think I've perfected a plague that will destroy all life in Vana'diel.", 0, "Professor P")
    end
end


