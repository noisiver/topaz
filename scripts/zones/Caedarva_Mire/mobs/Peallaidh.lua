-----------------------------------
-- Area: Caedarva Mire
--  Mob: Peallaidh
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(125) 
    mob:addMod(tpz.mod.DEFP, 25)
    mob:setMod(tpz.mod.STORETP, 150)
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobWeaponSkill(target, mob, skill)
    local spawns = { 17100890, 17100891, 17100893, 17100894, 17100901, 17100902}
    local ChigoeOne = GetMobByID(spawns[math.random(#spawns)])
    local ChigoeTwo = GetMobByID(spawns[math.random(#spawns)])
	ChigoeOne:setPos(mob:getPos())
	ChigoeOne:spawn()
	ChigoeOne:updateEnmity(target)
	ChigoeTwo:setPos(mob:getPos())
	ChigoeTwo:spawn()
	ChigoeTwo:updateEnmity(target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 468)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
