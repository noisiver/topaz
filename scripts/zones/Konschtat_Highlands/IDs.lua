﻿-----------------------------------
-- Area: Konschtat_Highlands
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.KONSCHTAT_HIGHLANDS] =
{
    text =
    {
        NOTHING_HAPPENS              = 119,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED      = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388,  -- Obtained: <item>.
        GIL_OBTAINED                 = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY      = 6402,  -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET        = 6417,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS          = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY      = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                 = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CONQUEST_BASE                = 7049,  -- Tallying conquest results...
        ALREADY_OBTAINED_TELE        = 7208,  -- You already possess the gate crystal for this telepoint.
        DIG_THROW_AWAY               = 7225,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                 = 7227,  -- You dig and you dig, but find nothing.
        SIGNPOST3                    = 7383,  -- North: Valkurm Dunes South: North Gustaberg East: Gusgen Mines, Pashhow Marshlands
        SIGNPOST2                    = 7384,  -- North: Pashhow Marshlands West: Valkurm Dunes, North Gustaberg Southeast: Gusgen Mines
        SIGNPOST_DIALOG_1            = 7385,  -- North: Valkurm Dunes South: To Gustaberg
        SIGNPOST_DIALOG_2            = 7386,  -- You see something stuck behind the signpost.
        SOMETHING_BURIED_HERE        = 7387,  -- Something has been buried here.
        TELEPOINT_HAS_BEEN_SHATTERED = 7476,  -- The telepoint has been shattered into a thousand pieces...
        PLAYER_OBTAINS_ITEM          = 7594,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM        = 7595,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM     = 7596,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP         = 7597,  -- You already possess that temporary item.
        NO_COMBINATION               = 7602,  -- You were unable to enter a combination.
        REGIME_REGISTERED            = 9780,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL        = 11906, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        -- Voidwalker
        VOIDWALKER_NO_MOB        = 10953, -- The <abyssite> quivers ever so slightly, but emits no light. There seem to be no monsters in the area.
        VOIDWALKER_MOB_TOO_FAR   = 10954, -- The <abyssite> quivers ever so slightly and emits a faint light. There seem to be no monsters in the immediate vicinity.
        VOIDWALKER_MOB_HINT      = 10955, -- The <abyssite> resonates <hint>, sending a radiant beam of light lancing towards a spot roughly <distance> <direction> of here.
        VOIDWALKER_SPAWN_MOB     = 10956, -- A monster materializes out of nowhere!
        VOIDWALKER_DESPAWN       = 10957, -- The monster fades before your eyes, a look of disappointment on its face.
        VOIDWALKER_UPGRADE_KI_1  = 10958, -- The <current abyssite> takes on a slightly deeper hue and becomes <next abyssite>!
        VOIDWALKER_UPGRADE_KI_2  = 10959, -- The <current abyssite> takes on a deeper, richer hue and becomes <next abyssite>!
        VOIDWALKER_BREAK_KI      = 10960, -- The <abyssite> shatters into tiny fragments.
        VOIDWALKER_OPTAIN_KI     = 10961, -- Obtained key item: ≺abyssite>! 
    },
    mob =
    {
        STRAY_MARY_PH  =
        {
            [17219791] = 17219795, -- -305.204 -11.695 -96.078
            [17219928] = 17219933, -- -293.900  33.393 342.710
        },
        RAMPAGING_RAM_PH =
        {
            [17219885] = 17219886, -- 21 40 514
            [17219987] = 17219886, -- -163.198 62.392 568.282
            [17219886] = 17219887, -- Rampaging can't spawn if Steelfleece is up
        },
        STEELFLEECE_PH =
        {
            [17219885] = 17219887, -- 21 40 514
            [17219886] = 17219887, -- 160 24 121
            [17219987] = 17219887, -- -163.198 62.392 568.282
            [17219887] = 17219886, -- Steelfleece can't spawn if Rampaging is up
        },
        FORGER         = 17219999,
        HATY           = 17220000,
        BENDIGEIT_VRAN = 17220001,
        VOIDWALKER  =
        {
            [tpz.keyItem.CLEAR_ABYSSITE] = {
                17220019, -- Prickly Sheep
                17220018, -- Prickly Sheep
                17220017, -- Prickly Sheep
                17220016, -- Prickly Sheep
                17220015,  -- Void Hare
                17220014,  -- Void Hare
                17220013,  -- Void Hare
                17220012,  -- Void Hare
            },
            [tpz.keyItem.COLORFUL_ABYSSITE] = {
                17220011,  -- Chesma
                17220010, -- Tammuz
            },
            [tpz.keyItem.GREY_ABYSSITE] = {
                17220009  -- Dawon
            },
            [tpz.keyItem.BLACK_ABYSSITE] = {
                17220008  -- Yilbegan
            }
        }
    },
    npc =
    {
        CASKET_BASE = 17220111,
    },
}

return zones[tpz.zone.KONSCHTAT_HIGHLANDS]
