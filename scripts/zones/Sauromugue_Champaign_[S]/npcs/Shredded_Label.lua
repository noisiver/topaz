-----------------------------------
-- Area: Sauromugue Champaign [S]
--  NPC: Shredded Label
-- Iqi-Balam ANNM
-- !addkeyitem GREEN_LABELED_CRATE
-- !pos 642.782 23.999 81.119 98
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end