-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Gerwitz's Scythe
-- Involved In Quest: Blade of Evil
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.DEFP, 50) 
	mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
	RNG = math.random(1, 2)
	if RNG == 1 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TP_DRAIN, {chance = 25, power = math.random(100, 150)})
	elseif RNG == 2 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.MP_DRAIN, {chance = 25, power = math.random(100, 150)})
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getQuestStatus(BASTOK, tpz.quest.id.bastok.BLADE_OF_EVIL) == QUEST_ACCEPTED then
        player:setCharVar("bladeOfEvilCS", 1)
    end
end
