-----------------------------------
-- Area: Spire of Mea
--  Mob: Envier
-- Playing Host
-- !addkeyitem CENSER_OF_ANIMUS
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
     mob:setMobMod(tpz.mobMod.NO_DROPS)
end

function onMobFight(mob, target)
    local seetherTime = mob:getLocalVar("Seether")
    local seetherTimeTwo = mob:getLocalVar("SeetherTwo")
    local seetherTimeThree = mob:getLocalVar("SeetherThree")
    local Seether = GetMobByID(mob:getID()+1)
    local Seethertwo = GetMobByID(mob:getID()+1)
    local Seetherthree = GetMobByID(mob:getID()+1)

    if seetherTime == 0 then
        mob:setLocalVar("Seether", 120)
        printf("Set Seether Time");
        return
    elseif mob:getBattleTime() >= seetherTime then
        Seether:spawn()
        Seether:updateEnmity(target)
        mob:setLocalVar("Seether", mob:getBattleTime() + 480)
        printf("Spawn Seether, Set time to spawn again in 6m");
    end
    if seetherTimeTwo == 0 then
        mob:setLocalVar("SeetherTwo", 240)
        printf("Set Seether Time Two");
        return
    elseif mob:getBattleTime() >= seetherTimeTwo then
        Seethertwo:spawn()
        Seethertwo:updateEnmity(target)
        mob:setLocalVar("SeetherTwo", mob:getBattleTime() + 480)
        printf("Spawn Seether Two, Set time to spawn again in 6m");
    end
    if seetherTimeThree == 0 then
        mob:setLocalVar("SeetherThree", 360)
        printf("Set Seether Time");
        return
    elseif mob:getBattleTime() >= seetherTimeThree then
        Seetherthree:spawn()
        Seetherthree:updateEnmity(target)
        mob:setLocalVar("SeetherThree", mob:getBattleTime() + 480)
        printf("Spawn Seether Three, Set time to spawn again in 6m");
    end
end




function onMobDeath(mob, player, isKiller)
    DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)
    DespawnMob(mob:getID()+3)
end