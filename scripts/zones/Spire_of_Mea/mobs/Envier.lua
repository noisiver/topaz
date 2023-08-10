-----------------------------------
-- Area: Spire of Mea
--  Mob: Envier
-- Playing Host
-- !addkeyitem CENSER_OF_ANIMUS
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
    local seetherTime = mob:getLocalVar("Seether")
    local seetherTimeTwo = mob:getLocalVar("SeetherTwo")
    local seetherTimeThree = mob:getLocalVar("SeetherThree")
    local Seether = GetMobByID(mob:getID()+1)
    local Seethertwo = GetMobByID(mob:getID()+2)
    local Seetherthree = GetMobByID(mob:getID()+3)

    if seetherTime == 0 then
        mob:setLocalVar("Seether", 120)
        --printf("Set Seether Time");
        return
    elseif mob:getBattleTime() >= seetherTime then
        Seether:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Seether:spawn()
        Seether:updateEnmity(target)
        mob:setLocalVar("Seether", mob:getBattleTime() + 360)
        --printf("Spawn Seether, Set time to spawn again in 6m");
    end
    if seetherTimeTwo == 0 then
        mob:setLocalVar("SeetherTwo", 240)
        --printf("Set Seether Time Two");
        return
    elseif mob:getBattleTime() >= seetherTimeTwo then
        Seether:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Seethertwo:spawn()
        Seethertwo:updateEnmity(target)
        mob:setLocalVar("SeetherTwo", mob:getBattleTime() + 360)
        --printf("Spawn Seether Two, Set time to spawn again in 6m");
    end
    if seetherTimeThree == 0 then
        mob:setLocalVar("SeetherThree", 360)
        --printf("Set Seether Time Three");
        return
    elseif mob:getBattleTime() >= seetherTimeThree then
        Seether:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Seetherthree:spawn()
        Seetherthree:updateEnmity(target)
        mob:setLocalVar("SeetherThree", mob:getBattleTime() + 360)
        --printf("Spawn Seether Three, Set time to spawn again in 6m");
    end

    if mob:getHPP() <= 25  then
        mob:setMod(tpz.mod.REGAIN, 500)
    end
end




function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
    DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)
    DespawnMob(mob:getID()+3)
end