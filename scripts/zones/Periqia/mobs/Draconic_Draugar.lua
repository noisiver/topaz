-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Draconic Draugar
-- DRG
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMod(tpz.mod.CRITHITRATE, 100)
end

function onMobRoam(mob)
	local Path = mob:getLocalVar("Path")
	local Wait = mob:getLocalVar("Wait")
    local flags = tpz.path.flag.NONE
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    if mob:getID(instance) == 17006912 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-341,-15,300, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+17)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-340,-15,226, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+17)
        end
    end
    if mob:getID(instance) == 17006916 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-273,-15,178, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+30)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-321,-15,179, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+30)
        end
    end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
	local Pet = GetMobByID(mob:getID(instance)+1, instance)
    local hellSlashEnabled = mob:getLocalVar("hellSlashEnabled")
	Pet:updateEnmity(target)
    if hellSlashEnabled > 0 then
        mob:useMobAbility(478) -- Hell Slash
        mob:setLocalVar("hellSlashEnabled", 0)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    return 1795 -- Only uses Malediction
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1795 then -- Malediction
         mob:setLocalVar("hellSlashEnabled", 1)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
