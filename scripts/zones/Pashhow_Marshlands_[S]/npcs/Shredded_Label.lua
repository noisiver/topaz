-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Shredded Label
-- Groot Slang ANNM
-- !addkeyitem BLUE_LABELED_CRATE
-- !pos -176.000 25.249 96.000 90
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end