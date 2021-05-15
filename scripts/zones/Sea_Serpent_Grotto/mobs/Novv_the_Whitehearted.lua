-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Novv the Whitehearted
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(5, 10))
    elseif battletime >= twohourTime and wingsDown == 0 then
        printf("Wings Up");
        mob:castSpell(423) -- Honor March
        mob:useMobAbility(696) -- Soul Voice
        mob:useMobAbility(780) -- Spinning Fin(10s Terror)
        mob:setLocalVar("wingsTime", battletime + 10)
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
end
