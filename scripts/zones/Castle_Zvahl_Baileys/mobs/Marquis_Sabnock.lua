------------------------------
-- Area: Castle Zvahl Baileys
--   NM: Marquis Sabnock
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.MDEF, 24) 
     mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
     mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:addMod(tpz.mod.GRAVITYRESTRAIT, 100)
     mob:addMod(tpz.mod.BINDRESTRAIT, 100)
     mob:addMod(tpz.mod.SILENCERESTRAIT, 100)
     mob:setMod(tpz.mod.REFRESH, 300)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobInitialize(mob)
    mob:setMod(tpz.mod.UFASTCAST, 50) 
end


function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 50 and hitTrigger == 0 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6007)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 25 and hitTrigger == 1 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6008)
        mob:setLocalVar("TriggerHit", 2)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 352)
end
