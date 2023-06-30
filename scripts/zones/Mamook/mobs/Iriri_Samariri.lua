-----------------------------------
-- Area: Mamook
--   NM: Iriri Samariri (T2 ZNM)
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins =
{
require("scripts/mixins/rage"),
require("scripts/mixins/job_special"),
require("scripts/mixins/families/poroggo")
}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(125)
    mob:setMod(tpz.mod.DEF, 450)
    mob:setMod(tpz.mod.EVA, 340)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6500) -- 7k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 7300) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setSpellList(2044) 
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setLocalVar("BreakChance", 5)
end

function onMobFight(mob, target)
    for i = 17043889, 17043892, 1 do
        local pet = GetMobByID(i)
        if  pet:isSpawned() then
            pet:updateEnmity(target)
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1960 then -- Frog Cheer
        for i = 17043889, 17043892, 1 do
            local pet = GetMobByID(i)
            pet:spawn()
            pet:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos())
        end
    end
end

function onMobDeath(mob, player, isKiller)
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
