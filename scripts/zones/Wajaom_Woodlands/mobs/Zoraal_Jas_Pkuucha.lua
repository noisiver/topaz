-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Zoraal Ja's Pkuucha
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs")
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/colibri_mimic")}
------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("whenToPopZoraal", math.random(20, 50))
    mob:setLocalVar("hasPoppedZoraal", 0)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25)
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDisengage(mob)
    mob:setLocalVar("hasPoppedZoraal", 0)
    if(GetMobByID(ID.mob.PERCIPIENT_ZORAAL_JA):isSpawned()) then
        DespawnMob(ID.mob.PERCIPIENT_ZORAAL_JA)
    end
end

function onMobRoam(mob)
    mob:setLocalVar("hasPoppedZoraal", 0)
    if(GetMobByID(ID.mob.PERCIPIENT_ZORAAL_JA):isSpawned()) then
        DespawnMob(ID.mob.PERCIPIENT_ZORAAL_JA)
    end
end

function onMobFight(mob, target)
    if (
        mob:getHPP() <= mob:getLocalVar("whenToPopZoraal") and
        not GetMobByID(ID.mob.PERCIPIENT_ZORAAL_JA):isSpawned() and
        mob:getLocalVar("hasPoppedZoraal") == 0
    ) then
        GetMobByID(ID.mob.PERCIPIENT_ZORAAL_JA):setSpawn(mob:getXPos()+math.random(-2, 2), mob:getYPos(), mob:getZPos()+math.random(-2, 2))
        SpawnMob(ID.mob.PERCIPIENT_ZORAAL_JA):updateEnmity(target)
        mob:setHP(mob:getMaxHP())
        mob:setUnkillable(true)
        mob:setLocalVar("hasPoppedZoraal", 1)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 447)
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
