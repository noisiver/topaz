-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Batteilant Bhoot
-----------------------------------

function onMobFight(mob, target)
	local StunTime = mob:getLocalVar("StunTime")
	local DreadSpikesTime = mob:getLocalVar("DreadSpikesTime")
	local DrainTime = mob:getLocalVar("DrainTime")
	local BattleTime = mob:getBattleTime()
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
end

function onMobWeaponSkill(target, mob, skill)
	local AbyssBlastCounter = mob:getLocalVar("AbyssBlastCounter")
	local AbyssBlastMax = mob:getLocalVar("AbyssBlastMax")
	local Roll = math.random()

    if skill:getID() == 492 then -- Abyss Blast
		if Roll < 0.2 then
			AbyssBlastMax = 10
		elseif Roll < 0.5 then
			AbyssBlastMax = 8
		elseif Roll < 0.7 then
			AbyssBlastMax = 6
		else 
			AbyssBlastMax = 4
		end
		mob:setLocalVar("AbyssBlastMax", AbyssBlastMax)
	end

	if AbyssBlastMax > 0 then
		if AbyssBlastCounter > AbyssBlastMax then
			mob:setLocalVar("AbyssBlastCounter", 0)
			mob:setLocalVar("AbyssBlastMax", 0)
		else
			mob:useMobAbility(492) -- Abyss Blast
			AbyssBlastCounter = AbyssBlastCounter + 1
			mob:setLocalVar("AbyssBlastCounter", AbyssBlastCounter)
		end
	end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
