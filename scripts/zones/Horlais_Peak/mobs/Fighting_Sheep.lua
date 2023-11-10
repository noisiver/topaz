-----------------------------------
-- Area: Horlais Peak
--  Mob: Fighting Sheep
-- BCNM: Hostile Herbivores
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.SDT_ICE, 15)
    mob:setMod(tpz.mod.EEM_BIND, 70)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:SetMobSkillAttack(6034) -- Knockback on auto-attacks
end	

function onMobDeath(mob, player, isKiller, noKiller)
end
