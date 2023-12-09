-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Verrottendes Fleisch (Doomed NM)
-- ID: 17081106
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    -- Takes 75% reduced damage from all damage types except slashing, which it takes 175% from.
    mob:setMod(tpz.mod.UDMGBREATH, -75)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMod(tpz.mod.UDMGRANGE, -75)
    mob:setMod(tpz.mod.HTHRES, 250)
    mob:setMod(tpz.mod.SLASHRES, 1750)
    mob:setMod(tpz.mod.PIERCERES, 250)
    mob:setMod(tpz.mod.RANGEDRES, 250)
    mob:setMod(tpz.mod.IMPACTRES, 250)
    mob:addImmunity(tpz.immunity.PARALYZE)
    mob:setLocalVar("prisonUses", 0)
end

function onMobEngaged(mob, target)
    -- Reset var back incase of wipe
    mob:setLocalVar("prisonUses", 0)
end

function onMobFight(mob, target)
    local prisonUses = mob:getLocalVar("prisonUses")
    local hpp = mob:getHPP()
    local tp = mob:getTP()
    local enmityList = mob:getEnmityList()
    local prisonTarget = nil

    for _, enmity in ipairs(enmityList) do
        if enmityList and #enmityList > 0 then
            local randomTarget = enmityList[math.random(1,#enmityList)];
            entityId = randomTarget.entity:getID();
            if (entityId > 10000) then -- ID is a mob(pet) then
                prisonTarget = GetMobByID(entityId)
            else
                prisonTarget = GetPlayerByID(entityId)
            end
            if mob:getCurrentAction() ~= tpz.action.MOBABILITY_START and mob:getCurrentAction() ~= tpz.action.MOBABILITY_USING and
                mob:actionQueueEmpty() and (tp < 1000) then
                if (hpp <= 69) and (prisonUses == 0) then
                    mob:setLocalVar("prisonUses", 1)
                    ForceDrawIn(mob, prisonTarget)
                    prisonTarget:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
                    mob:useMobAbility(486, prisonTarget) -- Whip Tongue
                elseif (hpp <= 39) and (prisonUses == 1) then
                    mob:setLocalVar("prisonUses", 2)
                    ForceDrawIn(mob, prisonTarget)
                    prisonTarget:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
                    mob:useMobAbility(486, prisonTarget) -- Whip Tongue
                elseif (hpp <= 19) and (prisonUses == 2) then
                    mob:setLocalVar("prisonUses", 3)
                    ForceDrawIn(mob, prisonTarget)
                    prisonTarget:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
                    mob:useMobAbility(486, prisonTarget) -- Whip Tongue
                end
            end
        end
    end

    PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems terrified of sharp weapons...", 0xD, none, 45)
end

function onMobWeaponSkillPrepare(mob, target)
    -- Undead Mold, Abyss Blast and Infernal Pestilence
    local tpMoves = {490, 492, 1338}
    return tpMoves[math.random(#tpMoves)]
end

function onMobWeaponSkill(target, mob, skill)
    -- Place a 30 second duration terror effect on any targets hit by Whip Tongue
    if skill:getID() == 486 then
        target:addStatusEffect(tpz.effect.TERROR, 1, 0, 30)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    -- Remove gradual petrification off players
    for i, v in pairs(chars) do
        v:delStatusEffectSilent(tpz.effect.TERROR)
    end

    if isKiller or noKiller then
        -- If final boss, spawn next boss in line
        if salvageUtil.TrySpawnChariotBoss(mob, player, 17081107) then
        else
            -- Increase progress counter, at 4 turn teleporter back on
            instance:setProgress(instance:getProgress() +1)
        end
    end
end

function onMobDespawn(mob)
end

