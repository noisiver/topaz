-----------------------------------
--
--  WotG utilities
--
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
        if math.random(2) == 2 then
		    player:addTreasure(tpz.items.DAYBREAK_SOUL, mob)
        else
            player:addTreasure(tpz.items.TWILIGHT_SOUL, mob)
        end
	end
end

tpz.wotg.MagianT2 = function(mob, player, isKiller)
    player:addCurrency("allied_notes", 300)
	if isKiller and math.random(1,100) <= 24 then
        if math.random(2) == 2 then
		    player:addTreasure(tpz.items.INCRESCENT_SHADE, mob)
        else
            player:addTreasure(tpz.items.DECRESCENT_SHADE, mob)
        end
	end
end

tpz.wotg.MagianT3 = function(mob, player, isKiller)
    player:addCurrency("allied_notes", 500)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(tpz.items.SILVER_MIRROR, mob)
	end
end

tpz.wotg.MagianT4 = function(mob, player, isKiller)
    player:addCurrency("allied_notes", 1000)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(tpz.items.CHUNK_OF_RIFTSAND, mob)
	end
end