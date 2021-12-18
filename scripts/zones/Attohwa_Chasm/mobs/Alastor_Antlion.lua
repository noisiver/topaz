-----------------------------------
-- Area: Attohwa Chasm
--   NM: Alastor Antlion
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush_noaggro")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(140)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.GA_CHANCE, 50)
    mob:setMobMod(tpz.mobMod.MUG_GIL, 10000)
    mob:addMod(tpz.mod.FASTCAST, 10)
    mob:setMod(tpz.mod.SUSC_TO_WS_STUN,1)
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    --local qm = GetNPCByID(16806296)

    --qm:queue(900000, function(qm)
        --qm:setStatus(0)
    --end)
end
