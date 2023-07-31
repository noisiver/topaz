-----------------------------------
-- Area: Ghoyu's Reverie
--  Mob: Lambton Worm
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.LAMBTON_WORM_DESEGMENTER)
end
