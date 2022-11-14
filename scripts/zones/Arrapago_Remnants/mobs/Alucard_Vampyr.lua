-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Alucard (Vampyr)
-- ID: 17081211
-- Don't waste my time.
-- What trickery is this?
-- You fail to amuse me.
-- Pitiful.
-- What a foolish ploy.
-- This will please me.
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:addStatusEffect(tpz.effect.TERROR, 1, 0, 5)
    end
    salvageUtil.msgGroup(mob, "What trickery is this?", 0, "Alucard")
    mob:setDelay(3500)
    mob:setDamage(40)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    -- Says a line after every TP move
    if skill:getID() == xxx then
    end
    -- Don't waste my time.
    -- What trickery is this?
    -- You fail to amuse me.
    -- Pitiful.
    -- What a foolish ploy.
    -- This will please me.
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    if isKiller or noKiller then
        -- Nearby door opens
        instance:setProgress(10)
        mob:getEntity(bit.band(ID.npc[6].DOOR, 0xFFF), tpz.objType.NPC):setAnimation(8)
        mob:getEntity(bit.band(ID.npc[6].DOOR, 0xFFF), tpz.objType.NPC):untargetable(true)
        salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
    end
end

function onMobDespawn(mob)
end
