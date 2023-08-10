-----------------------------------
-- Area: Spire of Holla
--  Mob: Cogitator
-- Simulant
-- !addkeyitem CENSER_OF_ABANDONMENT
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/promyvion")
-----------------------------------

function onMobSpawn(mob)
     tpz.promyvion.setEmptyModel(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    local Guard = GetMobByID(mob:getID()+1)
    local Guardtwo = GetMobByID(mob:getID()+2)
    local Guardthree = GetMobByID(mob:getID()+3)

    if mob:getHPP() <= 90 and hitTrigger == 0 then
        Guard:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guard:spawn()
        Guard:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 1)
        --printf("Spawning 90% Weeper");
    end
    if mob:getHPP() <= 80 and hitTrigger == 1 then
        Guardtwo:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guardtwo:spawn()
        Guardtwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 2)
        --printf("Spawning 80% Weeper");
    end
    if mob:getHPP() <= 70 and hitTrigger == 2 then
        Guardthree:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guardthree:spawn()
        Guardthree:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 3)
        --printf("Spawning 70% Weeper");
    end
    if mob:getHPP() <= 60 and hitTrigger == 3 then
        Guard:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guard:spawn()
        Guard:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 4)
        --printf("Spawning 60% Weeper");
    end
    if mob:getHPP() <= 50 and hitTrigger == 4 then
        Guardtwo:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guardtwo:spawn()
        Guardtwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 5)
        --printf("Spawning 50% Weeper");
    end
    if mob:getHPP() <= 40 and hitTrigger == 5 then
        Guardthree:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guardthree:spawn()
        Guardthree:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 6)
        --printf("Spawning 40% Weeper");
    end
    if mob:getHPP() <= 30 and hitTrigger == 6 then
        Guard:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guard:spawn()
        Guard:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 7)
        --printf("Spawning 30% Weeper");
    end
    if mob:getHPP() <= 20 and hitTrigger == 7 then
        Guardtwo:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guardtwo:spawn()
        Guardtwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 8)
        --printf("Spawning 20% Weeper");
    end
    if mob:getHPP() <= 10 and hitTrigger == 8 then
        Guardthree:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guardthree:spawn()
        Guardthree:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 9)
        --printf("Spawning 10% Weeper");
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
    DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)
    DespawnMob(mob:getID()+3)
end