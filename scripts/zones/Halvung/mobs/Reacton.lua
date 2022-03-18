-----------------------------------
-- Area: Halvung
--   NM: Reacton (T2 ZNM)
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/rage")}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(175)
    mob:setMod(tpz.mod.DEF, 500)
    mob:setMod(tpz.mod.EVA, 340)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 900)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
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
