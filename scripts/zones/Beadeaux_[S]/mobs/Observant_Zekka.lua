-----------------------------------
-- Area: Beadeaux [S]
--  Mob: Observant Zekka
-- !pos 128 0.4 161
-- BLM/BLM
-- Immune to Silence, Paralyze, Sleep, Bind, Gravity, Break
-- Casts Blaze Spikes, T3 Nukes, Blind, Stun, Elemental Enfeebles(All BLM spells basically)
-- After using Abrasive Tantara he will counter magic with AM of that element, Holy, and Sleepga2 for ~90s
-- AFter using Deafening Tantara he will counter Weapon Skills with Frenetic Rip for ~90s
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end