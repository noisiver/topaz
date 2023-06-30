-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lamia's Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
mixins = {require("scripts/mixins/families/elemental_spirit")}
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
require("scripts/globals/pathfind")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(75)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:delImmunity(tpz.immunity.SILENCE) 
    onPath(mob)
end

function onPath(mob)
    local instance = mob:getInstance()
    local master = GetMobByID(mob:getID(instance) -1, instance)
    mob:pathTo(master:getXPos() + 0.15, master:getYPos(), master:getZPos() + 0.15)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081189, 17081208 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    exon1 = GetMobByID(17081209, instance)
    exon2 = GetMobByID(17081210, instance)
    if not exon1:isSpawned() and not exon2:isSpawned() then
        SpawnMob(17081209, instance)
        SpawnMob(17081210, instance)
        salvageUtil.msgGroup(mob, "Our queen will not be happy about this.", 0, "Lamia Exon")
    end
end


