-----------------------------------
-- Area: Lebros_Cavern
-----------------------------------
require("scripts/globals/zone")
require("scripts/globals/missions")
-----------------------------------

zones = zones or {}

zones[tpz.zone.LEBROS_CAVERN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE    = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                 = 6388, -- Obtained: <item>.
        GIL_OBTAINED                  = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6391, -- Obtained key item: <keyitem>.
        KEYITEM_LOST                  = 6392, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL           = 6394, -- You do not have enough gil.
        ITEMS_OBTAINED                = 6397, -- You obtain <number> <item>
        MINE_COUNTDOWN                = 6980, -- <number>...
        CANNOT_ENTER_LEVEL_RESTRICTED = 7021, -- Your party is unable to participate because certain members' levels are restricted.
        PLAYER_OBTAINS_TEM_ITEM       = 7209, -- <Player> obtains the temporary item: <item>!
        TEMP_ITEM                     = 7210, -- Obtained temporary item: <item>!
        PLAYER_OBTAINS_ITEM           = 7211, -- <name> obtains <item>!
        ASSAULT_START_OFFSET          = 7346, -- NO TEXT
        TIME_TO_COMPLETE              = 7407, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED                = 7408, -- The mission has failed. Leaving area.
        RUNE_UNLOCKED_POS             = 7409, -- Mission objective completed. Unlocking Rune of Release ([A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P/Q/R/S/T/U/V/W/X/Y/Z]-#).
        ASSAULT_POINTS_OBTAINED       = 7411, -- You gain <number> [Assault point/Assault points]!
        TIME_REMAINING_MINUTES        = 7412, -- Time remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS        = 7413, -- Time remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN                  = 7416, -- All party members have fallen in battle. Mission failure in <number> [minute/minutes].
        STILL_HUNGRY_FED              = 7425, -- Thank Zahak you're here. I was about to start eating my boots!
        FULL_FED                      = 7426, -- You brought more supplies? Well, you can never have too much...
        STILL_HUNGRY_TRIGGER          = 7427, -- The provisions... Have you brought the provisions?
        FULL_HUNGRY                   = 7428, -- There's nothing like a full belly to put the power back in your sword swing. I pity the next monster that crosses my path!
        HAVE_RATIONS                  = 7429, -- Why don't you deliver the rations I already gave you?
        DEPENDING_ON                  = 7430, -- The advance unit is depending on these provisions. Don't let them down!
        STEWPOT_TALK                  = 7431, -- This should keep a whole unit filled up for a while.
        RATIONS                       = 7432, -- There are still brave soldiers starving out there! Quickly, those rations must be delivered!
    },

    mob =
    {
        -- Excavation Duty
        [21] =
        {
            LEUJAOAM_WORM  = 17060177,
            LEUJAOAM_WORM2  = 17060178,
            LEUJAOAM_WORM3  = 17060179,
            LEUJAOAM_WORM4  = 17060180, 
            RUBY_ERUCA  = 17060181,
            RUBY_ERUCA2  = 17060182,
            RUBY_ERUCA3  = 17060183,
            LOST_WAMOURACAMPA = 17060187,
            RUBY_ERUCA4 = 17060188,
            RUBY_ERUCA5 = 17060189,
            BODACIOUS_ELLY = 17060190,
            LOST_WAMOURACAMPA2 = 17060191,
            LOST_WAMOURACAMPA3 = 17060192,
            LOST_WAMOURACAMPA4 = 17060193,
            LOST_WAMOURACAMPA5 = 17060194,
            RUBY_ERUCA6 = 17060196,
            LOST_WAMOURACAMPA6 = 17060197,
            RAVAGING_DIREMITE = 17060200,
        },
    },

    npc =
    {
        ANCIENT_LOCKBOX = 17035478,
        RUNE_OF_RELEASE = 17035479,
        _1rx            = 17035537,
        _1ry            = 17035538,
        _1rz            = 17035539,
        _jr0            = 17035540,
        _jr1            = 17035541,
    }
}

return zones[tpz.zone.LEBROS_CAVERN]
