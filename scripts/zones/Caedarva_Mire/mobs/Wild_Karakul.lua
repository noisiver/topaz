-----------------------------------
-- Area: Caedarva Mire
--  Mob: Wild Karakul
-- Note: PH for Peallaidh
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/karakul")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobWeaponSkill(target, mob, skill)
    local spawns = { 17100890, 17100891, 17100893, 17100894, 17100901, 17100902}
    local ChigoeOne = GetMobByID(spawns[math.random(#spawns)])
	ChigoeOne:setPos(mob:getPos())
	ChigoeOne:spawn()
	ChigoeOne:updateEnmity(target)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.PEALLAIDH_PH, 20, 3600) -- 1 hour
end
