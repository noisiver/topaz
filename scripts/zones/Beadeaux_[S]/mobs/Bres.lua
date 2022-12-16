-- MNK/MNK
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- Only kicks, always twice in a row, up to three times in a row
-- Can Guard
-- Uses Dragon Kick, Aegis schism, Barbed Crescent(all fomor moves?). Greatly favors Dragon Kick.
-- Used 100 fists at 55% HP.
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
