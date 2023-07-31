-----------------------------------
-- Area: Lufaise Meadows
--  Mob: Sengann
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/fomor_hate")}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.ZANSHIN, 20)
	mob:setMod(tpz.mod.REGAIN, 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    if mob:getHPP() <= 50 and hitTrigger == 0 then
        mob:addMod(tpz.mod.ACC, 50)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 20 and hitTrigger == 1 then
        mob:addMod(tpz.mod.ACC, 150)
		mob:setMod(tpz.mod.REGAIN, 1000)
        mob:setLocalVar("TriggerHit", 2)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.CURSE, {chance = 25, power = 33 })
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 441)
end
