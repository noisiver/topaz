-----------------------------------
-- Area: Ordelle's Caves
--   NM: Zeid
-- !additem 481
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
	mob:setDamage(120)
    mob:addMod(tpz.mod.ATTP, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 6063)
	mob:setLocalVar("TwoHourUsed", 0)
end

function onMobInitialize(mob)
end

function onMobFight(mob, target)
	local StunTime = mob:getLocalVar("StunTime")
	local DreadSpikesTime = mob:getLocalVar("DreadSpikesTime")
	local DrainTime = mob:getLocalVar("DrainTime")
	local BattleTime = mob:getBattleTime()
	
	if mob:getHPP() >= 50 then
		if StunTime == 0 then
			mob:setLocalVar("StunTime", BattleTime + 45)
		elseif BattleTime >= StunTime then
			mob:castSpell(252) -- Stun
			target:PrintToPlayer("No, pay closer attention and copy my technique.",0,"Zeid")
			mob:setLocalVar("StunTime", BattleTime + 45)
		end
	end
	
	if mob:getHPP() <= 50 and mob:getHPP() > 25 then
		if DreadSpikesTime == 0 then
			mob:setLocalVar("DreadSpikesTime", BattleTime)
		elseif BattleTime >= DreadSpikesTime then
			local typeEffect = tpz.effect.DREAD_SPIKES
			mob:addStatusEffect(typeEffect, 0, 0, 60, 0, 1000, 1)
			target:PrintToPlayer("Give me all you've got!",0,"Zeid")
			mob:setLocalVar("DreadSpikesTime", BattleTime + 45)
		end
	end
	
	if mob:getHPP() <= 25 then
		if DrainTime == 0 then
			mob:setLocalVar("DrainTime", BattleTime)
		elseif BattleTime >= DrainTime then
			mob:castSpell(246) -- Drain II
			local zonePlayers = mob:getZone():getPlayers()
			for _, zonePlayer in pairs(zonePlayers) do
				target:PrintToPlayer("I feed off your rage!",0,"Zeid")
			end
			mob:setLocalVar("DrainTime", BattleTime + 45)
		end
	end
	
	local TwoHourUsed = mob:getLocalVar("TwoHourUsed")
	if mob:getHPP() <= 50 and TwoHourUsed == 0 then
		mob:useMobAbility(695) -- Blood weapon
		mob:setMobMod(tpz.mobMod.SKILL_LIST, 6064)
		target:PrintToPlayer("I must fight with you longer!",0,"Zeid")
		mob:setLocalVar("TwoHourUsed", 1)
	end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 252 then -- Stun
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
	end
    if spell:getID() == 246 then -- Drain II
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
	end
end

function onMobDeath(mob, player, isKiller)
		player:PrintToPlayer("You have learned well.",0,"Zeid")
end
