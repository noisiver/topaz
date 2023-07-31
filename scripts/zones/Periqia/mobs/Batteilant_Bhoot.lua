-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Batteilant Bhoot
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobRoam(mob)
	local Path = mob:getLocalVar("Path")
	local Wait = mob:getLocalVar("Wait")
    local flags = tpz.path.flag.NONE
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    if mob:getID(instance) == 17006905 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-356,-15,300, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+15)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-321,-16,299, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+15)
        end
    end
    if mob:getID(instance) == 17006907 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-366,-15,99, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+20)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-318,-15,99, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+20)
        end
    end
    if mob:getID(instance) == 17006908 then
        if os.time() > Wait and Path == 0 then
            mob:pathTo(-380,-16,179, flags)
            mob:setLocalVar("Path", 1)
            mob:setLocalVar("Wait", os.time()+15)
        end
        if os.time() > Wait and Path == 1 then
            mob:pathTo(-411,-16,180, flags)
            mob:setLocalVar("Path", 0)
            mob:setLocalVar("Wait", os.time()+15)
        end
    end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
	local StunTime = mob:getLocalVar("StunTime")
	local DreadSpikesTime = mob:getLocalVar("DreadSpikesTime")
	local DrainTime = mob:getLocalVar("DrainTime")
	local BattleTime = mob:getBattleTime()
    mob:setMod(tpz.mod.EEM_STUN, 150) -- Easy to stun because they spam Perdition
end

function onMobWeaponSkillPrepare(mob, target)
    return 1794 -- Only uses Perdition
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
