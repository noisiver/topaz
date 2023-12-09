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
    mob:setDamage(75)
    mob:setMod(tpz.mod.SDT_WIND, 130)
    mob:setMobMod(tpz.mobMod.SPECIAL_COOL, 6)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:SetAutoAttackEnabled(false)
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
    local gazeTickCheck = mob:getLocalVar("gazeTickCheck")

    -- Gradually petrifies anyone facing her, facing away removes the gruadl petrificaiton effect
    if not mob:hasStatusEffect(tpz.effect.TERROR) then -- Gaze Aura goes away while procced.
        if os.time() >= gazeTickCheck then
            mob:setLocalVar("gazeTickCheck", os.time() + 3)
            local nearbyPlayers = mob:getPlayersInRange(10)
            if (nearbyPlayers ~= nil) then
                for _,v in ipairs(nearbyPlayers) do
                    if mob:isFacing(v) and v:isFacing(mob) and not v:hasStatusEffect(tpz.effect.GRADUAL_PETRIFICATION) and not v:hasStatusEffect(tpz.effect.PETRIFICATION) then
                        v:addStatusEffect(tpz.effect.GRADUAL_PETRIFICATION, 10, 3, 15)
                    elseif not v:isFacing(mob) and v:hasStatusEffect(tpz.effect.GRADUAL_PETRIFICATION) then
                        v:delStatusEffectSilent(tpz.effect.GRADUAL_PETRIFICATION)
                    elseif not mob:isFacing(v) and v:hasStatusEffect(tpz.effect.GRADUAL_PETRIFICATION) then
                        v:delStatusEffectSilent(tpz.effect.GRADUAL_PETRIFICATION)
                    end
                end
            end
        end
    end

    -- Uses EES on a random target at 89,79,69,59,49,39,29,19,9% HP
    if (hp < 99) then
        for _, enmity in ipairs(enmityList) do
            if enmityList and #enmityList > 0 then
                if CheckForEES(mob) then
                    local randomTarget = enmityList[math.random(1,#enmityList)];
                    entityId = randomTarget.entity:getID();
                    if (entityId > 10000) then -- ID is a mob(pet) then
                        eesTarget = GetMobByID(entityId)
                    else
                        eesTarget = GetPlayerByID(entityId)
                    end
                    mob:setLocalVar("eesUses", eesUses +1)
                    mob:useMobAbility(1932, GetPlayerByID(eesTarget)) -- Eagle Eye Shot
                end
            end
        end
    end


    mob:addListener("SPELL_DMG_TAKEN", "MEDUSA_SPELL_DMG_TAKEN", function(mob, caster, spell, amount, msg)
        local element = spell:getElement()

        if (element == tpz.magic.ele.WIND) and (amount >= 300) then
            if (msg == tpz.msg.basic.MAGIC_BURST_BLACK) or (msg == tpz.msg.MAGIC_BURST_BREATH) then
                BreakMob(mob, caster, 1, 60, 2)
                -- Remove gradual petrification off players
                ClearGradualPetri(mob)
            end
        end
    end)

    if not mob:hasStatusEffect(tpz.effect.TERROR) then
        PeriodicMessage(mob, target, "The " .. MobName(mob) .. " seems vulnerable to wind magic...", 0xD, none, 30)
    end
    SetPositionalDT(mob)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    -- Remove gradual petrification off players
    ClearGradualPetri(mob)

    if isKiller or noKiller then
        -- If final boss, spawn next boss in line
        if salvageUtil.TrySpawnChariotBoss(mob, player, 17081245) then
        else
            -- Nearby door opens
            instance:setProgress(2)
            salvageUtil.teleportGroup(player, math.random(-344, -333), 0, -87, 0, true, false, false)
            salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
        end
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

function ClearGradualPetri(mob)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    -- Remove gradual petrification off players
    for i, v in pairs(chars) do
        v:delStatusEffectSilent(tpz.effect.GRADUAL_PETRIFICATION)
        v:delStatusEffectSilent(tpz.effect.PETRIFICATION)
    end
end