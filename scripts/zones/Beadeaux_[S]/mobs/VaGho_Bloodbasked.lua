-- RDM/RDM
-- Aggressive, True Sound
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- Uses 2-4 T3 nukes or RDM enfeebles(including sleep II) in a row
-- Uses Head Butt, Shell Guard, Diamond Shell, Shell Bash, Ore Lob, Ore Toss
-- Uses 2 TP moves in a row(different moves) while silenced
-- Used Chainspell at ~65%
-- If silenced during Chainspell, gains a very very potent regain(Spams TP moves over and over) until Chainspell ends
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
