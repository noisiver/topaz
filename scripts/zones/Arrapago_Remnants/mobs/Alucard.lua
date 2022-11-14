-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Alucard(Triple Bat NM)
-- ID: 17081058
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    -- Takes 75% reduced damage from all damage types except ranged, which it takes 100% from.
    mob:setDamage(50)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
    mob:setMod(tpz.mod.STORETP, 100)
    mob:setMod(tpz.mod.UDMGPHYS, -75)
    mob:setMod(tpz.mod.UDMGBREATH, -75)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMod(tpz.mod.UDMGRANGE, -75)
    mob:setMod(tpz.mod.RANGEDRES, 1750)
    mob:addImmunity(tpz.immunity.PARALYZE)
    mob:addImmunity(tpz.immunity.SLOW)
    mob:addImmunity(tpz.immunity.ELEGY)
    mob:setUnkillable(true)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setLocalVar("enageTPMoves", 0)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
    -- Uses Slip Stream and Sonic Boom when engaged
    if mob:checkDistance(target) <= 7 and mob:getLocalVar("enageTPMoves") == 0 then
        mob:useMobAbility(1157) 
        mob:useMobAbility(1666)
        mob:setLocalVar("enageTPMoves", 1)
    end
    -- Warps away when below 10% HP
    if mob:getHPP() < 10 then
        mob:castSpell(261, mob)
    end
    mob:addListener("MAGIC_STATE_EXIT", "ALUCARD_MAGIC_STATE_EXIT", function(mob, spell)
        if spell:getID() == 261 then -- Warp
            DespawnMob(mob:getID(instance), instance)
            instance:setProgress(5)
            PeriodicMessage(mob, mob:getTarget(), "You hear a mechanical-like whirring noise.", 0xD, none, 90)
        end
    end)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = math.random(30, 40)})
end

function onMobWeaponSkillPrepare(mob, target)
    -- Only uses Sonic Boom and Slip Stream
    local rng = math.random()
    if rng < 0.5 then
        return 1157
    else
        return 393
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end