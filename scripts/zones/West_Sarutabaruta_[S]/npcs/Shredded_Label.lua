-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Shredded Label
-- Cosmos ANNM
-- !addkeyitem GREEN_LABELED_CRATE
-- !pos -110.000 -5.001 -262.000 95
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end