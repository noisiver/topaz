------------------------------
-- Area: The Eldieme Necropolis
--   Raubahn
--  !additem 475 
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 10) 
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.UFASTCAST, 50)
	mob:setModelId(2234) -- Raubahn
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobFight(mob, target)
    local Phase = mob:getLocalVar("Phase")
    if mob:getHPP() <= math.random(10, 25) and Phase == 0 then
		mob:addMod(tpz.mod.ATTP, 20)
		mob:addMod(tpz.mod.DEFP, 20) 
		mob:useMobAbility(689) -- Benediction
        mob:setModelId(2234) -- Yellow Flan
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 112)
        target:PrintToPlayer("This power...I cannot contain it much longer...",0,"Raubahn")
		mob:setLocalVar("Phase", 1)
	end
    if mob:getHPP() <= math.random(10, 25) and Phase == 1 then
		mob:addMod(tpz.mod.ATTP, 20)
		mob:addMod(tpz.mod.DEFP, 20) 
		mob:useMobAbility(689) -- Benediction
		mob:setModelId(1774) -- Qutrub
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 203)
		target:PrintToPlayer("It's...too....powerful.....",0,"Raubahn")
		mob:setLocalVar("Phase", 2)
	end
    if mob:getHPP() <= math.random(10, 25) and Phase == 2 then
		mob:addMod(tpz.mod.ATTP, 20)
		mob:addMod(tpz.mod.DEFP, 20) 
		mob:useMobAbility(689) -- Benediction
		mob:setModelId(1775) -- Soulflayer
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 1963)
		target:PrintToPlayer("...All will succumb to the void....",0,"Soulflayer")
		mob:setLocalVar("Phase", 3)
	end
end


function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
	player:PrintToPlayer("...and you too shall succumb.",0,"Soulflayer")
end


