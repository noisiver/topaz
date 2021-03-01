------------------------------
-- Area: The Eldieme Necropolis
--   Kogarasumaru
--   !additem 18431 
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:AnimationSub(3)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.MEIKYO_SHISUI,
                hpp = 25,
                begCode = function(mob)
                mob:messageText(mob, ID.text.HOW_CAN_YOU_EXPECT_TO_KILL_ME)
               -- mob:PrintToArea("My power is too great for you!",0,"Murgleis")
               end,
               endCode = function(mob)
               mob:messageText(mob, ID.text.WHEN_YOU_CANT_EVEN_HIT_ME)
               end,
            },
        },
    })
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local STANCEdps = mob:getLocalVar("STANCEdps")
    local STANCEtank = mob:getLocalVar("STANCEtank")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(10, 15))
    elseif battletime >= twohourTime and STANCEtank == 0 then
        printf("DPS Stance");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 2500)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
        mob:setMod(tpz.mod.ATT, 550)
        mob:setMod(tpz.mod.UDMGPHYS, 75)
        mob:setMod(tpz.mod.UDMGMAGIC, 75)
        mob:setLocalVar("STANCEdps", battletime + math.random(60, 90))
        mob:setLocalVar("STANCEtank", 1)
    end

    if battletime >= STANCEdps and STANCEtank == 1 then
        printf("Tank Stance");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:setMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) - 2500)
        mob:setMod(tpz.mod.UDMGPHYS, -75)
        mob:setMod(tpz.mod.UDMGMAGIC, -75)
        mob:setLocalVar("twohourTime", battletime + math.random(60, 90))
        mob:setLocalVar("STANCEdps", 0)
        mob:setLocalVar("STANCEtank", 0)
    end
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Kogarasumaru")
end


