-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Waukesha Leech(Leech NM)
-- ID: 17081056
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.DMG, -50)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
    mob:delImmunity(tpz.immunity.SILENCE) 
end

function onMobEngaged(mob, target)
    PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " is regenerating.", 0xD, none, 30)
end

function onMobFight(mob, target)
    local msgs =
    {
        [1] = "The " .. MobName(mob) .. " seems weak to skillchains...",
        [2] = "The " .. MobName(mob) .. " is regenerating."
    }

    mob:addListener("SKILLCHAIN_TAKE", "WL_SC_TAKE", function(mob, target, element)
        if element == 8 or element == 12 or element == 13 or element == 15 then -- Lightning damage skillchains
            BreakMob(mob, target, 1, 30, 1)
            mob:setMod(tpz.mod.REGEN, 0)
        end
    end)
    if not mob:hasStatusEffect(tpz.effect.SILENCE) then
        PeriodicInstanceMessage(mob, target, msgs[math.random(#msgs)], 0xD, none, 30)
        mob:setMod(tpz.mod.REGEN, 100)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    -- Only uses Random, Absorbing or Deep kiss
    return math.random(325, 327)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        -- Nearby door opens
        mob:getEntity(bit.band(ID.npc[1][3].DOOR2, 0xFFF), tpz.objType.NPC):setAnimation(8)
        mob:getEntity(bit.band(ID.npc[1][3].DOOR2, 0xFFF), tpz.objType.NPC):untargetable(true)
        salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
    end
end

function onMobDespawn(mob)
end