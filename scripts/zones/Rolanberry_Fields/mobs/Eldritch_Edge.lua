------------------------------
-- Area: Rolanberry Fields
--   NM: Eldritch Edge
------------------------------
require("scripts/globals/hunts")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(10, 15))
    elseif battletime >= twohourTime and wingsDown == 0 then
        printf("Wings Up");
        mob:useMobAbility(513) -- Smite of Rage
        mob:setLocalVar("wingsTime", battletime + 5)
        mob:setLocalVar("wingsDown", 1)
    end

    if battletime >= wingsTime and wingsDown == 1 then
        printf("Wings Down");
        mob:setLocalVar("twohourTime", battletime + math.random(5, 10))
        mob:setLocalVar("wingsTime", 0)
        mob:setLocalVar("wingsDown", 0)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 218)
end
