-----------------------------------
-- Area: The_Shrouded_Maw
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.THE_SHROUDED_MAW] =
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
        CONQUEST_BASE           = 7421, -- Tallying conquest results...
    },
    mob =
    {
        DIABOLOS_OFFSET = 16818177,
        DIABOLOS_PRIME_OFFSET = 16818204,
    },
    npc =
    {
        DARKNESS_NAMED_TILE_OFFSET = 16818259, -- _0a0 in npc_list
    },
}

return zones[tpz.zone.THE_SHROUDED_MAW]
