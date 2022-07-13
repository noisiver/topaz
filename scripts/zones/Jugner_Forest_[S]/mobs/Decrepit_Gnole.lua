-----------------------------------
-- Area: Jugner Forest [S]
--  Mob: Decrepit Gnole
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------
function onMobWeaponSkillPrepare(mob, target)
    return 2172 -- Only uses Animating Wail
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.VOIRLOUP_PH, 20, 3600) -- 1 hour
end

