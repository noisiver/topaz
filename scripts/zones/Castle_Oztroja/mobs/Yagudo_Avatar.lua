-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Yagudo Avatar
-- Note: PH for Tzee Xicu the Manifest
-- TODO: messages should be zone-wide
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.YAGUDO_AVATAR_ENGAGE)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        mob:showText(mob, ID.text.YAGUDO_AVATAR_DEATH)
    end
end

function onMobDespawn(mob)
    local nqId = mob:getID()

    if nqId == ID.mob.YAGUDO_AVATAR then
        local hqId = mob:getID() + 3
        local ToD = GetServerVariable("[POP]Tzee_Xicu_the_Manifest")
        local kills = GetServerVariable("[PH]Tzee_Xicu_the_Manifest")
        local popNow = (math.random(1, 5) == 3 or kills > 0)

        if os.time() > ToD then
            DisallowRespawn(nqId, true)
            DisallowRespawn(hqId, false)
            UpdateNMSpawnPoint(hqId)
            GetMobByID(hqId):setRespawnTime(math.random(36000, 43200)) -- 21 to 23 hours
        else
            UpdateNMSpawnPoint(nqId)
            mob:setRespawnTime(math.random(36000, 43200)) -- 21 to 23 hours
            SetServerVariable("[PH]Tzee_Xicu_the_Manifest", kills + 1)
        end
    end
end
