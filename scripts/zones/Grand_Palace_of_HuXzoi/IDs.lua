-----------------------------------
-- Area: Grand_Palace_of_HuXzoi
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.GRAND_PALACE_OF_HUXZOI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7071, -- Tallying conquest results...
        DOES_NOT_RESPOND        = 7235, -- The gate does not respond...
        REQUEST_CONFIRMED       = 7356, -- Security portal request confirmed.
        PATROL_COMPLETE         = 7357, -- Patrol routine completed.
        DUTY_COMPLETE           = 7358, -- Transfer of final security portal access duty complete.
        PORTAL_EAST             = 7361, -- You hear a portal open to the east...
        PORTAL_WEST             = 7362, -- You hear a portal open to the west...
        PORTAL_NORTH            = 7363, -- You hear a portal open to the north...
        TIME_EXCEEDED           = 7364, -- Patrol routine time restriction exceeded. Patrol aborted.
        PATROL_SUSPENDED        = 7365, -- Patrol suspended.
        RECOMMENCING_PATROL     = 7366, -- Recommencing patrol.
        RECENTLY_ACTIVATED      = 7367, -- The alcove has been recently activated...
        TIME_RESTRICTION        = 7368, -- Time restriction <mins> minutes (Earth time)
        HUXZOI_MAP_COMPLETE     = 7379, -- Examination complete. Examinee unregistered. Kuluu syndrome detected. ...
        HOMEPOINT_SET           = 7453, -- Home point set!
    },
    quasilumin_text =
    {
        [16916897] = 7369,
        [16916898] = 7370,
        [16916899] = 7371,
        [16916900] = 7372,
        [16916901] = 7373,
        [16916902] = 7374,
        [16916903] = 7375,
        [16916904] = 7376,
        [16916905] = 7377,
        [16916906] = 7378,
    },
    mob =
    {
        JAILER_OF_TEMPERANCE_PH = 
        {
            16916489, -- -420 -1 757
            16916508, --  -43 -1 460
            16916525, -- -260 -1.5 43
            16916541, -- -580 -1.5 43
            16916560, -- -797 -1.5 460
        },
        IXGHRAH                 = 16916813,
        JAILER_OF_TEMPERANCE    = 16916814,
        IXAERN_MNK              = 16916815,
    },
    npc =
    {
        IXAERN_MNK_QM = 16916819,
        QUASILUMIN_OFFSET = 16916897,
    },
}

return zones[tpz.zone.GRAND_PALACE_OF_HUXZOI]
