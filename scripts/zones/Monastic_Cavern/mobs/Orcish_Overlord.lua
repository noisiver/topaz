-----------------------------------
-- Area: Monastic Cavern
--   NM: Orcish Overlord
-- Note: PH for Overlord Bakgodek
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Monastic_Cavern/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    -- the quest version of this NM doesn't drop gil
    if mob:getID() >= ID.mob.UNDERSTANDING_OVERLORD_OFFSET then
        mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    end
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.ORCISH_OVERLORD_ENGAGE)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller then
        mob:showText(mob, ID.text.ORCISH_OVERLORD_DEATH)
    end
end

function onMobDespawn(mob)
    SpawnMob(mob:getID() + 1)
end
