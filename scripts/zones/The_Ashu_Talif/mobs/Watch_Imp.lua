-----------------------------------
-- Area: The Ashu Talif
--   NM: Watch Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobInitialize(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
	if mob:AnimationSub() >= 1 then
		if math.random(1,100) <= 24 then 
			player:addTreasure(2157, mob)--Imp Horn
		end
	end
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end