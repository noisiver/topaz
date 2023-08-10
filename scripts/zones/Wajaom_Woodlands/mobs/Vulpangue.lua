-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Vulpangue
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
	mob:setDamage(90)
    mob:setMod(tpz.mod.DEF, 450)
    mob:setMod(tpz.mod.EVA, 380)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 3000) -- 5k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 5000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:addMod((tpz.mod.FIRE_ABSORB + VanadielDayElement() - 1), 100)
    mob:addMod(tpz.mod.WIND_ABSORB, 100)
    mob:setLocalVar("HPP", 90)
end

function onMobFight(mob, target)
    local defUpHPP = mob:getLocalVar("HPP")
    if mob:getHPP() <= defUpHPP then
        if mob:getHPP() > 10 then
            mob:addMod(tpz.mod.ACC, 10)
            mob:addMod(tpz.mod.HASTE_MAGIC, 400)
            mob:addMod(tpz.mod.MAIN_DMG_RATING, 5)
            mob:setLocalVar("HPP", mob:getHPP() - 10)
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 100)
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
