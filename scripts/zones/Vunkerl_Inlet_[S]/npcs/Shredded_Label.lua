-----------------------------------
-- Area: Vunkerl Inlet [S]
--  NPC: Shredded Label
-- Procrustes ANNM
-- !addkeyitem RED_LABELED_CRATE
-- !pos -199.744 -31.544 650.647 83
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end