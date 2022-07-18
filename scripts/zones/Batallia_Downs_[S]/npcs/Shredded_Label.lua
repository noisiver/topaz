-----------------------------------
-- Area: Batalla Downs [S]
--  NPC: Shredded Label
-- Scythefang Liger ANNM
-- !addkeyitem RED_LABELED_CRATE
-- !pos 335.000 3.687 65.000 84
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end