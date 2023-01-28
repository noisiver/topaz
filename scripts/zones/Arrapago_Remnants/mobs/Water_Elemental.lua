-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Water Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
elementalIds =
{
    17081025, 17081026, 17081027, 17081028, 17081029, 17081030, 17081031, 17081032, 17081033, 17081034, 17081035, 17081036, 17081037
}
function onMobSpawn(mob)
    salvageUtil.setElementalMods(mob)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local newElemental = salvageUtil.getAliveMob(mob, elementalIds)
    print(newElemental)
    if isKiller or noKiller then
        if (newElemental ~= nil) then
        GetMobByID(newElemental, instance):setPos(player:getXPos() + math.random(3,5), player:getYPos(), player:getZPos() + math.random(3,5))
            GetMobByID(newElemental, instance):updateEnmity(player)
            salvageUtil.msgGroup(player, "The " .. MobName(mob) .. " calls for help!", 0xD, none)
        else
            salvageUtil.msgGroup(player, "The " .. MobName(mob) .. " calls for help...but no one comes.", 0xD, none)
        end
    end
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, {chance = 100, power = math.random(200, 250)})
end