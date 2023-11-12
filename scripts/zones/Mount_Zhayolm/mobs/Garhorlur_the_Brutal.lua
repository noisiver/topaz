-----------------------------------
-- Area: Mount Zhayolm
--   NM: Garhorlur_the_Brutal
-----------------------------------
mixins = {
require("scripts/mixins/weapon_break"),
require("scripts/mixins/job_special")
}
require("scripts/globals/pathfind")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17027467)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
	onPath(mob)
end

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17027467)
end

function onPath(mob)
	local Unruly = GetMobByID(17027467)
	mob:pathTo(Unruly:getXPos(), Unruly:getYPos(), Unruly:getZPos())
end

function onMobDeath(mob, player, isKiller, noKiller)
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
