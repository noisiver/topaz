-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Maat
-- Genkai 5 Fight
-----------------------------------
mixins = {require("scripts/mixins/families/maat")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end
function onMobFight(mob, target)
    mob:setMod(tpz.mod.REGAIN, 100)

    local hitTrigger = mob:getLocalVar("TriggerHit")
    if mob:getHPP() <= 50 and hitTrigger == 0 then
        mob:setMod(tpz.mod.REGAIN, 200)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 10 and hitTrigger == 1 then
        mob:setMod(tpz.mod.REGAIN, 1000)
        mob:setLocalVar("TriggerHit", 2)
    end
end

function onMobDeath(mob, player, isKiller)
end
