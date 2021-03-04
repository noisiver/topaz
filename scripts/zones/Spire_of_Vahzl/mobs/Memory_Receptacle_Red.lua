-----------------------------------
-- Area: Spire of Vahzl
--  Mob: Memory Receptacle Red
-- Pulling the Plug
-- !addkeyitem CENSER_OF_ACRIMONY
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REGAIN, 250)
     mob:addStatusEffectEx(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
     mob:addStatusEffectEx(tpz.effect.ARROW_SHIELD, 0, 1, 0, 0)
     mob:addStatusEffectEx(tpz.effect.MAGIC_SHIELD, 0, 1, 0, 0)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobInitialize(mob)
end

function onMobFight(mob, target)
    local drawinTime = mob:getLocalVar("Drawin")
    local Receptacle = GetMobByID(mob:getID()+1)
    local ReceptacleTwo = GetMobByID(mob:getID()+2)
    local ReceptacleThree = GetMobByID(mob:getID()+3)
    local Spawn = mob:getLocalVar("Spawn")
    if Spawn == 0 then
        Receptacle:spawn()
        Receptacle:updateEnmity(target)
        ReceptacleTwo:spawn()
        ReceptacleTwo:updateEnmity(target)
        ReceptacleThree:spawn()
        ReceptacleThree:updateEnmity(target)
        mob:setLocalVar("Spawn", 1)
    end

    if drawinTime == 0 then
        mob:setLocalVar("Drawin", 20)
        printf("Set Draw in time");
        return
    elseif mob:getBattleTime() >= drawinTime then
        mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
        mob:setLocalVar("Drawin", mob:getBattleTime() + 20)
        printf("Drawing in");
    else
        mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
    end
end




function onMobDeath(mob, player, isKiller)
    DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)
    DespawnMob(mob:getID()+3)
    DespawnMob(mob:getID()+4)
    DespawnMob(mob:getID()+5)
    DespawnMob(mob:getID()+6)
    DespawnMob(mob:getID()+7)
    DespawnMob(mob:getID()+8)
end