-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Medusa
-- ID: 17081211
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    -- Never melees, only shoots, and low bow delay.
    -- 75% DT from all damage except from the front
    mob:SetAutoAttackEnabled(false)
    mob:setMobMod(tpz.mobMod.SPECIAL_COOL, 6)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    SetPositionalDT(mob)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("msgTimer", os.time() + 45)
    mob:setLocalVar("eesUses", 0)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()
    local enmityList = mob:getEnmityList()
    local eesTarget = nil
    local eesUses = mob:getLocalVar("eesUses")

    -- Gradually petrifies anyone facing her, facing away removes the gruadl petrificaiton effect
    if target:isFacing(mob) and not target:hasStatusEffect(tpz.effect.GRADUAL_PETRIFICATION) and not target:hasStatusEffect(tpz.effect.PETRIFICATION) then
        target:addStatusEffect(tpz.effect.GRADUAL_PETRIFICATION, 10, 3, 15)
    elseif not target:isFacing(mob) and target:hasStatusEffect(tpz.effect.GRADUAL_PETRIFICATION) then
        target:delStatusEffectSilent(tpz.effect.GRADUAL_PETRIFICATION)
    end

    -- Uses EES on a random target at 88/77/66/55/44/33/22/11% HP
    if (hp < 99) then
        if enmityList and #enmityList > 0 then
            if CheckForEES(mob) then
                mob:setLocalVar("eesUses", eesUses +1)
                eesTarget = math.random(#enmityList)
                mob:useMobAbility(1932, GetPlayerByID(eesTarget)) -- Eagle Eye Shot
            end
        end
    end


    mob:addListener("SPELL_DMG_TAKEN", "MEDUSA_SPELL_DMG_TAKEN", function(mob, caster, spell, amount, msg)
        local element = spell:getElement()

        if (element == tpz.magic.ele.EARTH) and (amount >= 1000) and (msg == tpz.msg.basic.MAGIC_BURST_BLACK) then
            BreakMob(mob, caster, 1, 60, 2)
        end
    end)

    if not mob:hasStatusEffect(tpz.effect.TERROR) then
        PeriodicMessage(mob, target, "The " .. MobName(mob) .. " seems vulnerable to earth magic...", 0xD, none, 30)
        addSpikes(mob)
    end
    SetPositionalDT(mob)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    -- Remove gradual petrification off players
    for i, v in pairs(chars) do
        v:delStatusEffectSilent(tpz.effect.GRADUAL_PETRIFICATION)
        v:delStatusEffectSilent(tpz.effect.PETRIFICATION)
    end

    if isKiller or noKiller then
        -- Nearby door opens
        instance:setProgress(2)
        salvageUtil.teleportGroup(player, math.random(-346, -335), 0, -86, 0, true, false, false)
        salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
    end
end

function onMobDespawn(mob)
end

function CheckForEES(mob)
    local eesUses = mob:getLocalVar("eesUses")
    local hp = mob:getHPP()
    local thresholds = { 89, 79, 69, 59, 49, 39, 29, 19, 9 }
    return (eesUses < #thresholds) and (hp <= thresholds[eesUses + 1])
end

function SetPositionalDT(mob)
    if not mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) then
	    mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 7, 0, 3600)
    elseif not mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
	    mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 7, 0, 3600)
    end
end