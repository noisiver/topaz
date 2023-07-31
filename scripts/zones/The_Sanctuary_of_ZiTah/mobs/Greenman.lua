-----------------------------------
-- Area: The Sanctuary of Zi'Tah (121)
--   NM: Greenman
-- Note: Popped by qm1
-- Involved in Quest: The Weight Of Your Limits
-- !pos -325.406 -0.198 471.459 121
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 75 and hitTrigger == 0 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 15)
        mob:setDelay(3500)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
        mob:setDelay(2500)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
        mob:setDelay(2000)
        mob:setLocalVar("TriggerHit", 3)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.steel_cyclone, player)
end



