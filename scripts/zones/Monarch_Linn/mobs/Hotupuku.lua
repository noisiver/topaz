-----------------------------------
-- Area: Monarch Linn
--  Mob: Hotupuku
-- Bugard in the Clouds
-- Key item ID: 674
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        between = 60,
        chance = 100,
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, hpp = 75},
            {id = tpz.jsa.INVINCIBLE, hpp = 50},
            {id = tpz.jsa.MIGHTY_STRIKES, hpp = 25},
        },
    })
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobEngaged(mob, target)
end


function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local Immunity = mob:getLocalVar("Immunity")
    local hitTrigger = mob:getLocalVar("TriggerHit")
    local roll = mob:getLocalVar("roll")

    if mob:getBattleTime() >= 60 and roll == 0  then
        mob:setLocalVar("Immunity", math.random(1 , 2))
        mob:setLocalVar("roll", 1)
        mob:useMobAbility(624) -- 2 hour "cloud" animation
    end
    if Immunity == 1 then
        mob:setMod(tpz.mod.UDMGPHYS, -100)
    elseif Immunity == 2 then
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
    end

    if mob:getHPP() <= 75 and hitTrigger == 0 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 1500)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 2500)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 4000)
        mob:setLocalVar("TriggerHit", 3)
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 382 then
        local tailroll = mob:getLocalVar("tailroll")

        tailroll = tailroll +1
        mob:setLocalVar("tailroll", tailroll)

        if tailroll > 2 then
            mob:setLocalVar("tailroll", 0)
        else
            mob:useMobAbility(382)
        end
    end
    if skill:getID() == 383 then
        local tusk = mob:getLocalVar("tusk")

        tusk = tusk +1  
        mob:setLocalVar("tusk", tusk)

        if tusk > 2 then
            mob:setLocalVar("tusk", 0)
        else
            mob:useMobAbility(383)
        end
    end
    if skill:getID() == 384 then
        local scutum = mob:getLocalVar("scutum")

        scutum = scutum +1
        mob:setLocalVar("scutum", scutum)

        if scutum > 2 then
            mob:setLocalVar("scutum", 0)
        else
            mob:useMobAbility(384)
        end
    end
    if skill:getID() == 385 then
        local bonecrunch = mob:getLocalVar("bonecrunch")

        bonecrunch = bonecrunch +1
        mob:setLocalVar("bonecrunch", bonecrunch)

        if bonecrunch > 2 then
            mob:setLocalVar("bonecrunch", 0)
        else
            mob:useMobAbility(385)
        end
    end
    if skill:getID() == 386 then
        local awfuleye = mob:getLocalVar("awfuleye")

        awfuleye = awfuleye +1
        mob:setLocalVar("awfuleye", awfuleye)

        if awfuleye > 2 then
            mob:setLocalVar("awfuleye", 0)
        else
            mob:useMobAbility(386)
        end
    end
    if skill:getID() == 387 then
        local heavybellow = mob:getLocalVar("heavybellow")

        heavybellow = heavybellow +1
        mob:setLocalVar("heavybellow", heavybellow)

        if heavybellow > 2 then
            mob:setLocalVar("heavybellow", 0)
        else
            mob:useMobAbility(387)
        end
    end
end

function onMagicHit(caster, target, spell)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, {chance = 100, power = math.random(70, 90)})
end


