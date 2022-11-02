-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Armoury Crate (Mimic)
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.AGGRO_SIGHT, 0)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 5)
    mob:hideName(true)
    -- Should be unneeded
    --mob:setMobMod(tpz.mobMod.TRUE_SIGHT, 0)
end

function onMobEngaged(mob, target)
    mob:hideName(false)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end