------------------------------
-- Area: Outer Horutoto Ruins
--   Goblin Tomb Raider
--   !additem 479 
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")
    local Guard = GetMobByID(17571922)
    local GuardTwo = GetMobByID(17571924)
    local GuardThree = GetMobByID(17571926)
    local GuardFour = GetMobByID(17571928)
    local GuardFive = GetMobByID(17572165)
    local GuardSix = GetMobByID(17572169)
    local GuardSeven = GetMobByID(17572171)
    local GuardEight = GetMobByID(17572174)

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(60, 90))
    elseif battletime >= twohourTime and wingsDown == 0 then
        printf("Wings Up");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        target:PrintToPlayer("You want what's in my bag? Fine, take it!",0,"Goblin")
        Guard:spawn()
        GuardTwo:spawn()
        GuardThree:spawn()
        GuardFour:spawn()
        GuardFive:spawn()
        GuardSix:spawn()
        GuardSeven:spawn()
        GuardEight:spawn()
        Guard:updateEnmity(target)
        GuardTwo:updateEnmity(target)
        GuardThree:updateEnmity(target)
        GuardFour:updateEnmity(target)
        GuardFive:updateEnmity(target)
        GuardSix:updateEnmity(target)
        GuardSeven:updateEnmity(target)
        GuardEight:updateEnmity(target)
        mob:setLocalVar("wingsTime", battletime + 30)
        mob:setLocalVar("wingsDown", 1)
    end

    if battletime >= wingsTime and wingsDown == 1 then
        printf("Wings Down");
        mob:setLocalVar("twohourTime", battletime + math.random(60, 90))
        mob:setLocalVar("wingsTime", 0)
        mob:setLocalVar("wingsDown", 0)
    end
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("I..guess..you...deserve...it...m...m..more...",0,"Goblin")
    DespawnMob(Guard)
    DespawnMob(GuardTwo)
    DespawnMob(GuardThree)
    DespawnMob(GuardFour)
    DespawnMob(GuardFive)
    DespawnMob(GuardSix)
    DespawnMob(GuardSeven)
    DespawnMob(GuardEight)
end
