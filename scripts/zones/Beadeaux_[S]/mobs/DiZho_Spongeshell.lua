-- DRK/DRK
-- Immune to Paralyze, Silence, Sleep, Bind, Gravity, Break
-- Casts Absorb Spells including Absorb-ACC
-- Cast Timer: 31 - > 55 - > 21 - > 58 - > 32 - > 53 - > 17
-- Two Hour animation whenever he changes "modes"
-- Modes are Physical or Magical + Breath + Spirits absorb. **CAN SWAP into same absorb twice in a row!!**
-- Mode Timer: 52 - > 32 - > 24 - > 40 - > (over 1 minute) 55 - > 50
-- Absorbs double the dmg taken in mode.
-- Uses Shell Bash, Ore Lob, Head Butt, Ore Toss, Wrath of Gudha
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
