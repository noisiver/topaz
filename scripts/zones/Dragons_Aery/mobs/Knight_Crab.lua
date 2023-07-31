-----------------------------------
-- Area: Dragon's Aery
--  Mob: Knight Crab
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Dragons_Aery/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    -- mob:addImmunity(tpz.immunity.SILENCE)
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobFight(mob, target)
	local KingArthro = GetMobByID(mob:getID()-1)
	local WatergaTime = mob:getLocalVar("WatergaTime")
	local BattleTime = mob:getBattleTime()

	if WatergaTime == 0 then
		mob:setLocalVar("WatergaTime", BattleTime + math.random(5, 15))
	elseif BattleTime >= WatergaTime then
		mob:castSpell(6, KingArthro) -- Cuure VI
		mob:setLocalVar("WatergaTime", BattleTime + 30)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
