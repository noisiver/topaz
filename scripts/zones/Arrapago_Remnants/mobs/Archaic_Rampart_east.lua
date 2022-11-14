-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Archaic Rampart (east)
-- ID: 17080512
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:AnimationSub(0)
    mob:setUnkillable(true)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()

    -- Usea Astral Gate when below 10% HP
    if mob:getHPP() < 10 then
        mob:useMobAbility(2036)
    end

    mob:addListener("WEAPONSKILL_STATE_EXIT", "RAMPART_STATE_EXIT", function(mob, skill)
        if skill == 2036 then -- Astral Gate
            DespawnMob(mob:getID(instance), instance)
        end
    end)
end

function onMobWeaponSkillPrepare(mob, target)
    -- Only uses Roller Chain and Choke Chain
    return math.random(2032, 2033)
end

function onMobWeaponSkill(target, mob, skill)
    -- "Sucks" in players and ports them to the room behind where the Archaic Rampart spawned

    if skill:getID() == 2036 then -- Astral Gate
        salvageUtil.teleportGroup(target, math.random(416, 423), -0, math.random(176, 183), 0, true, false, false)
        salvageUtil.msgGroup(target, "The " .. MobName(mob) .. " sucks you in!", 0xD, none)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end

-- For testing purposes only
--function onMobWeaponSkillPrepare(mob, target)
--    return 1560 
--end
