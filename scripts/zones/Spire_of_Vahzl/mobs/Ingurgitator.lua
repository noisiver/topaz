 -----------------------------------
-- Area: Spire of Vahzl
--  Mob: Ingurgitator
-- Pulling the Plug
-- !addkeyitem CENSER_OF_ACRIMONY
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/promyvion")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------

function onMobSpawn(mob)
     tpz.promyvion.setEmptyModel(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    local seetherTime = mob:getLocalVar("Seether")
    local seetherTimeTwo = mob:getLocalVar("SeetherTwo")
    local Seether = GetMobByID(mob:getID()+2)
    local SeetherTwo = GetMobByID(mob:getID()+3)


    if seetherTime == 0 then
        mob:setLocalVar("Seether", 60)
        printf("Set Seether Time");
        return
    elseif mob:getBattleTime() >= seetherTime then
        Seether:spawn()
        Seether:updateEnmity(target)
        mob:setLocalVar("Seether", mob:getBattleTime() + 180)
        printf("Spawn Neoingurgitato #1");
    end
    if seetherTimeTwo == 0 then
        mob:setLocalVar("SeetherTwo", 120)
        printf("Set Seether Time Two");
        return
    elseif mob:getBattleTime() >= seetherTimeTwo then
        SeetherTwo:spawn()
        SeetherTwo:updateEnmity(target)
        mob:setLocalVar("SeetherTwo", mob:getBattleTime() + 180)
        printf("Spawn Neoingurgitato #2");
    end
end




function onMobDeath(mob, player, isKiller)
    tpz.promyvion.onEmptyDeath(mob)
    DespawnMob(mob:getID()+2)
    DespawnMob(mob:getID()+3)
end