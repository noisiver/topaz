------------------------------
-- Area: Mamook
--   NM: Hundredfaced Hapool Ja Clone
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.REGAIN, 300)
    mob:SetMagicCastingEnabled(false)
    mob:setLocalVar("MijinTime", BattleTime + 0)
end

function onMobFight(mob, target)
	local MijinTime = mob:getLocalVar("MijinTime")
	local BattleTime = mob:getBattleTime()

	if MijinTime == 0 then
		mob:setLocalVar("MijinTime", BattleTime + math.random(30, 60))
	elseif BattleTime >= MijinTime then
		mob:castSpell(731) -- Mijin Gakure
		mob:setLocalVar("MijinTime", BattleTime + math.random(30, 60))
	end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 461)
end
