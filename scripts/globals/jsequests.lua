-- JSE quests
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/items")
require("scripts/globals/npc_util")
-----------------------------------
local questItems =
{
    [tpz.job.WAR] = { tpz.items.SCOWLENKOS_LEG, tpz.items.GHASTLY_CLOTH },
    [tpz.job.MNK] = { tpz.items.ARCH_BRACELET, tpz.items.DIREMITE_WEB },
    [tpz.job.WHM] = { tpz.items.ANTLION_CLAW, tpz.items.MOLECH_WING },
    [tpz.job.BLM] = { tpz.items.SPARTOI_STAFF, tpz.items.KINDRED_STAFF },
    [tpz.job.RDM] = { tpz.items.OVINNIK_TAIL, tpz.items.CATOBLEPAS_HOOFS },
    [tpz.job.THF] = { tpz.items.CARAFE_CORE, tpz.items.COCKATRICE_BEAK },
    [tpz.job.PLD] = { tpz.items.SPARTOI_SKULL, tpz.items.SKELETON_LIMB },
    [tpz.job.DRK] = { tpz.items.BIGHT_FOOT, tpz.items.EERIE_CLOTH },
    [tpz.job.BST] = { tpz.items.ABRAXAS_FEATHER, tpz.items.TYPHOON_WING },
    [tpz.job.BRD] = { tpz.items.HECTEYES_FELSH, tpz.items.HURRICANE_FANG },
    [tpz.job.RNG] = { tpz.items.ANTARES_CLAW, tpz.items.WEIGHTLESS_CLOTH },
    [tpz.job.SAM] = { tpz.items.KING_HORN, tpz.items.DARTER_WING},
    [tpz.job.NIN] = { tpz.items.SAPPLING_BUD, tpz.items.WYVERN_TAIL },
    [tpz.job.DRG] = { tpz.items.TARANTULA_FANG, tpz.items.DEMONIC_SHARD },
    [tpz.job.SMN] = { tpz.items.MANTICORE_CLAW, tpz.items.EFT_CLAW },
    [tpz.job.BLU] = { tpz.items.AMERETAT_EYE, tpz.items.PUDDING_PUTTY  },
    [tpz.job.COR] = { tpz.items.IMP_EYE, tpz.items.KRAKEN_TANCLE },
    [tpz.job.PUP] = { tpz.items.SPINNER_HEART, tpz.items.WAMOURA_FEELER },
    [tpz.job.DNC] = { tpz.items.GARGOUILLE_WING, tpz.items.PEISTE_FANG },
    [tpz.job.SCH] = { tpz.items.CARACAL_WHISKER, tpz.items.GNAT_EYE },
    [tpz.job.GEO] = { },
    [tpz.job.RUN] = { }
}

tpz = tpz or {}
tpz.jsequest = tpz.jsequest or {}

tpz.jsequest.onTrigger = function(player, npc, job)
    -- TODO: Logic to only play once, set var using jobid as seen, then not display again if seen = 1
end

tpz.jsequest.onTrade = function(player, npc, trade, job)
    -- TODO: questItems table
end