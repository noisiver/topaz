-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lahama
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobEngaged(mob, target)
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
    for i = 17081150, 17081166 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    hatmehyt = GetMobByID(17081182, instance)
    hatmehyt:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos())
    SpawnMob(17081182, instance)
    salvageUtil.msgGroup(mob, "A big fish leaps towards you!", 0xD, none)
end


