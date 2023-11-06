-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Platoon Scorpion
-- BCNM: Operation Desert Swarm
-----------------------------------
local ID = require("scripts/zones/Waughroon_Shrine/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function canForceTPMove(mob)
    if (mob == nil)
    or not mob:isAlive()
    or mob:hasPreventActionEffect()
    then return false end

    return true
end

function onMobInitialize(mob)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "SCORP_MIMIC_START", function(mob, skillID)
        local bf = mob:getBattlefield():getArea()
        for _, allyId in ipairs(ID.operationDesertSwarm[bf]) do
            if (mob:getID() ~= allyId) then
                GetMobByID(allyId):addTP(1000)
            end
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "SCORP_MIMIC_STOP", function(mob, skillID)
        mob:setLocalVar('[ODS]mimic', 0) -- reset infinite loop flag

        -- wiki: sometimes Wild Rage self stuns and sometimes Earth Pounder self binds
        if skillID == 354 and math.random() < 0.35 then -- Wild Rage
            mob:showText(mob,ID.text.SCORPION_IS_STUNNED)
            mob:addStatusEffect(tpz.effect.STUN,0,0,math.random(4,6))
        elseif skillID == 355 and math.random() < 0.55 then -- Earth Pounder
            mob:showText(mob,ID.text.SCORPION_IS_BOUND)
            mob:addStatusEffect(tpz.effect.BIND,0,0,math.random(10,15))
        end
    end)
end

function onMobFight(mob, target)
    -- Gain resistance to sleep after every cast

    mob:addListener("EFFECT_GAIN", "PLATOON_SCORP_EFFECT_GAIN", function(owner, effect)
        local effectType = effect:getType()

        -- Gains resistance to Sleep if it successfully lands
        if (effectType == tpz.effect.SLEEP) then
            if (mob:getMod(tpz.effect.EEM_DARK_SLEEP) >= 5) then -- Lowest EEM possible
                if (mob:getMod(tpz.effect.EEM_DARK_SLEEP) == 100) then -- Next tier is -15%
                    mob:setMod(tpz.effect.EEM_DARK_SLEEP, 85)
                elseif (mob:getMod(tpz.effect.EEM_DARK_SLEEP) > 30) then -- 30-85 Tiers are -10% per tier
                    mob:setMod(tpz.effect.EEM_DARK_SLEEP, mob:getMod(tpz.effect.EEM_DARK_SLEEP) -10)
                else -- Rest are -5% per tier
                    mob:setMod(tpz.effect.EEM_DARK_SLEEP, mob:getMod(tpz.effect.EEM_DARK_SLEEP) -5)
                end
            end
        end

        -- Gains resistance to Lullaby if it successfully lands
        if (effectType == tpz.effect.LULLABY) then
            if  (mob:getMod(tpz.effect.EEM_LIGHT_SLEEP) >= 5) then -- Lowest EEM possible
                if (mob:getMod(tpz.effect.EEM_LIGHT_SLEEP) == 100) then -- Next tier is -15%
                    mob:setMod(tpz.effect.EEM_LIGHT_SLEEP, 85)
                elseif (mob:getMod(tpz.effect.EEM_LIGHT_SLEEP) > 30) then -- 30-85 Tiers are -10% per tier
                    mob:setMod(tpz.effect.EEM_LIGHT_SLEEP, mob:getMod(tpz.effect.EEM_LIGHT_SLEEP) -10)
                else -- Rest are -5% per tier
                    mob:setMod(tpz.effect.EEM_LIGHT_SLEEP, mob:getMod(tpz.effect.EEM_LIGHT_SLEEP) -5)
                end
            end
        end
    end)
end


function onMobWeaponSkillPrepare(mob, target)
    if math.random() < 0.65 then return 354 else return 355 end -- prefer wild rage
	end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if mob:getLocalVar('HasTriggeredDeathScriptOnce') == 0 then
        mob:setLocalVar('HasTriggeredDeathScriptOnce', 1)
        for _, allyId in ipairs(ID.operationDesertSwarm[mob:getBattlefield():getArea()]) do
            local scorp = GetMobByID(allyId)
            if (scorp ~= nil) and scorp:isAlive() then
                scorp:setDamage(150)
            end
        end 
    end
end

