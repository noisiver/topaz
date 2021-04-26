-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Morion Worm
-----------------------------------
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 1800)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 20)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.UFASTCAST, 50) 
    mob:addStatusEffect(tpz.effect.REGEN, 50, 3, 0)
    mob:addMod(tpz.mod.SPELLINTERRUPT, 50)
    mob:addMod(tpz.mod.SLEEPRESTRAIT, 75)
	mob:addMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobDeath(mob, player, isKiller)
    GetNPCByID(ID.npc.PHANTOM_WORM_QM):updateNPCHideTime(900)
end
