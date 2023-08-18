-----------------------------------
-- Area: Halvung
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.HALVUNG] =
{
    text =
    {
        NOTHING_HAPPENS         = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        GATE_FIRMLY_CLOSED      = 7208, -- The gate is firmly closed...
        NO_NEED_TO_USE_KEY      = 7362, -- There is no need to use the key right now...
        GURFURLUR_DOOR_LOCKED   = 7900, -- There is a wide trench around the gate here. There are three keyholes of differing sizes inside the trench.
        GURFURLUR_DOOR_KEYS     = 7901, -- The <key> shatters... The <key> shatters... The <key> shatters...
        MINING_IS_POSSIBLE_HERE = 7923, -- Mining is possible here if you have <item>.
        BLUE_FLAMES             = 7962, -- You can see blue flames flickering from a hole in the ground here...
        OPERATING_LEVER_START   = 7895, -- <player> begins pushing on the lever!
        OPERATING_LEVER_FAIL    = 7898, -- <player> releases the lever.
        OPERATING_LEVER_SUCCESS = 8041, -- You lift the lever with all your might!
		CARRIED_OVER_POINTS     = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MINING_IS_POSSIBLE_HERE = 7924, -- Mining is possible here if you have <item>.
        BLUE_FLAMES             = 7963, -- You can see blue flames flickering from a hole in the ground here...
        COMMON_SENSE_SURVIVAL   = 8102, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        BIG_BOMB               = 17031401,
        GURFURLUR_THE_MENACING = 17031592,
        DEXTROSE               = 17031598,
        REACTON                = 17031599,
        ACHAMOTH               = 17031600,
        EVOLVING_WAMOURA_PRINCES =
        {
            17031334, 
            17031336,
            17031338,
            17031341,
        },
    },
    npc =
    {
        MINING =
        {
            17031715,
            17031716,
            17031717,
            17031718,
            17031719,
            17031720,
        },
    },
    item =
    {
        HALVUNG_SHAKUDO_KEY = 2221,
        HALVUNG_BRONZE_KEY = 2222,
        HALVUNG_BRASS_KEY = 2223,
    }
}

return zones[tpz.zone.HALVUNG]
