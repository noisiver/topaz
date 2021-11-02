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
        BCNM_SEALED             = 7077, -- A fierce column of wind blocks your path. You cannot proceed any further...
        BCNM_CLEARANCE          = 7360, -- Currently, <total> members of your party (including yourself) have clearance to enter the battlefield.
        BCNM_ENTERING           = 7583, -- Entering the battlefield for "<bcnmindex>"!
        CONQUEST_BASE           = 7420, -- Tallying conquest results...
        THE_EXPLOSION           = 7606, -- The explosion has blown you out of the area!
        BEGIN_TO_MELT           = 7663, -- The Snoll Tzar has begun to melt!
        EMIT_STEAM              = 7664, -- The Snoll Tzar is emitting a large amount of steam.
        SHAKES_SALT             = 7665, -- The Snoll Tzar shakes off the salt!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.BEARCLAW_PINNACLE]
