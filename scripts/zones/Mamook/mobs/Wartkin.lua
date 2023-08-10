-----------------------------------
-- Area: Mamook
--   Adds for: Iriri Samariri (T2 ZNM)
--  Wartkin
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setLocalVar("Despawn", os.time() + math.random(15, 30))
end

function onMobFight(mob, target)
	local Despawn = mob:getLocalVar("Despawn")
    if os.time() >= Despawn then
        DespawnMob(mob:getID())
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
