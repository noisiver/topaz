-- PLD/PLD
-- Immune to Paralyze, Silence, Sleep, Bind, Gravity, Break
-- Casts: Flash, Banish II, Protect IV, Shell IV, Cure IV below 33%
-- Diamond Shell has Reprisal effect
-- Occasionally (every 30-45s?) turns and faces away putting his back to face you for ~10 seconds
-- Uses Ore Toss, Ore Lob, Diamond Shell, Shell Bash, Shell Charge, Head Butt
-- Uses Invincible around 5% and gains reprisal during it on all sides
-- No damage cap on his reprisal
-----------------------------------
-- Area: Beadeaux [S]
--   NM: Ba'Tho Mercifulheart
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end