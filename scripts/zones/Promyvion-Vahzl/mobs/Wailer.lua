-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Wailer
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/promyvion")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.REGAIN, 10)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:setLocalVar("MemoryAttackTime", 0)
end

function onMobFight(mob, target)
	local MemoryAttackTime = mob:getLocalVar("DarkMode")
	local BattleTime = mob:getBattleTime()

    if MemoryAttackTime == 0 then
    	mob:setLocalVar("MemoryAttackTime", BattleTime + 25)
    elseif BattleTime >= MemoryAttackTime then
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:useMobAbility(math.random(1221, 1227)) -- Random "Memory Of___"
		mob:setLocalVar("MemoryAttackTime", BattleTime + 25)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
end