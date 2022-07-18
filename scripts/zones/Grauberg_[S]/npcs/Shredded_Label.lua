-----------------------------------
-- Area: Grauberg [S]
--  NPC: Shredded Label
-- Simorg ANNM
-- !addkeyitem BLUE_LABELED_CRATE
-- !pos -518.7025 -176 276.38 89
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end