-----------------------------------
-- Area: Mount Zhayolm
--   NM: Anantaboga (T2 ZNM)
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/families/dahak")
}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(175)
    mob:setMod(tpz.mod.DEF, 500)
    mob:setMod(tpz.mod.EVA, 340)
    mob:setMod(tpz.mod.ENHANCE, 331)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 298)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6500) -- 7k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 7300) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
    if mob:hasStatusEffect(tpz.effect.SILENCE) then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6051)
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 200)
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
