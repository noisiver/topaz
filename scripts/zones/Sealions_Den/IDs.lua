-----------------------------------
-- Area: Sealions_Den
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SEALIONS_DEN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS     = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        TENZEN_MSG_OFFSET       = 7911, -- 
        MAKKI_CHUBUKKI_OFFSET   = 7915, --
        KUKKI_CHEBUKKI_OFFSET   = 7921, --
        CHERUKIKI_OFFSET        = 7927, --
        CONQUEST_BASE           = 7420, -- Tallying conquest results...
        BCNM_SEALED             = 7086, -- A solid iron gate. It is tightly locked...
        BCNM_CLEARANCE          = 7360, -- Currently, <total> members of your party (including yourself) have clearance to enter the battlefield.
        CONQUEST_BASE           = 7419, -- Tallying conquest results...
        BCNM_ENTERING           = 7582, -- Entering the battlefield for "<bcnmindex>"!
    },
    mob =
    {
        ONE_TO_BE_FEARED_OFFSET = 16908289,
        WARRIORS_PATH_OFFSET    = 16908310,
    },
    npc =
    {
        AIRSHIP_DOOR_OFFSET = 16908420,
    },
}

return zones[tpz.zone.SEALIONS_DEN]
