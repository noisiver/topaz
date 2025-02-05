-----------------------------------
-- Area: VeLugannon_Palace
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.VELUGANNON_PALACE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS      = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY  = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER             = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE            = 7049,  -- Tallying conquest results...
        CHEST_UNLOCKED           = 7216,  -- You unlock the chest!
        EVIL_PRESENCE            = 7226,  -- You sense an evil presence lurking in the shadows...
        KNIFE_CHANGES_SHAPE      = 7233,  -- The <item> begins to change shape.
        NOTHING_HAPPENS          = 7234,  -- Nothing happens.
        REGIME_REGISTERED        = 10159, -- New training regime registered!
        PLAYER_OBTAINS_ITEM      = 11211, -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 11212, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 11213, -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP     = 11214, -- You already possess that temporary item.
        NO_COMBINATION           = 11219, -- You were unable to enter a combination.
    },
    mob =
    {
        MIMIC            = 17502567,
        BRIGANDISH_BLADE = 17502568,
        STEAM_CLEANER    = 17502569,
        SC_DETECTORS     = 
        {
            DET1 = 17502535, -- Island Seiryu (1)
            DET2 = 17502537,
            DET3 = 17502551, -- Island Genbu (2)
            DET4 = 17502553,
            DET5 = 17502541, -- Island Suzaku (3)
            DET6 = 17502539,
            DET7 = 17502555, -- Island Byakko (4)
            DET8 = 17502557,
        },
        DETECTORS     = 
        {
           
            DET9 = 17502559, -- Genbu North Basement (2-2)
            DET10 = 17502561,
            DET11 = 17502563, -- Byakko North Basement (3-1)
            DET12 = 17502565,
            DET13 = 17502535, -- Seiryu South Basement (0-1)
            DET14 = 17502537,
            DET15 = 17502541, -- Suzaku South Basement (0-2)
            DET16 = 17502539,
        }

    },
    npc =
    {
        QM3             = 17502583,
        CASKET_BASE     = 17502585,
        Y_DOOR_OFFSET   = 17502608,
        B_DOOR_OFFSET   = 17502616,
        Y_LITH_OFFSET   = 17502624,
        B_LITH_OFFSET   = 17502634,
        TREASURE_COFFER = 17502699,
        H3_YELLOW_GATE  = 17502615,
        H3_BLUE_GATE    = 17502616,
    },
}

return zones[tpz.zone.VELUGANNON_PALACE]
