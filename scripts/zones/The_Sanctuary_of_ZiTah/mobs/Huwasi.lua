-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Huwasi
-----------------------------------
require("scripts/globals/hunts")

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 30)
    mob:addMod(tpz.mod.ATTP, 30)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 75 and hitTrigger == 0 then
        mob:setMod(tpz.mod.REGAIN, 250)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        mob:setMod(tpz.mod.REGAIN, 500)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 then
        mob:setMod(tpz.mod.REGAIN, 750)
        mob:setLocalVar("TriggerHit", 3)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 326)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
end
