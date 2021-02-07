------------------------------
-- Area: The Eldieme Necropolis
--   Kogarasumaru
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.STORETP, 50)
    mob:setMod(tpz.mod.DEFP, 10) 
    mob:setMod(tpz.mod.ATTP, 5)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.MEIKYO_SHISUI,
                hpp = 25,
                begCode = function(mob)
                mob:setMobMod(tpz.mobMod.SKILL_LIST, 2002)
                mob:messageText(mob, ID.text.HOW_CAN_YOU_EXPECT_TO_KILL_ME)
               -- mob:PrintToArea("My power is too great for you!",0,"Murgleis")
               end,
               endCode = function(mob)
               mob:setMobMod(tpz.mobMod.SKILL_LIST, 2002)
               mob:messageText(mob, ID.text.WHEN_YOU_CANT_EVEN_HIT_ME)
               end,
            },
        },
    })
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    if mob:getHPP() <= 50 and hitTrigger == 0 then
        mob:setMod(tpz.mod.STORETP, 75)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 25 and hitTrigger == 1 then
        mob:setMod(tpz.mod.STORETP, 100)
        mob:setLocalVar("TriggerHit", 2)
    end
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Kogarasumaru")
end


