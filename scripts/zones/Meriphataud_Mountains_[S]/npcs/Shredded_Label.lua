-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Shredded Label
-- Brummbar ANNM
-- !addkeyitem GREEN_LABELED_CRATE
-- !pos 240.032 0.169 -74.553 97
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end