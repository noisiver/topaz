-----------------------------------
-- Area: Xarcabard
--   NM: Biast
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins =
{
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobInitialize(mob)
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

function onMobFight(mob, target)
    if (mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES) == true) then
        mob:setMod(tpz.mod.REGAIN, 500)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6010)
    elseif (mob:hasStatusEffect(tpz.effect.MANAFONT) == true) then
        mob:setMod(tpz.mod.UFASTCAST, 50)
    elseif (mob:hasStatusEffect(tpz.effect.INVINCIBLE) == true) then
        mob:setMod(tpz.mod.REGEN, 300)
    else
        mob:setMod(tpz.mod.REGAIN, 0)
        mob:setMod(tpz.mod.UFASTCAST, 0)
        mob:setMod(tpz.mod.REGEN, 0)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6009)
    end

    tpz.mix.jobSpecial.config(mob, {
        between = 120,
        specials =
        {
            {id = tpz.jsa.MIGHTY_STRIKES, cooldown = 0, hpp = 75},
            {id = tpz.jsa.INVINCIBLE, cooldown = 0, hpp = 75},
            {id = tpz.jsa.MANAFONT, cooldown = 0, hpp = 75},
        },
    })
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
