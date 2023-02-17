-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Metal Slime
--2881	DQ Slime
--2907	DQ She-Slime (Red Slime)
--2908	DQ Metal Slime
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(50)
    mob:setDelay(4000)
    mob:setMod(tpz.mod.DEF, 5000)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setModelId(2908)
end

function onMobEngaged(mob, target)
    mob:setModelId(2908)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
    -- Fuscous Ooze, Purulent Ooze, Corrosive Ooze
    return math.random(2183, 2185)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end


