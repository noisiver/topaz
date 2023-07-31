-----------------------------------
-- Area: Dragon's Aery
--  Mob: Lambton Worm
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(150)
    mob:setMod(tpz.mod.ATT, 475)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 350)
	mob:setMod(tpz.mod.VIT, 50)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.PHYS_ABSORB, 0)
    mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobRoam(mob)
    mob:setMod(tpz.mod.PHYS_ABSORB, 0)
    mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobFight(mob, target)
	local AbsorbTime = mob:getLocalVar("AbsorbTime")
	local BattleTime = mob:getBattleTime()

	if AbsorbTime == 0 then
		mob:setLocalVar("AbsorbTime", BattleTime + math.random(105, 120))
	elseif BattleTime >= AbsorbTime then
        mob:setMod(tpz.mod.PHYS_ABSORB, 2000)
        mob:setMod(tpz.mod.MAGIC_ABSORB, 2000)
        mob:useMobAbility(2192) -- Doomvoid
        mob:setLocalVar("AbsorbTime", BattleTime + math.random(105, 120))
        mob:timer(5000, function(mob) -- Absorbs all damage for 5 seconds, then draws in
            for _,player in ipairs(mob:getEnmityList()) do
                mob:drawIn(target)
            end
            mob:setMod(tpz.mod.PHYS_ABSORB, 0)
            mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
        end)
	end
end

function onMobDisengage(mob)
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.LAMBTON_WORM_DESEGMENTER)
end

