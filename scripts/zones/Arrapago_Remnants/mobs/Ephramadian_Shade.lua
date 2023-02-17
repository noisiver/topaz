-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Ephramadian Shade
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------
parties =
{
    [1] = { 17081131, 17081132, 17081133 },
    [2] = { 17081134, 17081135, 17081136 },
    [3] = { 17081137, 17081138, 17081139 },
    [4] = { 17081140, 17081141, 17081142, 17081143 },
    [5] = { 17081144, 17081145, 17081146, 17081147 },
}

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 500)
    mob:setMod(tpz.mod.SLASHRES, 1250)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 500)
    mob:setMod(tpz.mod.IMPACTRES, 750)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:delImmunity(tpz.immunity.SILENCE) 
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
    local instance = mob:getInstance()
    local sahtraLihtenem = GetMobByID(17081148, instance)
    for i = 17081131, 17081147 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end

    if not sahtraLihtenem:isSpawned() then
        SpawnMob(17081148, instance)
        salvageUtil.msgGroup(mob, "Enruomtsorf hungers.", 0, "Sahtra Lihtenem")
    end
end