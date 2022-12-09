-----------------------------------
-- Area: Upper Delkfutt's Tower
--   NM: Alkyoneus
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(75)
    mob:setModelId(643) -- Black
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.UDMGPHYS, 100)
    mob:setMod(tpz.mod.UDMGMAGIC, 100)
    mob:setMod(tpz.mod.UDMGRANGE, 100)
    mob:setMod(tpz.mod.SDT_WATER, 100)
    mob:setMod(tpz.mod.SDT_LIGHT, 100)
    mob:setMod(tpz.mod.SDT_EARTH, 130)
    mob:setMod(tpz.mod.SDT_WIND, 130)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_DARK, 100)
    mob:setMod(tpz.mod.SDT_FIRE, 100)
    mob:setMod(tpz.mod.SDT_ICE, 100)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 126)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobEngaged(mob, target)
    -- Despawn all Gigas on the Tweltch Floor and disable them respawning
    for v = 17424452, 17424478, 1 do
        DespawnMob(v)
        DisallowRespawn(v, true)
    end
    for v = 17424483, 17424508, 1 do
        DespawnMob(v)
        DisallowRespawn(v, true)
    end
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 75 and hitTrigger == 0 then
        mob:setDamage(145)
        mob:useMobAbility(688) -- Mighty Strikes        
        mob:setModelId(640) -- Gaxe
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6003)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        mob:setDamage(145)
        mob:delStatusEffectSilent(tpz.effect.MIGHTY_STRIKES)
        mob:useMobAbility(690)  -- Hundred Fists
        mob:setModelId(642) -- H2H
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6004)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 then
        mob:setDamage(145)
        mob:useMobAbility(739) -- EES
        mob:delStatusEffectSilent(tpz.effect.MIGHTY_STRIKES)
        mob:delStatusEffectSilent(tpz.effect.HUNDRED_FISTS)
        mob:setModelId(711) --  Ranger
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6005)
        mob:setLocalVar("TriggerHit", 3)
    end
    if mob:getHPP() <= 10 and hitTrigger == 3 then
        tpz.mix.jobSpecial.config(mob, {
            between = 120,
            specials =
            {
                {id = tpz.jsa.MIGHTY_STRIKES, cooldown = 0, hpp = 90},
                {id = tpz.jsa.HUNDRED_FISTS, cooldown = 0, hpp = 90},
                {id = tpz.jsa.EES_GIGA, cooldown = 0, hpp = 90},
            },
        })
        mob:useMobAbility(689) -- Benediction
        mob:setModelId(275) -- WOTG
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6006)
        mob:setLocalVar("TriggerHit", 4)
    end
end

function onMobDeath(mob, player, isKiller)
    -- Allow Gigas on the Tweltch Floor to respawn
    for v = 17424452, 17424478, 1 do
        DisallowRespawn(v, false)
    end
    for v = 17424483, 17424508, 1 do
        DisallowRespawn(v, false)
    end
end
