------------------------------
-- Area: The Eldieme Necropolis
--   Murgleis
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DEFP, 10)
    mob:setMod(tpz.mod.ATTP, 5)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:addStatusEffect(tpz.effect.PROTECT, 175, 0, 3600)
    mob:addStatusEffect(tpz.effect.SHELL, 25, 0, 3600)
    mob:addStatusEffect(tpz.effect.PHALANX, 30, 0, 180)
    mob:addStatusEffect(tpz.effect.TEMPER, 15, 0, 180)
    mob:addStatusEffect(tpz.effect.HASTE, 30, 0, 180)
    mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 30, 0, 180)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.CHAINSPELL,
                hpp = 25,
                begCode = function(mob)
                  
                 -- mob:messageText(mob, ID.text.HOW_CAN_YOU_EXPECT_TO_KILL_ME)
                 -- mob:PrintToArea("My power is too great for you!",0,"Murgleis")
                end,
                endCode = function(mob)
               --mob:messageText(mob, ID.text.WHEN_YOU_CANT_EVEN_HIT_ME)
                end,
            },
        },
    })
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    if mob:getHPP() <= 50 and hitTrigger == 0 then
        mob:setMod(tpz.mod.UFASTCAST, 50)
        mob:setMobMod(tpz.mod.SPELL_LIST, 446)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 25 and hitTrigger == 1 then
        mob:setMod(tpz.mod.UFASTCAST, 75)
        mob:setMobMod(tpz.mod.SPELL_LIST, 445)
        mob:setLocalVar("TriggerHit", 2)
    end
end

function onMonsterMagicPrepare(mob, target)
    local rnd = math.random()

    if rnd < 0.5 then
        return 176 -- firaga 3
    elseif rnd < 0.7 then
        return 147 -- fire 4
    elseif rnd < 0.9 then
        return 204 -- flare
    else
        return 235 -- burn
    end
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Murgleis")
end


