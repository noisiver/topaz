-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Roc
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(80)
    mob:setDelay(4000)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end


