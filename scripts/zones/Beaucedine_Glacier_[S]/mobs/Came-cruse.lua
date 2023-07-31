------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Came-cruse
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 25)
    mob:addMod(tpz.mod.HUMNAOID_KILLER, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
	mob:setMod(tpz.mod.STUNRESTRAIT, 100)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local BlizzagaTime = mob:getLocalVar("BlizzagaTime")

    if BlizzagaTime == 0 then
        mob:setLocalVar("BlizzagaTime", math.random(15, 20))
    elseif battletime >= BlizzagaTime then
		mob:castSpell(181) -- Blizzaga III
        mob:setLocalVar("BlizzagaTime", battletime + math.random(15,20))
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 536)
end
