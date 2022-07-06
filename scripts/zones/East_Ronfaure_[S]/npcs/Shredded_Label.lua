-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: Shredded Label
-- Queenbug ANNM
-- !addkeyitem RED_LABELED_CRATE
-- !pos 478 -19 -165 81
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end