-----------------------------------
-- Area: Crawler's Nest [S]
--  NPC: Shredded Label
-- Goldcap ANNM
-- !addkeyitem BLUE_LABELED_CRATE
-- !pos -91.226 -9.606 91.872 171
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end