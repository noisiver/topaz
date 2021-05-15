-----------------------------------
-- Area: Balgias Dias
-- Mob: King of Coins
-- Royale Ramble
-- !addkeyitem 1178
-----------------------------------
local ID = require("scripts/zones/Balgias_Dais/IDs")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REGAIN, 250)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local King = GetMobByID(mob:getID()-3)
    local KingTwo = GetMobByID(mob:getID()-2)
    local KingThree = GetMobByID(mob:getID()-1)
    local Queen = GetMobByID(mob:getID()+1)
    local QueenTwo = GetMobByID(mob:getID()+2)
    local Spawn = mob:getLocalVar("Spawn")
    local Rage = mob:getLocalVar("Rage")

    DespawnMob(King)
    DespawnMob(KingTwo)
    DespawnMob(KingThree)

    if Spawn == 0 then
        Queen:spawn()
        Queen:updateEnmity(target)
        QueenTwo:spawn()
        QueenTwo:updateEnmity(target)
        mob:setLocalVar("Spawn", 1)
    end
    if (mob:hasStatusEffect(tpz.effect.WEIGHT) or mob:hasStatusEffect(tpz.effect.CURSE) or mob:hasStatusEffect(tpz.effect.BIND)) then
        mob:setLocalVar("Rage", 1)
    end
    if Rage == 1 then
         mob:setLocalVar("[rage]timer", 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.DISPEL, {chance = 25})
end

function onMobDeath(mob, player, isKiller)
end