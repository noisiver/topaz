-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Maat
-- Genkai 5 Fight
-----------------------------------
mixins = {require("scripts/mixins/families/maat")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 10) 
    mob:addMod(tpz.mod.EVA, 10)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    if mob:getMainJob() == tpz.job.RDM then
        mob:addStatusEffect(tpz.effect.SHELL, 22, 0, 3600)
        mob:addStatusEffect(tpz.effect.AQUAVEIL, 1, 0, 3600)
        mob:addStatusEffect(tpz.effect.BLINK, 3, 0, 3600)
    end
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 100 and hitTrigger == 0 then
        mob:setMod(tpz.mod.REGAIN, 250)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        mob:setMod(tpz.mod.REGAIN, 500)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 30 and hitTrigger == 2 then
        mob:setMod(tpz.mod.REGAIN, 1000)
        mob:setLocalVar("TriggerHit", 3)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
