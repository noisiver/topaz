-----------------------------------
-- Area: Halvung
--  Mob: Mythril_Mouth_Monamaq
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
local ID = require("scripts/zones/Halvung/IDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
	mob:setMod(tpz.mod.DEF, 10000)
    mob:setMod(tpz.mod.VIT, 200)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setAggressive(0)
end

function onMobFight(mob, target)
	local GuardOne = GetMobByID(mob:getID()+1)
	local GuardTwo = GetMobByID(mob:getID()+2)

	if GuardOne:isSpawned() then
		GuardOne:updateEnmity(target)
	end
	if  GuardTwo:isSpawned() then
		GuardTwo:updateEnmity(target)
	end

	if not GuardOne:isSpawned() then
		GuardOne:setPos(mob:getPos())
		GuardOne:spawn()
		GuardOne:updateEnmity(target)
	elseif not GuardTwo:isSpawned() then
		GuardTwo:setPos(mob:getPos())
		GuardTwo:spawn()
		GuardTwo:updateEnmity(target)
	end

    tpz.mix.jobSpecial.config(mob, {
    specials =
    {
        {id = tpz.jsa.CHAINSPELL, cooldown = 180, hpp = 90},
    },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
    DespawnMob(mob:getID()+1)
    DespawnMob(mob:getID()+2)
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
end

