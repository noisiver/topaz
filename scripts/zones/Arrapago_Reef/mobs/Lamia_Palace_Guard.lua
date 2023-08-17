-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamia_Palace_Guard
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end
