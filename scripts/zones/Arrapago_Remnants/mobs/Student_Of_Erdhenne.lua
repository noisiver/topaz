-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Student Of Erdhenne (Ghost NM)
-- ID: 17081113
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
-- T3 -gas and -ga enfeebles
spellList =
{
    176, 181, 186, 191, 196, 201, 356, 357, 359, 360, 361, 362, 365, 366
}
positions =
{
    [1] = {10, 10},
    [2] = {-10, -10},
    [3] = {10, -10},
    [4] = {-10, 10},
    [5] = {15, 15},
    [6] = {-15, -15},
    [7] = {15, -15},
    [8] = {-15, 15},
    [9] = {10, 15},
    [10] = {15, 10},
    [11] = {10, -15},
    [12] = {-10, 15},
    [13] = {15, -10},
    [14] = {-15, 10},
    [15] = {-10, -15},
    [16] = {-15, -10},
}

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DMGSC, 100)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    mob:delImmunity(tpz.immunity.SILENCE) 
end

function onMobEngaged(mob, target)
    mob:setLocalVar("teleport", os.time() + math.random(30, 45))
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    -- TODO: Can telepor while stunned add not mob:hasStatusEffect(tpz.effect.STUN)
    -- Teleports away every 45s and casts a random spell from table if not terrored or mid spell cast
    if mob:getLocalVar("teleport") < os.time() and not mob:hasStatusEffect(tpz.effect.TERROR) and
    mob:getCurrentAction() ~= tpz.action.MAGIC_CASTING then 
        mob:setLocalVar("teleport", os.time() + 45)
        TeleportMob(mob, 5000, spellList[math.random(#spellList)])
        mob:timer(2000, function(mob)
		    mob:setPos(mob:getXPos() + positions[math.random(#positions)][1], mob:getYPos(), mob:getZPos() + positions[math.random(#positions)][2])
        end)
    end

    mob:addListener("SPELL_DMG_TAKEN", "SoE_SPELL_DMG_TAKEN", function(mob, caster, spell, amount, msg)
        local element = spell:getElement()
        -- Taking a 1k+ damage light MB
        if (element == tpz.magic.ele.LIGHT) and (amount >= 500) then
            if (msg == tpz.msg.basic.MAGIC_BURST_BLACK) or (msg == tpz.msg.MAGIC_BURST_BREATH) then
                BreakMob(mob, caster, 1, 60, 2)
            end
        end
    end)
    if not mob:hasStatusEffect(tpz.effect.TERROR) then
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems vulnerable to light magic...", 0xD, none, 30)
    end
end


function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()

    if isKiller or noKiller then
        -- If final boss, spawn next boss in line
        if salvageUtil.TrySpawnChariotBoss(mob, player, 17081148) then
        else
            -- Increase progress counter, at 4 turn teleporter back on
            instance:setProgress(instance:getProgress() +1)
        end
    end
end

function onMobDespawn(mob)
end
