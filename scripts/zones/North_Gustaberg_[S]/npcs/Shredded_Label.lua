-----------------------------------
-- Area: North Gustaberg [S]
--  NPC: Shredded Label
-- Feeorin ANNM
-- !addkeyitem BLUE_LABELED_CRATE
-- !pos -199.721 0.499 469.335 88
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end