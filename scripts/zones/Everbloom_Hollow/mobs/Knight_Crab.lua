-----------------------------------
-- Area: Everbloom Hollow
--  Mob: Knight Crab
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Everbloom_Hollow/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobFight(mob, target)
	local KingAthro = GetMobByID(mob:getID()-1)
	local WatergaTime = mob:getLocalVar("WatergaTime")
	local BattleTime = mob:getBattleTime()

	if WatergaTime == 0 then
		mob:setLocalVar("WatergaTime", BattleTime + math.random(5, 15))
	elseif BattleTime >= WatergaTime then
		mob:castSpell(202, KingAthro) -- Waterga IV
		mob:setLocalVar("WatergaTime", BattleTime + 30)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
