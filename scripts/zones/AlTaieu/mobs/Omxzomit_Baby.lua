-----------------------------------
-- Area: Al'Taieu
--   NM: Omxzomit Baby
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
    local MotherOne = GetMobByID(16912484)
    local MotherTwo = GetMobByID(16912504)
    local MotherThree = GetMobByID(16912521)
    local MotherFour = GetMobByID(16912578)
    local MotherFive = GetMobByID(16912687)
    local MotherSix = GetMobByID(16912785)
    local MotherSeven = GetMobByID(16912792)
	local mobId = mob:getID()
	switch (mobId): caseof {
		[16912485] = function() mob:pathTo(MotherOne:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912486] = function() mob:pathTo(MotherOne:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		
		[16912505] = function() mob:pathTo(MotherTwo:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912506] = function() mob:pathTo(MotherTwo:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		
		[16912522] = function() mob:pathTo(MotherThree:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912523] = function() mob:pathTo(MotherThree:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		
		[16912579] = function() mob:pathTo(MotherFour:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912580] = function() mob:pathTo(MotherFour:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,

		[16912688] = function() mob:pathTo(MotherFive:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912689] = function() mob:pathTo(MotherFive:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,

		[16912786] = function() mob:pathTo(MotherSix:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912787] = function() mob:pathTo(MotherSix:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		
		[16912793] = function() mob:pathTo(MotherSeven:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
		[16912794] = function() mob:pathTo(MotherSeven:getXPos() + 0.15, MotherOne:getYPos(), MotherOne:getZPos() + 0.15) end,
	}
end


function onMobDeath(mob, player, isKiller)
end

