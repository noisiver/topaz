-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Fire Elemental
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
    mob:setMobMod(tpz.mobMod.AGGRO_SIGHT, 0)
    mob:setMobMod(tpz.mobMod.TRUE_SIGHT, 0)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 5)
    mob:setMobMod(tpz.mobMod.RETURN_TO_SPAWN, 0)
end

function onMobRoam(mob)
	local Path = mob:getLocalVar("Path")
	local Wait = mob:getLocalVar("Wait")
    local flags = tpz.path.flag.RUN
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end

    -- I-7  Long patroll
    if mob:getID(instance) == 17080999 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(219,-12,-371, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+20)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(220,-16,-299, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+20)
        end
    end

    -- F-7 Room
    if mob:getID(instance) == 17081000 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(233,-15,-295, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+4)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(206,-15,-295, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+4)
        end
    end
    if mob:getID(instance) == 17081001 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(233,-12,-304, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+4)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(206,-15,-304, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+4)
        end
    end
    if mob:getID(instance) == 17081002 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(211,-16,-299, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+4)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(220,-16,-300, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+4)
        end
    end

    -- F-8 Room
    if mob:getID(instance) == 17080995 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(215,-11,-366, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+4)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(233,-11,-384, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+4)
        end
    end
    if mob:getID(instance) == 17080996 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(206,-12,-384, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+4)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(224,-11,-366, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+4)
        end
    end
    if mob:getID(instance) == 17080997 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(233,-12,-375, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+4)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(215,-11,-393, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+4)
        end
    end

    -- G-8 Hallway
    if mob:getID(instance) == 17081003 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(265,-8,-386, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(265,-8,-374, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end
    if mob:getID(instance) == 17080998 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(254,-12,-374, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(254,-11,-386, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end

    -- G-7 Hallway
    if mob:getID(instance) == 17081004 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(266,-20,-293, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(266,-20,-305, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end
    if mob:getID(instance) == 17081005 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(262,-16,-305, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(262,-16,-293, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end
    if mob:getID(instance) == 17081006 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(253,-16,-305, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(253,-16,-293, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+6)
        end
    end
    if mob:getID(instance) == 17081007 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(246,-16,-305, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+6)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(246,-16,-293, flags)
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
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, {chance = 100, power = math.random(200, 250)})
end