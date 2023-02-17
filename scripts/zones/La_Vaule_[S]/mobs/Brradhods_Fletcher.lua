-----------------------------------
-- Area: La Vaule [S]
--   Braddhods Fletcher
--   BCNM: The Bloodbathed Crown
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:setLocalVar("eesHP", math.random(10, 50))
end

function onMobEngaged(mob, target)
    -- Force adds to link when aggrod
    for v = 17125684, 17125688 do
        GetMobByID(v):updateEnmity(target)
    end
end

function onMobFight(mob, target)
    local ees = mob:getLocalVar("ees")
    local eesHP = mob:getLocalVar("eesHP")
    local hp = mob:getHPP()

    if (hp <= eesHP) and (ees == 0) then
        mob:setLocalVar("ees", 1)
        mob:useMobAbility(737) -- Eagle Eye Shot
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end