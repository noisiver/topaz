-----------------------------------
-- Area: Mount Zhayolm
--   Mob: Wamoura Prince
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/wamouracampa")}
-----------------------------------

function onMobDeath(mob)
    player:addCurrency("zeni_point", 10)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end
