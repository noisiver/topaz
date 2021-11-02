-----------------------------------
-- Area: Mine_Shaft_2716
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.MINE_SHAFT_2716] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        BCNM_SEALED             = 7080, -- A heavy wooden gate. It is tightly locked...
        CONQUEST_BASE           = 7420, -- Tallying conquest results...
        BCNM_CLEARANCE          = 7360, -- Currently, <total> members of your party (including yourself) have clearance to enter the battlefield.
        BCNM_ENTERING           = 7583, -- Entering the battlefield for "<bcnmindex>"!
        MOVAMUQ_OFFSET          = 7801, -- Bug Bug! Come come!
        CHEKOCHUK_OFFSET        = 7809, -- Buuug! Oooveeer heeere nooow! 7813 Buug! Noooooooooo!
        TRIKOTRAK_OFFSET        = 7817, -- Bg! Pnch! Kck!
        SWIPOSTIK_OFFSET        = 7825, -- Bug's! Smash's up's this's ones's!
        BUGBBY_OFFSET           = 7832, -- Ugh.
        GOODE_BYONGO            = 7843, -- Ho-ho, ho-ho! Time for goodebyongo (upon aggro)
        HEY_HEY_HERE_TO_STAY    = 7844, -- Hey-hey, hey-hey! Are you here to stay? (re-engage after death)
        ROLY_POLY_ROLY_POLY     = 7845, -- Roly-poly, roly-poly
        GO_GO                   = 7848, -- Go go go go (upon ability trigger)
        HA_HA                   = 7849, -- Ha ha, ha ha (used when buffing automaton)
        YAY_YAY_NOT_YOUR_LUCKY  = 7850, -- Yay-yay, yay-yay! Not your lucky day (automaton 2 hour use)
        NO_NO_PAPA_BOUGHT_THAT  = 7851, -- No-no, no-no! Papa bought me that, you know!
        HUFF_YOU_PLAY_TOO_ROUGH = 7853, -- Huff-huff, huff-huff... You play too rough...
        OW_YOU_MAKE_ME_MAD_NOW  = 7854, -- Ow-ow, ow-ow! You make me mad now!
        HO_HO_GOODEBYONGO       = 7855, -- Ho-ho, ho-ho! Goodebyongo! (upon player defeat or time out)
    },
    mob =
    {
        BUGBBY = { 16830469 },          -- One for each battlefield
    },
    npc =
    {
    },
}

return zones[tpz.zone.MINE_SHAFT_2716]
