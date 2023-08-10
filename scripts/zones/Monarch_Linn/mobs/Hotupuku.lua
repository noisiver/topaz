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
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
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

    if mob:getBattleTime() >= 60 and roll == 0 then
        mob:setLocalVar("Immunity", math.random(1 , 3))
        mob:setLocalVar("roll", 1)
        mob:useMobAbility(624) -- 2 hour "cloud" animation
    end
    if Immunity == 1 then
        mob:setMod(tpz.mod.UDMGPHYS, -100)
    elseif Immunity == 2 then
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGBREATH, -100)
    elseif Immunity == 3 then
        mob:setMod(tpz.mod.UDMGRANGE, -100)
    end

    if mob:getHPP() < 75 and hitTrigger == 0 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:addMod(tpz.mod.DOUBLE_ATTACK, 5)
        mob:addMod(tpz.mod.HASTE_MAGIC, 1000)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() < 50 and hitTrigger == 1 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:addMod(tpz.mod.DOUBLE_ATTACK, 5)
        mob:addMod(tpz.mod.HASTE_MAGIC, 1000)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() < 25 and hitTrigger == 2 then
        mob:addMod(tpz.mod.ACC, 25)
        mob:addMod(tpz.mod.DOUBLE_ATTACK, 10)
        mob:addMod(tpz.mod.HASTE_MAGIC, 1000)
        mob:setLocalVar("TriggerHit", 3)
    end
end

function onMobWeaponSkill(target, mob, skill)
    for v = 382,387,1 do -- TP move ID
        if skill:getID() == 384 then -- Doesn't use scutum three times
            return
        end
        if skill:getID() == v then -- If TP Move is part of for loop then...
            local TPMove = mob:getLocalVar("TPMove")

            TPMove = TPMove +1 -- Count number of times TP move was used
            mob:setLocalVar("TPMove", TPMove)

            if TPMove > 2 then -- Only use up to twice in a row
                mob:setLocalVar("TPMove", 0)
            else
                mob:useMobAbility(v) -- Re-use same TP move
            end
        end
    end
end

function onMagicHit(caster, target, spell)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, {chance = 100, power = math.random(70, 90)})
end


function onMobDeath(mob, player, isKiller, noKiller)
end