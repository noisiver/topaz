-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Mamool_Ja_Philosopher
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------
function onMobRoam(mob)
local CastTime = mob:getLocalVar("CastTime")
local SpawnTimer = mob:getLocalVar("SpawnTimer")
	
	if SpawnTimer == 0 then
		mob:setLocalVar("CastTime", os.time() + 3)
		mob:setLocalVar("SpawnTimer", 1)
	elseif SpawnTimer == 1 and os.time() > CastTime  then
		mob:setLocalVar("CastTime", os.time() + 180)
        mob:castSpell(251) -- Shock Spikes
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end
