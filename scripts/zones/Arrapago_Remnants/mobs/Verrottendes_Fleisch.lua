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
    -- Takes 75% reduced damage from all damage types except slashing, which it takes 100% from.
    mob:setMod(tpz.mod.UDMGPHYS, -75)
    mob:setMod(tpz.mod.UDMGBREATH, -75)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMod(tpz.mod.UDMGRANGE, -75)
    mob:setMod(tpz.mod.HTHRES, 1000)
    mob:setMod(tpz.mod.SLASHRES, 1750)
    mob:setMod(tpz.mod.PIERCERES, 1000)
    mob:setMod(tpz.mod.RANGEDRES, 1000)
    mob:setMod(tpz.mod.IMPACTRES, 1000)
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
    local enmityList = mob:getEnmityList()
    local prisonTarget = nil

    if enmityList and #enmityList > 0 then
        if (hpp <= 69) and (prisonUses == 0) then
            prisonTarget = math.random(#enmityList)
            mob:setLocalVar("prisonUses", 1)
            ForceDrawIn(mob, prisonTarget)
            target:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
            mob:useMobAbility(486, GetPlayerByID(prisonTarget)) -- Whip Tongue
        elseif (hpp <= 39) and (prisonUses == 1) then
            prisonTarget = math.random(#enmityList)
            mob:setLocalVar("prisonUses", 2)
            ForceDrawIn(mob, prisonTarget)
            target:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
            mob:useMobAbility(486, GetPlayerByID(prisonTarget)) -- Whip Tongue
        elseif (hpp <= 19) and (prisonUses == 2) then
            prisonTarget = math.random(#enmityList)
            mob:setLocalVar("prisonUses", 3)
            ForceDrawIn(mob, prisonTarget)
            target:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
            mob:useMobAbility(486, GetPlayerByID(prisonTarget)) -- Whip Tongue
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
    -- Undead Mold, Abyss Blast and Infernal Pestilence
    local tpMoves = {490, 492, 1338}
    return tpMoves[math.random(#tpMoves)]
end

function onMobWeaponSkill(target, mob, skill)
    -- Place a 60 second duration terror effect on any targets hit by Whip Tongue
    if skill:getID() == 486 then
        target:addStatusEffect(tpz.effect.TERROR, 1, 0, 180)
    end
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()

    if isKiller or noKiller then
        -- Increase progress counter, at 4 turn teleporter back on
        instance:setProgress(instance:getProgress() +1) 
    end
end

function onMobDespawn(mob)
end

