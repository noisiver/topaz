------------------------------
-- Area: The Eldieme Necropolis
--   Kogarasumaru
--   !additem 18431 
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
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
    local STANCEdps = mob:getLocalVar("STANCEdps")
    local STANCEtank = mob:getLocalVar("STANCEtank")
    local DMGtaken = mob:getLocalVar("DMGtaken")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(10, 15))
    elseif battletime >= twohourTime and STANCEtank == 0 then
        printf("DPS Stance");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 2500)
        mob:setMod(tpz.mod.COUNTER, 0)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
        mob:setMod(tpz.mod.ATT, 550)
        mob:setMod(tpz.mod.UDMGPHYS, 75)
        mob:setMod(tpz.mod.UDMGMAGIC, 75)
        mob:setLocalVar("STANCEdps", battletime + math.random(60, 90))
        mob:setLocalVar("STANCEtank", 1)
        mob:addListener("TAKE_DAMAGE", "URAGNITE_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if amount > 1000 and math.random(1,100) <= 50  then
        mob:setLocalVar("DMGtaken", 1)
        end
    end)
    end

    if battletime >= STANCEdps and STANCEtank == 1 or DMGtaken == 1 then
        printf("Tank Stance");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setMod(tpz.mod.COUNTER, 100)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:setMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) - 2500)
        mob:setMod(tpz.mod.UDMGPHYS, -75)
        mob:setMod(tpz.mod.UDMGMAGIC, -75)
        mob:setLocalVar("twohourTime", battletime + math.random(60, 90))
        mob:setLocalVar("STANCEdps", 0)
        mob:setLocalVar("STANCEtank", 0)
        mob:setLocalVar("DMGtaken", 0)
    end
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Kogarasumaru")
end


