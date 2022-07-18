-----------------------------------
-- Area: The Eldieme Necropolis [S]
--  NPC: Shredded Label
-- Ellylldan ANNM
-- !addkeyitem RED_LABELED_CRATE
-- !pos 383.963 -33.697 -374.257 175
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end