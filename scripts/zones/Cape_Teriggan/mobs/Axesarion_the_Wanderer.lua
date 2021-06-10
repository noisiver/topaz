-----------------------------------
-- Area: Cape Teriggan
--   NM: Axesarion the Wanderer
-----------------------------------
local ID = require("scripts/zones/Cape_Teriggan/IDs")
require("scripts/globals/status")

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 50)
    mob:setMod(tpz.mod.DEF, -90) 
    mob:addMod(tpz.mod.ACC, 100) 
    mob:addMod(tpz.mod.EVA, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
    mob:SetMobAbilityEnabled(false)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.DISPEL, {chance = 100})
end

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120)
end

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900)
    end
end
