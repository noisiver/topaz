-----------------------------------
-- Area: Rolanberry Fields [S]
--  NPC: Shredded Label
-- Gummy Guillaume ANNM
-- !addkeyitem BLUE_LABELED_CRATE
-- !pos -534.532 -12.849 -169.783 91
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end