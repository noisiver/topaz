-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Waukesha Leech(Leech NM)
-- ID: 17081056
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DMG, -50)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    mob:delImmunity(tpz.immunity.SILENCE) 
end

function onMobEngaged(mob, target)
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    mob:addListener("SKILLCHAIN_TAKE", "WL_SC_TAKE", function(mob, target, element)
        if element == 8 or element == 12 or element == 13 or element == 15 then -- Lightning damage skillchains
            BreakMob(mob, target, 1, 30, 1)
            mob:setMod(tpz.mod.REGEN, 0)
        end
    end)
    if not mob:hasStatusEffect(tpz.effect.SILENCE) then
        PeriodicInstanceMessage(mob, target, "The Wausha Leech is regenerating.", 0xD, none, 30)
        mob:setMod(tpz.mod.REGEN, 100)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    -- Only uses Random, Absorbing or Deep kiss
    return math.random(325, 327)
end

function onMobDeath(mob, player, isKiller)
    if isKiller or noKiller then
        -- Nearby door opens
        mob:getEntity(bit.band(ID.npc[1][3].DOOR2, 0xFFF), tpz.objType.NPC):setAnimation(8)
        mob:getEntity(bit.band(ID.npc[1][3].DOOR2, 0xFFF), tpz.objType.NPC):untargetable(true)
        salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
    end
end

function onMobDespawn(mob)
end

-- For testing purposes only
--function onMobWeaponSkillPrepare(mob, target)
--    return 1560 
--end
