-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Note: Pet for Jailer of Love
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------

function onMobInitialize(mob)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
    mob:setMod(tpz.mod.SUSC_TO_WS_STUN,1)
end

function onMobEngage(mob, target)
    utils.linkAlliance(mob, target)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    if (mob:getID() > ID.mob.JAILER_OF_LOVE) then
        local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE)
        local xzomitsKilled = JoL:getLocalVar("JoL_Qn_xzomit_Killed")
        JoL:setMobMod(tpz.mobMod.NO_MOVE, 0)
        JoL:SetAutoAttackEnabled(true)
        JoL:SetMobAbilityEnabled(true)
        JoL:SetMagicCastingEnabled(true)
        JoL:setLocalVar("JoL_Qn_xzomit_Killed", xzomitsKilled + 1)
    end
end
