-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Yagudo Avatar
-- Note: PH for Tzee Xicu the Manifest
-- TODO: messages should be zone-wide
-----------------------------------
mixins = {require("scripts/mixins/job_special"), require("scripts/mixins/families/avatar")}
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.YAGUDO_AVATAR_ENGAGE)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller then
        mob:showText(mob, ID.text.YAGUDO_AVATAR_DEATH)
    end
end

function onMobDespawn(mob)
    SpawnMob(mob:getID() + 3)
end
