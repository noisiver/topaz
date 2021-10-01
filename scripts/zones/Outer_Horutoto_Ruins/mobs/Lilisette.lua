------------------------------
-- Area: Outer Horutoto Ruins
--   Lilisette
--   !additem 476 
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local Dance = mob:getLocalVar("Dance")
    local DanceChangeTime = mob:getLocalVar("DanceChangeTime")

    if Dance == 0 then
        printf("Setting Dance");
        mob:setLocalVar("DanceChangeTime", 3)
        mob:setLocalVar("Dance", math.random(1, 2))
    elseif battletime >= DanceChangeTime and Dance == 1 then
        printf("Saber Dance");
        target:PrintToPlayer("Now I'm really hyped!",0,"Lilisette")
        mob:useMobAbility(221) -- Saber Dance
		mob:useMobAbility(25) -- evisceration
		mob:useMobAbility(190) -- Reverse Flourish
		mob:useMobAbility(29)  -- pyrrhic_kleos
        mob:setMod(tpz.mod.REGAIN, 0)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6038)
        mob:setLocalVar("DanceChangeTime", battletime + 60)
        mob:setLocalVar("Dance", math.random(1, 2))
    end

    if battletime >= DanceChangeTime and Dance == 2 then
        printf("Fan Dance");
        target:PrintToPlayer("The funs just getting started!",0,"Lilisette")
        mob:useMobAbility(222) -- Fan Dance
        mob:setMod(tpz.mod.REGAIN, 250)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6039)
        mob:setLocalVar("DanceChangeTime", battletime + 60)
        mob:setLocalVar("Dance", math.random(1, 2))
    end
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Let's dance again some other time!",0,"Lilisette")
end


