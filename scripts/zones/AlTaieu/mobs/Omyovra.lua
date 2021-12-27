-----------------------------------
-- Area: Al'Taieu
--  Mob: Om'yovra
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:hideName(true)
    mob:untargetable(true)
    mob:AnimationSub(5)
    mob:wait(2000)
    mob:setMod(tpz.mod.REGEN, 50)
end

function onMobEngaged(mob, target)
    mob:hideName(false)
    mob:untargetable(false)
    mob:AnimationSub(6)
    mob:wait(2000)
    mob:setMod(tpz.mod.REGEN, 50)
end

function onMobDisengage(mob)
    mob:hideName(true)
    mob:untargetable(true)
    mob:AnimationSub(5)
end

function onMobDeath(mob, player, isKiller)
end
