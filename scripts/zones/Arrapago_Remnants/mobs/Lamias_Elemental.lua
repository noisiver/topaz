-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lamia's Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
require("scripts/globals/pathfind")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(75)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
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
end


