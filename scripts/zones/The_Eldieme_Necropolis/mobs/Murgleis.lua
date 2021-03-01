------------------------------
-- Area: The Eldieme Necropolis
--   Murgleis
--  !additem 16547 
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:AnimationSub(3)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 90 and hitTrigger == 0 then
        printf("Magic");
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:addMod(tpz.mod.ATT, -400)
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 0)
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 446)
        mob:addMod(tpz.mod.MATT, 30)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 80 and hitTrigger == 1 then
        printf("Phys");
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 13)
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 445)
        mob:addMod(tpz.mod.MATT, -30)
        mob:addMod(tpz.mod.ATT, 400)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
        mob:setLocalVar("TriggerHit", 2)
    end
    if mob:getHPP() <= 70 and hitTrigger == 2 then
        printf("Regenning");
        mob:setMod(tpz.mod.REGEN, 300)
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 200, 0, 3600)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:setLocalVar("TriggerHit", 3)
    end
    if mob:getHPP() <= 60 and hitTrigger == 3 then
        printf("Magic");
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:addMod(tpz.mod.ATT, -400)
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 0)
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 446)
        mob:addMod(tpz.mod.MATT, 30)
        mob:setLocalVar("TriggerHit", 4)
    end
    if mob:getHPP() <= 50 and hitTrigger == 4 then
        printf("Regenning");
        mob:setMod(tpz.mod.REGEN, 300)
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 200, 0, 3600)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:setLocalVar("TriggerHit", 5)
    end
    if mob:getHPP() <= 40 and hitTrigger == 5 then
        printf("Phys");
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 13)
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 445)
        mob:addMod(tpz.mod.MATT, -30)
        mob:addMod(tpz.mod.ATT, 400)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
        mob:setLocalVar("TriggerHit", 6)
    end
    if mob:getHPP() <= 30 and hitTrigger == 6 then
        printf("Magic");
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:addMod(tpz.mod.ATT, -400)
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 0)
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 446)
        mob:addMod(tpz.mod.MATT, 30)
        mob:setLocalVar("TriggerHit", 7)
    end
    if mob:getHPP() <= 20 and hitTrigger == 7 then
        printf("Regenning");
        mob:setMod(tpz.mod.REGEN, 300)
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 200, 0, 3600)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:setLocalVar("TriggerHit", 8)
    end
    if mob:getHPP() <= 10 and hitTrigger == 8 then
        printf("Phys");
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 13)
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 445)
        mob:addMod(tpz.mod.MATT, -30)
        mob:addMod(tpz.mod.ATT, 400)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
        mob:setLocalVar("TriggerHit", 0)
    end
end

function onMonsterMagicPrepare(mob, target)
    local rnd = math.random()

    if rnd < 0.5 then
        return 227 -- Poisonga III
    elseif rnd < 0.7 then
        return 360 -- Dispelga
    elseif rnd < 0.9 then
        return 511 -- Haste II
    else
        return 493 -- Temper
    end
end

function onMagicHit(caster, target, spell)
    local DAY = target:getLocalVar("RNGelement")
    local ELEM = spell:getElement()
    if DAY == 0 then
         target:setLocalVar("RNGelement", math.random(1,8))
    elseif (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) then
        target:delStatusEffect(34) -- Blaze spikes
        target:setMod(tpz.mod.REGEN, 0)
        target:setMobMod(tpz.mobMod.NO_MOVE, 0)
        target:SetAutoAttackEnabled(true)
        target:SetMobAbilityEnabled(true)
        printf("Delete Buffs, Reset Element");
        target:setLocalVar("RNGelement", math.random(1,8))
    end
    return 1
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Murgleis")
end


