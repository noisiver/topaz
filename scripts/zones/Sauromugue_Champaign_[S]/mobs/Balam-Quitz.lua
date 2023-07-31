------------------------------
-- Area: Sauromugue Champaign [S]
--   NM: Balam-Quitz
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.EVA, 25)
    mob:addMod(tpz.mod.ACC, 25)
	mob:setMod(tpz.mod.LTNG_ABSORB, 100)
	mob:setUnkillable(true)
end

function onMobFight(mob, target)
local HP = mob:getHPP()
	if HP <= 1 then
        mob:useMobAbility(480) -- petrifactive_breath    
        mob:useMobAbility(481) -- frenzied_rage     
        mob:useMobAbility(2209) -- blink_of_peril     
	end
end

 function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 2209 then  --Blink of Peril  
            mob:setUnkillable(false)
            mob:setHP(0)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 529)
end
