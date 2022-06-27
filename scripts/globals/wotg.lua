-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/zone")
require("scripts/globals/items")
-----------------------------------

tpz = tpz or {}
tpz.wotg = tpz.wotg or {}

tpz.wotg.MagianT1 = function(mob, player, isKiller)
    player:addCurrency("allied_notes", 200)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2968, mob)-- Daybreak Soul
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2969, mob) -- Twilight Soul
	end
end