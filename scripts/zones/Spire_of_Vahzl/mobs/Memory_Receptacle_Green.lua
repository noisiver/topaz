-----------------------------------
-- Area: Spire of Vahzl
--  Mob: Memory Receptacle Green
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
     mob:setMod(tpz.mod.REGAIN, 250)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local Red = GetMobByID(mob:getID() - 2)
    local Add = GetMobByID(mob:getID()+3)
    Add:spawn()
    Add:updateEnmity(player)
    Red:delStatusEffectSilent(tpz.effect.MAGIC_SHIELD, 0, 1, 0, 0)
    printf("Delete status - Magic Shield");
end
