-----------------------------------
-- Area: Empyreal Paradox
--  MOB: Prishe
-- Chains of Promathia 8-4 BCNM Fight
-- Notes can cast Benediction and 100 fists in 2nd form
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.REGAIN, 30)
end

function onMobRoam(mob)
    local promathia = ID.mob.PROMATHIA_OFFSET
    local wait = mob:getLocalVar("wait")
    local ready = mob:getLocalVar("ready")

    printf("Prishe wait: %d", wait)
    if ready == 0 and wait > 240 then
        if GetMobByID(promathia):getCurrentAction() ~= tpz.act.NONE then
            mob:entityAnimationPacket("prov")
            mob:messageText(mob, ID.text.PRISHE_TEXT)
        else
            mob:entityAnimationPacket("prov")
            mob:messageText(mob, ID.text.PRISHE_TEXT + 1)
            promathia = promathia + 1
        end
        mob:setLocalVar("ready", promathia)
        mob:setLocalVar("wait", 0)
    elseif ready > 0 then
        mob:addEnmity(GetMobByID(ready), 0, 1)
    else
        mob:setLocalVar("wait", wait + 3)
    end
end

function onMobEngaged(mob, target)
    mob:entityAnimationPacket("prov")
    mob:showText(mob, ID.text.PRISHE_TEXT + 1)
    mob:setLocalVar("ready", mob:getID())
    mob:useMobAbility(1488)
    mob:useMobAbility(1487)
    mob:addStatusEffectEx(tpz.effect.SILENCE, 0, 0, 0, 5)
end

function onMobFight(mob, target)
    if mob:getHPP() < 70 and mob:getLocalVar("HF") == 0 then
        mob:useMobAbility(tpz.jsa.HUNDRED_FISTS_PRISHE)
        mob:messageText(mob, ID.text.PRISHE_TEXT + 6)
        mob:setLocalVar("HF", 1)
    elseif mob:getHPP() < 30 and mob:getLocalVar("Bene") == 0 then
        mob:useMobAbility(tpz.jsa.BENEDICTION_PRISHE)
        mob:messageText(mob, ID.text.PRISHE_TEXT + 7)
        mob:setLocalVar("Bene", 1)
    end
end

function onMagicHit(caster, target, spell)
    local id = spell:getID()
    if target:isDead() and caster:isPC() and (id == 12 or id == 13 or id == 140) then
        target:entityAnimationPacket("sp00")
        target:setAnimation(0)
        target:messageText(target, ID.text.PRISHE_TEXT + 3)
        target:addHP(target:getMaxHP())
        target:addMP(target:getMaxMP())
        target:setLocalVar("dead", 0)
    end
end

function onMobDeath(mob, player, isKiller, firstCall)
    if mob:getLocalVar("dead") == 0 then
        mob:setLocalVar("dead", 1)
        mob:messageText(mob, ID.text.PRISHE_TEXT + 2)
    end
end
