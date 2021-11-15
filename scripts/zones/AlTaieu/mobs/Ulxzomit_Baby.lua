-----------------------------------
-- Area: Al'Taieu
--   NM: Ulxzomit Baby
-- Note: Follows around mother Ulxzomits
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.MOVE, 45)
    onPath(mob)
end

function onPath(mob)
    local MotherOne = GetMobByID(16912394)
    local MotherTwo = GetMobByID(16912409)
    local MotherThree = GetMobByID(16912422)
    local MotherFour = GetMobByID(16912426)
    local MotherFive = GetMobByID(16912443)
    local MotherSix = GetMobByID(16912449)
    local MotherSeven = GetMobByID(16912455)
    local MotherEight = GetMobByID(16912545)
	local mobId = mob:getID()
	switch (mobId): caseof {
		[16912395] = function() mob:pathTo(MotherOne:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912396] = function() mob:pathTo(MotherOne:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		
		[16912410] = function() mob:pathTo(MotherTwo:getXPos() + 0.15, MotherTwo:getYPos(), MotherTwo:getZPos() + 0.15) end,
		[16912411] = function() mob:pathTo(MotherTwo:getXPos() + 0.15, MotherTwo:getYPos(), MotherTwo:getZPos() + 0.15) end,
		
		[16912423] = function() mob:pathTo(MotherThree:getXPos() + 0.15, MotherThree:getYPos(), MotherThree:getZPos() + 0.15) end,
		[16912424] = function() mob:pathTo(MotherThree:getXPos() + 0.15, MotherThree:getYPos(), MotherThree:getZPos() + 0.15) end,

		[16912427] = function() mob:pathTo(MotherFour:getXPos() + 0.15, MotherFour:getYPos(), MotherFour:getZPos() + 0.15) end,
		[16912428] = function() mob:pathTo(MotherFour:getXPos() + 0.15, MotherFour:getYPos(), MotherFour:getZPos() + 0.15) end,

		[16912444] = function() mob:pathTo(MotherFive:getXPos() + 0.15, MotherFive:getYPos(), MotherFive:getZPos() + 0.15) end,
		[16912445] = function() mob:pathTo(MotherFive:getXPos() + 0.15, MotherFive:getYPos(), MotherFive:getZPos() + 0.15) end,
		
		[16912450] = function() mob:pathTo(MotherSix:getXPos() + 0.15, MotherSix:getYPos(), MotherSix:getZPos() + 0.15) end,
		[16912451] = function() mob:pathTo(MotherSix:getXPos() + 0.15, MotherSix:getYPos(), MotherSix:getZPos() + 0.15) end,
		
		[16912456] = function() mob:pathTo(MotherSeven:getXPos() + 0.15, MotherSeven:getYPos(), MotherSeven:getZPos() + 0.15) end,
		[16912457] = function() mob:pathTo(MotherSeven:getXPos() + 0.15, MotherSeven:getYPos(), MotherSeven:getZPos() + 0.15) end,
		
		[16912546] = function() mob:pathTo(MotherEight:getXPos() + 0.15, MotherEight:getYPos(), MotherEight:getZPos() + 0.15) end,
		[16912547] = function() mob:pathTo(MotherEight:getXPos() + 0.15, MotherEight:getYPos(), MotherEight:getZPos() + 0.15) end,
	}
end


function onMobDeath(mob, player, isKiller)
end

