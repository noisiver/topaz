-----------------------------------
-- Area: Sacrarium
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SACRARIUM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6388, -- Obtained: <item>.
        GIL_OBTAINED              = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY   = 6402, -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS       = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY   = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER              = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE             = 7049, -- Tallying conquest results...
        LARGE_KEYHOLE_DESCRIPTION = 7215, -- The gate is securely closed with two locks. This keyhole is engraved with a sealion insignia.
        SMALL_KEYHOLE_DESCRIPTION = 7216, -- The gate is securely closed with two locks. This keyhole is engraved with a coral insignia.
        KEYHOLE_DAMAGED           = 7217, -- The keyhole is damaged.  The gate cannot be opened from this side.
        CANNOT_OPEN_SIDE          = 7218, -- The gate cannot be opened from this side.
        CANNOT_TRADE_NOW          = 7219, -- You cannot trade right now.
        STURDY_GATE               = 7220, -- A sturdy iron gate. It is secured with two locks--a main lock and a sublock.
        CORAL_KEY_BREAKS          = 7224, -- The <item> breaks!
        EVIL_PRESENCE             = 7258, -- You sense an evil presence!
        DRAWER_OPEN               = 7259, -- You open the drawer.
        DRAWER_EMPTY              = 7260, -- There is nothing inside.
        DRAWER_SHUT               = 7261, -- The drawer is jammed shut.
        KEY_ITEM_OBTAINED_CHEST   = 7348, -- <player> obtains a key item, a <key item>, from the chest.
        CHEST_UNLOCKED            = 7350, -- You unlock the chest!
        START_GET_GOOSEBUMPS      = 7360, -- You start to get goosebumps.
        HEART_RACING              = 7361, -- Your heart is racing.
        LEAVE_QUICKLY_AS_POSSIBLE = 7362, -- Your common sense tells you to leave as quickly as possible.
        NOTHING_HAPPENS           = 7365, -- Nothing happens.
        COMMON_SENSE_SURVIVAL     = 7369, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SWIFT_BELT_NMS          =
        {
            {16892068, {[tpz.race.HUME_M]   = true, [tpz.race.HUME_F]   = true}}, -- Balor (hume)
            {16892069, {[tpz.race.ELVAAN_M] = true, [tpz.race.ELVAAN_F] = true}}, -- Luaith (elvaan)
            {16892070, {[tpz.race.TARU_M]   = true, [tpz.race.TARU_F]   = true}}, -- Lobais (tarutaru)
            {16892073, {[tpz.race.MITHRA]   = true}},                             -- Caithleann (mithra)
            {16892074, {[tpz.race.GALKA]    = true}},                             -- Indich (galka)
        },
        OLD_PROFESSOR_MARISELLE = 16891970,
    },
    npc =
    {
        STALE_DRAFT_OFFSET = 16892097,
        LABYRINTH_OFFSET   = 16892110,
        SMALL_KEYHOLE      = 16892142,
        TREASURE_CHEST     = 16892183,
    },
}

return zones[tpz.zone.SACRARIUM]
