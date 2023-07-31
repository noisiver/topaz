------------------------------
-- Area: Fort Karugo-Narugo [S]
--   NM: Ratatoskr
------------------------------
require("scripts/globals/hunts")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 100 and hitTrigger == 0 then
        mob:setMod(tpz.mod.REGAIN, 100)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        mob:setMod(tpz.mod.REGAIN, 200)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 10 and hitTrigger == 2 then
        mob:setMod(tpz.mod.REGAIN, 300)
        mob:setLocalVar("TriggerHit", 3)
    end
end

function onMonsterMagicPrepare(mob, target)
    return 2 -- Cure II
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 522)
end
