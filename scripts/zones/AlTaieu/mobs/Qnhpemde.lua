-----------------------------------
-- Area: Al'Taieu
--  Mob: Qn'hpemde
-- Jailor of Love Pet version
-----------------------------------
mixins = {require("scripts/mixins/families/hpemde")}
local ID = require("scripts/zones/AlTaieu/IDs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:AnimationSub(6)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE)
    local HPEMDES = JoL:getLocalVar("JoL_Qn_hpemde_Killed")
    JoL:setMobMod(tpz.mobMod.NO_MOVE, 0)
    JoL:SetAutoAttackEnabled(true)
    JoL:SetMobAbilityEnabled(true)
    JoL:SetMagicCastingEnabled(true)
    JoL:setLocalVar("JoL_Qn_hpemde_Killed", HPEMDES+1)
end
