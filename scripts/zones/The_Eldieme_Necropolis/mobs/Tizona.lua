------------------------------
-- Area: The Eldieme Necropolis
--   Raubahn
--  !additem 475 
--	!pos 105.9537 0.4000 -179.0539
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.UFASTCAST, 50)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setUnkillable(true)
end

function onMobFight(mob, target)
    local Phase = mob:getLocalVar("Phase")
	local HP = mob:getHPP()
    if HP < 25 and Phase == 0 then
		printf("Phase 1");
		mob:addMod(tpz.mod.ATTP, 20)
		mob:addMod(tpz.mod.DEFP, 20) 
		mob:useMobAbility(689) -- Benediction
        mob:setModelId(1799) -- Yellow Flan
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 112)
        target:PrintToPlayer("This power...I cannot contain it much longer...",0,"Raubahn")
		mob:setLocalVar("Phase", 1)
	end
    if HP < 25 and Phase == 1 then
		printf("Phase 2");
		mob:addMod(tpz.mod.ATTP, 20)
		mob:addMod(tpz.mod.DEFP, 20) 
		mob:useMobAbility(689) -- Benediction
		mob:setModelId(1774) -- Qutrub
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 203)
		target:PrintToPlayer("It's...too....powerful.....",0,"Raubahn")
		mob:setLocalVar("Phase", 2)
	end
    if HP < 25 and Phase == 2 then
		printf("Phase 3");
		mob:addMod(tpz.mod.ATTP, 20)
		mob:addMod(tpz.mod.DEFP, 20) 
		mob:useMobAbility(689) -- Benediction
		mob:setModelId(1775) -- Soulflayer
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 1963)
		target:PrintToPlayer("...All will succumb to the void....",0,"Soulflayer")
		mob:setLocalVar("Phase", 3)
		mob:setUnkillable(false)
	end
end


function onMobDeath(mob, player, isKiller)
	player:PrintToPlayer("...and you too shall succumb.",0,"Soulflayer")
end


