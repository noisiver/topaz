-----------------------------------
-- Area: Ruhotz Silvermines
--  Mob: Lambton Worm
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(150)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 395) 
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobRoam(mob)
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobFight(mob, target)
	local AbsorbTime = mob:getLocalVar("AbsorbTime")
	local BattleTime = mob:getBattleTime()

	if AbsorbTime == 0 then
		mob:setLocalVar("AbsorbTime", BattleTime + math.random(75, 90))
	elseif BattleTime >= AbsorbTime then
        mob:addMod(tpz.mod.PHYS_ABSORB, 2000)
        mob:addMod(tpz.mod.MAGIC_ABSORB, 2000)
        mob:useMobAbility(2192) -- Doomvoid
        mob:timer(5000, function(mob) -- Absorbs all damage for 5 seconds, then draws in
            for _,player in ipairs(mob:getEnmityList()) do
                mob:drawIn(player)
            end
        end)
		mob:setLocalVar("AbsorbTime", BattleTime + math.random(75, 90))
	end
end

function onMobDisengage(mob)
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.LAMBTON_WORM_DESEGMENTER)
end
