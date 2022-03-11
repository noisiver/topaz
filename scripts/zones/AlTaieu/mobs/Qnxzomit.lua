-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Note: Pet for JOL and JOJ
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
    if mob:getID() < ID.mob.JAILER_OF_LOVE then
        local now = os.time()
        local mijin = mob:getLocalVar("mijin")
        if mijin > 1 and now > mijin then
            mob:setLocalVar("mijin", 1)
            mob:useMobAbility(tpz.jsa.MIJIN_GAKURE)
            mob:stun(6000)
        elseif mijin < 1 and mob:getHP() < mob:getMaxHP() then
            mob:setLocalVar("mijin", now + 5)
        end
    end
end

function onMobDeath(mob, player, isKiller)
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
