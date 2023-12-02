-----------------------------------
-- Area: Balga's Dais
--   NM: Macan Gadangan
--  BCNM: Wild Wild Whiskers
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Balgas_Dais/IDs")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobEngaged(mob, target)
     mob:setLocalVar("textShown", 0)
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_SILENCE, 150)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    local textShown = mob:getLocalVar("textShown")
    local frenziedRage = mob:getLocalVar("frenziedRage")
    if mob:hasStatusEffect(tpz.effect.SILENCE) then
        mob:setSpellList(448)
        mob:setMod(tpz.mod.EEM_SILENCE, 5)
    end

    if (frenziedRage > 0) then
        mob:setLocalVar("frenziedRage", 0)
        mob:useMobAbility(481)
    end

    -- Handle Frenzy Rage being interrupted
    mob:addListener("WEAPONSKILL_STATE_INTERRUPTED", "MACAN_WS_INTERRUPTED", function(mob, skill)
        if skill == 481 then
            mob:setLocalVar("frenziedRage", 1)
        end
    end)

    -- Immune to Stun while casting Burst
    mob:addListener("MAGIC_START", "MACAN_MAGIC_START", function(mob, spell)
        if (spell:getID() == 212) then -- Burst
            mob:setMod(tpz.mod.EEM_STUN, 5)
            -- Whiskers twitch when casting
            if (mob:getLocalVar("textShown") == 0) then
                mob:setLocalVar("textShown", 1)
                mob:messageText(mob, ID.text.WHISKERS_VIOLENTLY)
            end
        end
    end)

    mob:addListener("MAGIC_INTERRUPTED", "MACAN_MAGIC_INTERRUPTED", function(mob, spell)
        -- uses Frenzied Rage when spellcasting is interrupted
        mob:setLocalVar("frenziedRage", 1)
        -- Interrupted isn't same as exit, so need to set stun res back to 100
        mob:setMod(tpz.mod.EEM_STUN, 100)
    end)

    mob:addListener("MAGIC_STATE_EXIT", "MACAN_MAGIC_STATE_EXIT", function(mob, spell)
        mob:setMod(tpz.mod.EEM_STUN, 100)
        mob:setLocalVar("textShown", 0)
    end)
end

function onCastStarting(mob, spell)
    -- Increase cast time because custom reduced it's cast time by -50%
    if (spell:getID() == 212) then -- Burst
         spell:castTime(spell:castTime() * 1.5)
    end
end

function onMonsterMagicPrepare(mob, target)
end



function onMobDeath(mob, player, isKiller, noKiller)
end
