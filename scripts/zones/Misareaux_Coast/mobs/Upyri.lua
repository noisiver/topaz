-----------------------------------
-- Area: Misareaux Coast
--   NM: Upyri
-----------------------------------
-- NOTES/TO DO: Tends to use weapon skills twice in a row during night time, based on retail testing.
-- There is about a 1-2 second delay, and will use the same move twice. He will rarely use a weaponskill 3 times in a row. Let's say about a 10% chance.
-- Will weapon skill normally during the day.
-- Also, may only use Soul Accretion at night.
-- Special Attacks: Hits harder at night than during the day.
-- Earring may or may not drop only if the ToD was at night.
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SDT_DARK, 05)
	local currentHour = VanadielHour()
	if currentHour >= 18 and currentHour < 6 then
		mob:setMod(tpz.mod.REGAIN, 150)
		mob:setMod(tpz.mod.MAIN_DMG_RATING, 50)
		mob:setMod(tpz.mod.DEFP, 200) 
	else
		mob:setMod(tpz.mod.MAIN_DMG_RATING, 0)
		mob:setMod(tpz.mod.REGAIN, 50)
		mob:setMod(tpz.mod.DEFP, 25) 
	end
end

function onMobWeaponSkill(target, mob, skill)
	local currentHour = VanadielHour()
	if currentHour >= 18 and currentHour < 6 then
		if skill:getID() == 394 then
			local blooddrain = mob:getLocalVar("blooddrain")

			blooddrain = blooddrain +1
			mob:setLocalVar("blooddrain", blooddrain)

			if blooddrain > 2 then
				mob:setLocalVar("blooddrain", 0)
			else
				mob:useMobAbility(394)
			end
		end
		if skill:getID() == 1156 then
			local marrowdrain = mob:getLocalVar("marrowdrain")

			marrowdrain = marrowdrain +1  
			mob:setLocalVar("marrowdrain", marrowdrain)

			if marrowdrain > 2 then
				mob:setLocalVar("marrowdrain", 0)
			else
				mob:useMobAbility(1156)
			end
		end
		if skill:getID() == 1401 then
			local soulaccretion = mob:getLocalVar("soulaccretion")

			soulaccretion = soulaccretion +1
			mob:setLocalVar("soulaccretion", soulaccretion)

			if soulaccretion > 2 then
				mob:setLocalVar("soulaccretion", 0)
			else
				mob:useMobAbility(1401)
			end
		end
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end
