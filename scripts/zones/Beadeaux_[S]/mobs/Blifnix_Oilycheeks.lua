-- RNG/RNG
-- Stands back and shoots arrows, does not come in to melee at high HP
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- 3s delay on ranged attacks at range
-- 10s delay on ranged attacks in melee range
-- Slght Store TP bonus
-- Uses Goblin Rush and Bomb Toss
-- Summons up to 5 goblin mines after bomb toss
-- Bomb toss is faster than normal bomb toss, unstunnable
-- Pets / Trusts can set off the mines
-- Runs into melee range at 70%
-----------------------------------
-- Area: Beadeaux [S]
--   NM: Ba'Tho Mercifulheart
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end
