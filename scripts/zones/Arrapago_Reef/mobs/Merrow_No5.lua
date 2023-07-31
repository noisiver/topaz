-----------------------------------
-- Area: Arrapago Reef
--  Mob: Merrow_No5
-----------------------------------
mixins = {
require("scripts/mixins/weapon_break"),
require("scripts/mixins/job_special")
}
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 25) 
     mob:addMod(tpz.mod.ATTP, 25)
     mob:addMod(tpz.mod.ACC, 25) 
     mob:addMod(tpz.mod.EVA, 25)
     mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
	local PaeonTime = mob:getLocalVar("PaeonTime")
	local CharmTime = mob:getLocalVar("CharmTime")
	local BattleTime = mob:getBattleTime()
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.SOUL_VOICE, duration = 30, cooldown = 180, hpp = 75},
        },
    })
	if mob:hasStatusEffect(tpz.effect.SOUL_VOICE) then
		if CharmTime == 0 then
			mob:setLocalVar("CharmTime", BattleTime + math.random(1, 30))
		elseif CharmTime > 0 and BattleTime >= CharmTime then
			mob:castSpell(466) -- Maidens Virelai
			mob:setLocalVar("CharmTime", BattleTime + math.random(1, 30))
		end
	end
    if mob:hasStatusEffect(tpz.effect.SOUL_VOICE) == false then
        mob:setLocalVar("CharmTime", 0)
    end
	
	if mob:getHPP() <= 15 then
		if PaeonTime == 0 then
			mob:setLocalVar("PaeonTime", BattleTime)
		elseif BattleTime >= PaeonTime then
			mob:castSpell(382) -- Army's Paeon V
			mob:setLocalVar("PaeonTime", BattleTime + 120)
		end
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end
