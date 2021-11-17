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
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 6063)
	mob:setLocalVar("TwoHourUsed", 0)
end

function onMobInitialize(mob)
end

function onMobFight(mob, target)
	local DreadSpikesTime = mob:getLocalVar("DreadSpikesTime")
    local BattleTime = mob:getBattleTime()
	if DreadSpikesTime == 0 then
		mob:setLocalVar("DreadSpikesTime", BattleTime + 30)
	elseif DreadSpikesTime >= BattleTime then
		mob:castSpell(252) -- Stun
		mob:castSpell(277) -- Dread Spikes
		local zonePlayers = mob:getZone():getPlayers()
		for _, zonePlayer in pairs(zonePlayers) do
			mob:PrintToPlayer("Give me all you've got!",0,"Zeid")
		end
		mob:setLocalVar("DreadSpikesTime", BattleTime + 30)
	end
	
	local TwoHourUsed = mob:getLocalVar("TwoHourUsed")
	if mob:getHPP() <= 50 and TwoHourUsed == 0 then
		mob:useMobAbility(695) -- Blood weapon
		mob:setMobMod(tpz.mobMod.SKILL_LIST, 6064)
		local zonePlayers = mob:getZone():getPlayers()
		for _, zonePlayer in pairs(zonePlayers) do
			mob:PrintToPlayer("I must fight with you longer!",0,"Zeid")
		end
		mob:setLocalVar("TwoHourUsed", 1)
	end
	
	if mob:getHPP() <= 25 then
		local DrainTime = mob:getLocalVar("DrainTime")
		if DrainTime == 0 then
			mob:setLocalVar("DrainTime", BattleTime)
		elseif DrainTime >= BattleTime then
			mob:castSpell(246) -- Drain II
			local zonePlayers = mob:getZone():getPlayers()
			for _, zonePlayer in pairs(zonePlayers) do
				mob:PrintToPlayer("I feed off your rage!",0,"Zeid")
			end
			mob:setLocalVar("DrainTime", BattleTime + 30)
		end
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
	local zonePlayers = player:getZone():getPlayers()
	for _, zonePlayer in pairs(zonePlayers) do
		player:PrintToPlayer("You have learned well.",0,"Zeid")
	end
end
