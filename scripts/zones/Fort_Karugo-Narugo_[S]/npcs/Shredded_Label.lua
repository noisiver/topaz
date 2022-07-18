-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  NPC: Shredded Label
-- Amaranth ANNM
-- !addkeyitem GREEN_LABELED_CRATE
-- !pos -480.000 -27.209 56.000 96
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end