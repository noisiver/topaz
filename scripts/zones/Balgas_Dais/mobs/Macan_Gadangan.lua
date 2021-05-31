-----------------------------------
-- Area: Balga's Dais
--   NM: Macan Gadangan
--  BCNM: Wild Wild Whiskers
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------

function onMobFight(mob, target)
    if (mob:hasStatusEffect(tpz.effect.SILENCE) == true) then
        mob:setSpellList(1007)
        mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    end
end

function onMonsterMagicPrepare(mob, target)
    target:PrintToPlayer("The Macan Gadangan's whiskers begin to twitch violently.",0,"")
end



function onMobDeath(mob, player, isKiller)
end
