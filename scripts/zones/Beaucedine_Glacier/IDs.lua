﻿-----------------------------------
-- Area: Beaucedine_Glacier
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.BEAUCEDINE_GLACIER] =
{
    text =
    {
        CONQUEST_BASE                   = 0,     -- Tallying conquest results...
        BEASTMEN_BANNER                 = 81,    -- There is a beastmen's banner.
        ITEM_CANNOT_BE_OBTAINED         = 6565,  -- You cannot obtain the item. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE      = 6567,  -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                   = 6569,  -- Obtained: <item>.
        GIL_OBTAINED                    = 6570,  -- Obtained <number> gil.
        KEYITEM_OBTAINED                = 6572,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST                    = 6573,  -- Lost key item: <keyitem>.
        ITEMS_OBTAINED                  = 6578,  -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY         = 6583,  -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET           = 6598,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS             = 7180, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY         = 7181, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                    = 7182, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        FISHING_MESSAGE_OFFSET          = 7230,  -- You can't fish here.
        CONQUEST                        = 7483,  -- You've earned conquest points!
        YOU_CANNOT_ENTER_DYNAMIS        = 7863,  -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL  = 7865,  -- Players who have not reached level <number> are prohibited from entering Dynamis.
        DYNA_NPC_DEFAULT_MESSAGE        = 7875,  -- There is an unusual arrangement of branches here.
        PLAYER_OBTAINS_ITEM             = 8558,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM           = 8559,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM        = 8560,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP            = 8561,  -- You already possess that temporary item.
        NO_COMBINATION                  = 8566,  -- You were unable to enter a combination.
        REGIME_REGISTERED               = 10744, -- New training regime registered!
        COMMON_SENSE_SURVIVAL           = 12770, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        -- Voidwalker
        VOIDWALKER_NO_MOB        = 11863, -- The <abyssite> quivers ever so slightly, but emits no light. There seem to be no monsters in the area.
        VOIDWALKER_MOB_TOO_FAR   = 11864, -- The <abyssite> quivers ever so slightly and emits a faint light. There seem to be no monsters in the immediate vicinity.
        VOIDWALKER_MOB_HINT      = 11865, -- The <abyssite> resonates <hint>, sending a radiant beam of light lancing towards a spot roughly <distance> <direction> of here.
        VOIDWALKER_SPAWN_MOB     = 11866, -- A monster materializes out of nowhere!
        VOIDWALKER_DESPAWN       = 11867, -- The monster fades before your eyes, a look of disappointment on its face.
        VOIDWALKER_UPGRADE_KI_1  = 11868, -- The <current abyssite> takes on a slightly deeper hue and becomes <next abyssite>!
        VOIDWALKER_UPGRADE_KI_2  = 11869, -- The <current abyssite> takes on a deeper, richer hue and becomes <next abyssite>!
        VOIDWALKER_BREAK_KI      = 11870, -- The <abyssite> shatters into tiny fragments.
        VOIDWALKER_OPTAIN_KI     = 11871, -- Obtained key item: ≺abyssite>!    
    },
    mob =
    {
        GARGANTUA_PH =
        {
            [17232078] = 17232079, -- 339 -0.472 -20
        },
        KIRATA_PH    =
        {
            [17232042] = 17232044, -- 75.797 -0.335 -323.659
            [17232043] = 17232044, -- 69.336 -0.234 -276.561
        },
        NUE_PH       =
        {
            [17231969] = 17231971, -- -342.830 -100.584 168.662
            [17231970] = 17231971, -- -322.000 -100.000 116.000
        },
        HUMBABA      = 17232094,
        VOIDWALKER        =
        {
            [tpz.keyItem.CLEAR_ABYSSITE] = {
                17232159, -- Gorehound
                17232158, -- Gorehound
                17232157, -- Gorehound
                17232156, -- Gorehound
                17232155, -- Gjenganger
                17232154, -- Gjenganger
                17232153, -- Gjenganger
                17232152, -- Gjenganger
            },
            [tpz.keyItem.COLORFUL_ABYSSITE] = {
                17232151, -- Erebus
                17232150  -- Feuerunke
            },
            [tpz.keyItem.PURPLE_ABYSSITE] = {
                17232149  -- Lord Ruthven
            },
            [tpz.keyItem.BLACK_ABYSSITE] = {
                17232148  -- Yilbegan
            }
        }
    },
    npc =
    {
        CASKET_BASE     = 17232175,
        MIRROR_POND_J8  = 17232198,
        OVERSEER_BASE   = 17232209,
    },
}

return zones[tpz.zone.BEAUCEDINE_GLACIER]
