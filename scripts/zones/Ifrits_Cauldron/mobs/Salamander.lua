-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Salamander
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
mixins =
{
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobSpawn(mob)
    local bufftwo = tpz.effect.BLAZE_SPIKES

    mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 50, 0, 3600)
    mob:getStatusEffect(bufftwo):unsetFlag(tpz.effectFlag.DISPELABLE)
    mob:setDamage(125)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    DespawnMob(mob:getID(), 180)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MEIKYO_SHISUI, cooldown = 60, hpp = 75},
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
    local Red = GetMobByID(mob:getID() +1)
    Red:delStatusEffectSilent(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    Red:delStatusEffectSilent(tpz.effect.ARROW_SHIELD, 0, 1, 0, 0)
    Red:delStatusEffectSilent(tpz.effect.MAGIC_SHIELD, 0, 1, 0, 0)
end
