-----------------------------------
-- Area: Silver_Sea_route_to_Nashmau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SILVER_SEA_ROUTE_TO_NASHMAU] =
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
        FISHING_MESSAGE_OFFSET  = 7049, -- You can't fish here.
        ON_WAY_TO_NASHMAU  = 7150, -- We're on our way to Nashmau. We should be there in [less than an hour/about 1 hour/about 2 hours/about 3 hours/about 4 hours/about 5 hours/about 6 hours/about 7 hours] (# [minute/minutes] in Earth time).
        DOCKING_IN_NASHMAU      = 7309, -- We are now docking in Nashmau.
        NEARING_NASHMAU         = 7310, -- We are nearing Nashmau.
        JIDWAHN_SHOP_DIALOG     = 7312, -- Would you care for some items to use on your travels?
        ON_WAY_TO_NASHMAU       = 7313, -- We are on our way to Nashmau. We will be arriving soon.
    },
    mob =
    {
        SEA_CREATURES =
        {
            17014791,   -- Sea Monk 1
            17014792,   -- Sea Crab 1
            17014793,   -- Sea Crab 2
            17014794,   -- Sea Pugil 1
            17014795,   -- Sea Pugil 2
            17014796,   -- Sea Monk 2
            17014798,
        },
        UTUKKU = 17014797,
        PROTEUS = 17014801,
    },
    npc =
    {
    },
}

return zones[tpz.zone.SILVER_SEA_ROUTE_TO_NASHMAU]
