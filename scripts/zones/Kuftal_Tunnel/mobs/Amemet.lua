-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Amemet
-- TODO: Amemet should walk in a big circle
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------------

function onMobSpawn(mob)
    mob:setDamage(100)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 100 and hitTrigger == 0 then
        mob:setMod(tpz.mod.REGAIN, 250)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        mob:setMod(tpz.mod.REGAIN, 500)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 10 and hitTrigger == 2 then
        mob:setMod(tpz.mod.REGAIN, 1000)
        mob:setLocalVar("TriggerHit", 3)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 418)
end
