-----------------------------------
-- Area: Caedarva Mire (79)
--  ZNM: Verdelet
-- !pos 417 -19.3 -70 79
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins =
{
require("scripts/mixins/rage"),
require("scripts/mixins/families/imp")
}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(100)
    mob:setMod(tpz.mod.DEF, 350)
    mob:setMod(tpz.mod.EVA, 300)
    mob:setMod(tpz.mod.MDEF, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGBREATH, 0) 
    mob:setMod(tpz.mod.SDT_FIRE, 100)
    mob:setMod(tpz.mod.SDT_ICE, 100)
    mob:setMod(tpz.mod.SDT_WIND, 60)
    mob:setMod(tpz.mod.SDT_EARTH, 100)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_WATER, 100)
    mob:setMod(tpz.mod.SDT_LIGHT, 115)
    mob:setMod(tpz.mod.SDT_DARK, 20)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6500) -- 7k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 7300) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:AnimationSub(0)
    mob:setLocalVar("HornBreakChance", 25)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
	local GrowTime = mob:getLocalVar("GrowTime")
	local BattleTime = mob:getBattleTime()
    local AnimationSub = mob:AnimationSub()
end

function onMobWeaponSkillPrepare(mob, target)
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