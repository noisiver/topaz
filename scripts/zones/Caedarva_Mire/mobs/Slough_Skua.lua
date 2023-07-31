-----------------------------------
-- Area: Caedarva Mire
--  Mob: Slough_Skua
-----------------------------------
-----------------------------------
function onMobFight(mob, target)
	local roll = math.random(1, 6)
	local rolldice = mob:getLocalVar("rolldice")
    local battletime = mob:getBattleTime()
	if battletime >= rolldice then
		if roll == 1 then	
			mob:useMobAbility(1990) --ninja_roll
			mob:setLocalVar("rolldice", battletime + math.random(60, 90))
		elseif roll == 2 then
			mob:useMobAbility(1985) --fighters_roll
			mob:setLocalVar("rolldice", battletime + math.random(60, 90))
		elseif roll == 3 then
			mob:useMobAbility(1986) --rogues_roll
			mob:setLocalVar("rolldice", battletime + math.random(60, 90))
		elseif roll == 4 then
			mob:useMobAbility(1988) --chaos_roll
			mob:setLocalVar("rolldice", battletime + math.random(60, 90))
		elseif roll == 5 then
			mob:useMobAbility(1989)  -- hunters_roll
			mob:setLocalVar("rolldice", battletime + math.random(60, 90))
		elseif roll == 6 then
			mob:useMobAbility(1987)  -- gallants_roll
			mob:setLocalVar("rolldice", battletime + math.random(60, 90))
		end
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
end