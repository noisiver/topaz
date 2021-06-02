-----------------------------------
-- Area: Balga's Dais
--   NM: Macan Gadangan
--  BCNM: Wild Wild Whiskers
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobSpawn(mob)
	 mob:setMod(tpz.mod.TRIPLE_ATTACK, 5)
     mob:addMod(tpz.mod.DEFP, 40) 
     mob:addMod(tpz.mod.ATTP, 40)
     mob:addMod(tpz.mod.ACC, 40) 
     mob:setMod(tpz.mod.UFASTCAST, -50)
     mob:setMobMod(tpz.mobMod.MAGIC_COOL, 30)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobFight(mob, target)
    if (mob:hasStatusEffect(tpz.effect.SILENCE) == true) then
        mob:setSpellList(448)
        mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    end
end

function onMonsterMagicPrepare(mob, target)
    mob:PrintToPlayer("The Macan Gadangan's whiskers begin to twitch violently.",0,"")
end



function onMobDeath(mob, player, isKiller)
end
