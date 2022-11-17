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

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 0)
    mob:AnimationSub(0) 
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
    for i = 17081212, 17081232 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end

    professorP = GetMobByID(17081233, instance)
    if not professorP:isSpawned() then
        SpawnMob(17081233, instance)
        salvageUtil.msgGroup(mob, "Great news, everyone! I think I've perfected a plague that will destroy all life in Vana'diel.", 0, "Professor P")
    end
end


