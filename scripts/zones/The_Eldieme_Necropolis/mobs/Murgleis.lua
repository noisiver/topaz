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
    mob:addStatusEffect(tpz.effect.PROTECT, 175, 0, 3600)
    mob:addStatusEffect(tpz.effect.SHELL, 25, 0, 3600)
    mob:addStatusEffect(tpz.effect.PHALANX, 30, 0, 180)
    mob:addStatusEffect(tpz.effect.TEMPER, 15, 0, 180)
    mob:addStatusEffect(tpz.effect.HASTE, 30, 0, 180)
  --[[  specials =
    {
        {
            id = tpz.jsa.CHAINSPELL,
            hpp = 25,
             mob:setMobMod(tpz.mobMod.MOBMOD_SPELL_LIST, 446)
             mob:messageText(mob, ID.text.HOW_CAN_YOU_EXPECT_TO_KILL_ME)
          -- mob:PrintToArea("My power is too great for you!",0,"Murgleis")
            end,
             mob:setMobMod(tpz.mobMod.MOBMOD_SPELL_LIST, 445)
             mob:messageText(mob, ID.text.WHEN_YOU_CANT_EVEN_HIT_ME)
            end,
        },
    },--]]
end
function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Murgleis")
end


