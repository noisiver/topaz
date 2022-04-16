-----------------------------------
-- Area: Bearclaw_Pinnacle
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.BEARCLAW_PINNACLE] =
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
        ORB_MESSAGE_OFFSET      = 7364, -- There is a crack in the <item>. It no longer contains a monster.
        CONQUEST_BASE           = 7421, -- Tallying conquest results...
        BLOWN_AWAY              = 7607, -- Blown out of area
        BEGINS_TO_MELT          = 7664, -- Begings to Melt
        LARGE_STEAM             = 7665, -- Emitting a large amount of steam
        SHOOK_SALT              = 7666, -- Shook off the salt
        HAS_INDIGESTION         = 7667, -- The Bearclaw Rabbit appears to have indigestion!
        HOPPING_MADLY           = 7668, -- The Bearclaw Rabbit begins hopping madly!
        MORNING_MIST            = 7669, -- The Bearclaw Leveret fades like morning mist....
        BAD                     = 7670, -- You feel something bad is about to happen....
        REALLY_BAD              = 7671, -- You feel something really bad is about to happen....
        HORIFFIC                = 7672, -- You feel something horrific is about to happen...!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.BEARCLAW_PINNACLE]
