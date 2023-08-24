﻿-----------------------------------
-- Area: Pashhow_Marshlands
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.PASHHOW_MARSHLANDS] =
{
    text =
    {
        NOTHING_HAPPENS          = 141,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6404,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6410,  -- Obtained: <item>.
        GIL_OBTAINED             = 6411,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6413,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST             = 6414,  -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6424,  -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET    = 6439,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS      = 7021, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY  = 7022, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER             = 7023, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE            = 7071,  -- Tallying conquest results...
        BEASTMEN_BANNER          = 7152,  -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET   = 7230,  -- You can't fish here.
        DIG_THROW_AWAY           = 7243,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7245,  -- You dig and you dig, but find nothing.
        PLAYER_OBTAINS_ITEM      = 8457,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8458,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8459,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP     = 8460,  -- You already possess that temporary item.
        NO_COMBINATION           = 8465,  -- You were unable to enter a combination.
        CONQUEST                 = 7919,  -- You've earned conquest points!
        REGIME_REGISTERED        = 10706, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 12817, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        -- Voidwalker
        VOIDWALKER_NO_MOB        = 11825, -- The <abyssite> quivers ever so slightly, but emits no light. There seem to be no monsters in the area.
        VOIDWALKER_MOB_TOO_FAR   = 11826, -- The <abyssite> quivers ever so slightly and emits a faint light. There seem to be no monsters in the immediate vicinity.
        VOIDWALKER_MOB_HINT      = 11827, -- The <abyssite> resonates <hint>, sending a radiant beam of light lancing towards a spot roughly <distance> <direction> of here.
        VOIDWALKER_SPAWN_MOB     = 11828, -- A monster materializes out of nowhere!
        VOIDWALKER_DESPAWN       = 11829, -- The monster fades before your eyes, a look of disappointment on its face.
        VOIDWALKER_UPGRADE_KI_1  = 11830, -- The <current abyssite> takes on a slightly deeper hue and becomes <next abyssite>!
        VOIDWALKER_UPGRADE_KI_2  = 11831, -- The <current abyssite> takes on a deeper, richer hue and becomes <next abyssite>!
        VOIDWALKER_BREAK_KI      = 11832, -- The <abyssite> shatters into tiny fragments.
        VOIDWALKER_OPTAIN_KI     = 11833, -- Obtained key item: ≺abyssite>!
    },
    mob =
    {
        NI_ZHO_BLADEBENDER_PH =
        {
            [17223740] = 17223797, -- -429.953 24.5 -305.450
            [17223789] = 17223797, -- 11.309 23.904 -337.923
        },
        JOLLY_GREEN_PH        =
        {
            [17223888] = 17223889, -- 184.993 24.499 -41.790
        },
        BLOODPOOL_VORAX_PH    =
        {
            [17224014] = 17224019, -- -351.884 24.014 513.531
        },
        BOWHO_WARMONGER       = 17224104,
        VOIDWALKER  =
        {
            [tpz.keyItem.CLEAR_ABYSSITE] = {
                17224184, -- Globster
                17224183, -- Globster
                17224182, -- Globster
                17224181, -- Globster
                17224180,  -- Ground Guzzler
                17224179,  -- Ground Guzzler
                17224178,  -- Ground Guzzler
                17224177,  -- Ground Guzzler
            },
            [tpz.keyItem.COLORFUL_ABYSSITE] = {
                17224176, -- Lamprey Lord
                17224175, -- Shoggoth
            },
            [tpz.keyItem.ORANGE_ABYSSITE] = {
                17224168  -- Blobdingnag
            },
            [tpz.keyItem.BLACK_ABYSSITE] = {
                17224167  -- Yilbegan
            }
        }
    },
    pet = 
    {
        [17224168] = -- Blobdingnag
        {
            17224174,-- Septic Boils
            17224173,-- Septic Boils
            17224172,-- Septic Boils
            17224171,-- Septic Boils
            17224170,-- Septic Boils
            17224169,-- Septic Boils
        },
    },
    npc =
    {
        CASKET_BASE   = 17224275,
        OVERSEER_BASE = 17224326,
    },
}

return zones[tpz.zone.PASHHOW_MARSHLANDS]
