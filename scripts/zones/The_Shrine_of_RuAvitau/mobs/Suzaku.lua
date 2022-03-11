-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Suzaku (Pet version)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
--------------------------------------------------


function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMod(tpz.mod.REGAIN, 50)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE)
end

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    rnd = math.random()

    if (rnd < 0.5) then
        return 176 -- firaga 3
    elseif (rnd < 0.7) then
        return 147 -- fire 4
    elseif (rnd < 0.9) then
        return 204 -- flare
    else
        return 235 -- burn
    end

end

function onMobDespawn(mob)
    local Kirin = GetMobByID(ID.mob.KIRIN)
    Kirin:setMobMod(tpz.mobMod.NO_MOVE, 0)
    Kirin:setMod(tpz.mod.UDMGPHYS, 0)
    Kirin:setMod(tpz.mod.UDMGRANGE, 0)
    Kirin:setMod(tpz.mod.UDMGMAGIC, 0)
    Kirin:setMod(tpz.mod.UDMGBREATH, 0)
    Kirin:SetAutoAttackEnabled(true)
    Kirin:SetMobAbilityEnabled(true)
    Kirin:SetMagicCastingEnabled(true)
    Kirin:setUnkillable(false)
end

function onMobDeath(mob, player, isKiller)
end