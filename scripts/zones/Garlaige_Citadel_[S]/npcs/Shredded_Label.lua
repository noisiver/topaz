-----------------------------------
-- Area: Garlaige Citadel [S]
--  NPC: Shredded Label
-- Khadem Quemquoma ANNM
-- !addkeyitem GREEN_LABELED_CRATE
-- !pos 98.975 7.085 -227.701 164
-----------------------------------
require("scripts/globals/annm")
-----------------------------------

function onTrigger(player, npc)
    tpz.annm.PopNM(player, npc)
end