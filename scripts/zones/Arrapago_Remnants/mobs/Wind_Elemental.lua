-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Wind Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
parties =
{
    [1] = { 17081011, 17081012, 17081013, 17081014 },
    [2] = { 17081015, 17081016, 17081017 },
    [3] = { 17081137, 17081138, 17081139 },
    [4] = { 17081020, 17081021  },
}

function onMobSpawn(mob)
    salvageUtil.setElementalMods(mob)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
    local mobId = mob:getID(instance)

    for _,party in ipairs(parties) do
        for _,mob in ipairs(party) do
            if mob == mobId then
                for _,mob2 in ipairs(party) do
                    GetMobByID(mob2, instance):updateEnmity(target)
                end
                break
            end
        end
    end
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
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, {chance = 100, power = math.random(200, 250)})
end
