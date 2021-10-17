-----------------------------------
-- Area: Emperial Paradox
--  Mob: Eald'narche
-- Apocalypse Nigh Final Fight
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.MDEF, 50);
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 100)
    local battletime = mob:getBattleTime()
    local WarpTime = mob:getLocalVar("WarpTime")
    if WarpTime == 0 then
        mob:setLocalVar("WarpTime", math.random(15, 20))
	elseif battletime >= WarpTime then
		mob:useMobAbility(989) -- Warp out
		mob:setLocalVar("WarpTime", battletime + math.random(15, 20))
	end
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobDeath(mob, player, isKiller)
end
