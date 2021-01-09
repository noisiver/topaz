-----------------------------------
-- Area: Fei'Yin
--  NM: Altedour I Tavnazia
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------


function onMobSpawn(mob)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.SILENCERES, 100)
    mob:setMod(tpz.mod.SLEEPRES, 100)
    mob:setMod(tpz.mod.UDMGMAGIC, -70)
    mob:setMod(tpz.mod.ACC, 100)
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    if mob:getHPP() <= 50 and hitTrigger == 0 then
        mob:setMod(tpz.mod.STORETP, 25)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 25 and hitTrigger == 1 then
        mob:setMod(tpz.mod.STORETP, 50)
        mob:setLocalVar("TriggerHit", 2)
    end
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENASPIR)
end



