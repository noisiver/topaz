-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Aa Xalmo the Savage
-- MNK/MNK
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- Always up, not lotto.
-- Uses: Parry, Feathered Furore, Double Kick, Feather Storm
-- Uses Hundred Fists
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
