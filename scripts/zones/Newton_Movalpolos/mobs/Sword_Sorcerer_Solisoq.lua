------------------------------
-- Area: Newton Movalpolos
--   NM: Sword Sorcerer Solisoq
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(200) -- Hit the Paladin for 100-250.
    mob:addMod(tpz.mod.DEFP, 100)  --  450 Atk each Soboro hit did 20~60 so I would assume it has rather high Defense, 
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 20)
	mob:setLocalVar("TwoHourUsed", 0)
end

function onMobFight(mob, target)
	local TwoHourUsed = mob:getLocalVar("TwoHourUsed")
	if mob:getHPP() <= 75 and TwoHourUsed == 0 then
		mob:useMobAbility(692) -- Chainspell
		mob:setLocalVar("TwoHourUsed", 1)
	end
	if mob:getHPP() <= 50 and TwoHourUsed == 1 then
		mob:useMobAbility(692) -- Chainspell
		mob:setLocalVar("TwoHourUsed", 2)
	end
	if mob:getHPP() <= 25 and TwoHourUsed == 2 then
		mob:useMobAbility(692) -- Chainspell
		mob:setLocalVar("TwoHourUsed", 3)
	end
end

function onMobDisengage(mob)
	mob:setLocalVar("TwoHourUsed", 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 249)
end
