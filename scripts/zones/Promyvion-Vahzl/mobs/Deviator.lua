-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Deviator
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
    mob:setLocalVar("LightTimer", 0)
	mob:setLocalVar("DarkTimer", 0)
	mob:setLocalVar("Mode", 0)
end

function onMobFight(mob, target)
	local LightTimer = mob:getLocalVar("LightTimer")
	local DarkTimer = mob:getLocalVar("DarkMode")
	local Mode = mob:getLocalVar("Mode")
	local BattleTime = mob:getBattleTime()

	if LightTimer == 0 and Mode == 0 then
		mob:setLocalVar("LightTimer", BattleTime)
	elseif BattleTime >= LightTimer then
        mob:useMobAbility(624) -- 2 hour "cloud" animation
		mob:castSpell(39) -- Banishga II
        mob:addMod(tpz.mod.LIGHT_ABSORB, 100)
        mob:delMod(tpz.mod.DARK_ABSORB, 100)
		mob:setLocalVar("DarkTimer", BattleTime + 45)
	    mob:setLocalVar("Mode", 1)
	end

    if BattleTime >= DarkTimer and Mode == 1 then
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        local RNG = math.random(1, 6)
        if RNG == 1 then
            mob:castSpell(175)
        elseif RNG == 2 then
            mob:castSpell(180)
        elseif RNG == 3 then
            mob:castSpell(185)
        elseif RNG == 4 then
            mob:castSpell(190)
        elseif RNG == 5 then
            mob:castSpell(195)
        elseif RNG == 6 then
            mob:castSpell(200)
        end
        mob:addMod(tpz.mod.DARK_ABSORB, 100)
        mob:delMod(tpz.mod.LIGHT_ABSORB, 100)
		mob:setLocalVar("LightTimer", BattleTime + 45)
	    mob:setLocalVar("Mode", 0)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
end