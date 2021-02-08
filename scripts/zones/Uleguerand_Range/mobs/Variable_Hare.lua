------------------------------
-- Area: Uleguerand RAnge
--   Variable hare
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.MobMod.EXP_BONUS, 1000)
end