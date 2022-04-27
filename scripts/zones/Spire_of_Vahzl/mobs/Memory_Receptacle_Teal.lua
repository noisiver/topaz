-----------------------------------
-- Area: Spire of Vahzl
--  Mob: Memory Receptacle Teal
-- Pulling the Plug
-- !addkeyitem CENSER_OF_ACRIMONY
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    if mob:getTP() > 0 then
        mob:setTP(0)
    end
end

function onMobDeath(mob, player, isKiller)
    local Red = GetMobByID(mob:getID() - 3)
    local Add = GetMobByID(mob:getID()+1)
    Add:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
    Add:spawn()
    Add:updateEnmity(player)
    Red:delStatusEffectSilent(tpz.effect.PHYSICAL_SHIELD)
    printf("Delete status = Physical Shield");
end


