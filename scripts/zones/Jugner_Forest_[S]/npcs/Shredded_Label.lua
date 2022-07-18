-----------------------------------
-- Area: Jugner Forest [S]
--  NPC: Shredded Label
-- Zmag Ognjeni Vuk ANNM
-- !addkeyitem RED_LABELED_CRATE
-- !pos -567.289 -1.548 -435.348 82
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end