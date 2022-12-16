-- THF/THF
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- Does not RA in melee range
-- Runs away and stays at range using Ore Toss every 10 seconds
-- Runs away to ~23.5 yalms then runs back to ~13.5 if you run to him, but if you chase again after he won't run away again for a while
-- Run Timer 01;53 - > 02:27 - > 03:04 - > 03:38 - > 04:14 - > 04:46 - > 05:29 - > 06:43
-- Summons (summoning animation) a random tube that uses a random TP move then despawns.
-- Summon Timer: 54:41 - > 55:46 - > 56:31 - > 57:12 - > 58:29 - > 59:24 -> 00:22 - > 01:15 1m?
-- Summoner Timer (49% HP): 07:34 - > 08:08 - > 08:33 - > 08:54 - > 09:23 - > 09:46 - 10:12 30s?
-- Summoner Timer (24% HP): 12:46 - > 12:58 - > 13:13 - > 13:26 - > 13:43 - > 13:57 - > 14:12 15s
-- Summoner Timer (9% HP): 16:42 - > 16:53 -> 17:03 -> 17:13 - > 17:23 - > 17:33 - > 17:43 10s
-- Uses Diamond Shell, Ore Lob, Head Butt, Shell Guard, HOwl
-- Used Pefect Dodge at 70%ish
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
