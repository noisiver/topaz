-----------------------------------
-- Area: Xarcabard
--   NM: Biast
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(tpz.mod.UFASTCAST, 50)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 20) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:addMod(tpz.mod.MDEF, 24) 
    mob:setMod(tpz.mod.SDT_WATER, 5)
    mob:setMod(tpz.mod.SDT_LIGHT, 85)
    mob:setMod(tpz.mod.SDT_EARTH, 85)
    mob:setMod(tpz.mod.SDT_WIND, 85)
    mob:setMod(tpz.mod.SDT_THUNDER, 150)
    mob:setMod(tpz.mod.SDT_DARK, 85)
    mob:setMod(tpz.mod.SDT_FIRE, 5)
    mob:setMod(tpz.mod.SDT_ICE, 85)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TERROR, {chance = 20, duration = 3})
end

function onMobWeaponSkill(target, mob, skill)
    local buffone = tpz.effect.ICE_SPIKES

    if skill:getID() == 927 then
        mob:addStatusEffect(tpz.effect.ICE_SPIKES, 20, 0, 30)
        mob:getStatusEffect(buffone):unsetFlag(tpz.effectFlag.DISPELABLE)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    SetServerVariable("[POP]Biast", os.time() + 75600) -- 21 hour
    DisallowRespawn(mob:getID()-1, false)
    GetMobByID(mob:getID()-1):setRespawnTime(GetMobRespawnTime(mob:getID()-1))
end
