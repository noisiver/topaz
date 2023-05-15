-----------------------------------
-- Area: Talacca_Cove
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.TALACCA_COVE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED      = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388, -- Obtained: <item>.
        GIL_OBTAINED                 = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS          = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY      = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                 = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        FISHING_MESSAGE_OFFSET       = 7049, -- You can't fish here.
        YOU_CAN_NOW_BECOME_A_CORSAIR = 7782, -- You can now become a corsair!
        QULTADA_CARDS_BEEN_DEALT     = 7835, -- The cards have been dealt. Now let us begin our little gamble of luck and skill.
        QULTADA_NEED_NOT_EASY_ON_ME  = 7836, -- You need not go easy on me... I certainly will not go easy on you.
        QULTADA_QUICK_START          = 7837, -- Oho... That was a quick start.
        QULTADA_DENT_MY_TRICORNE     = 7838, -- You could not put a dent in my tricorne with attacks like that. Better luck next time.
        QULTADA_NOT_BAD              = 7839, -- Not bad...
        QULTADA_ANTE_UP              = 7840, -- Ante up!
        QULTADA_LETS_TRY_YOUR_LUCK   = 7841, -- Let's try your luck!
        QULTADA_THINK_YOU_CAN        = 7842, -- Think you can get away?
        QULTADA_BEHOLD_MY_TRUMP_CARD = 7843, -- Behold my trump card... Time for you to fold!
        QULTADA_TOO_BAD              = 7844, -- Too bad. I was hoping for a bit more excitement.
        QULTADA_LADY_DESTINY         = 7845, -- Does Lady Destiny smile upon you today? Or is it merely Fate's mocking grin? Now is the time to offer your prayers!
        QULTADA_LUCK_OF_CORSAIR      = 7846, -- The luck of the corsair is a wonderful thing!
        QULTADA_LADY_LUCK_STAY       = 7847, -- Ha! Lady Luck, stay with me!
        QULTADA_LUCK_WOULD_HAVE_IT   = 7848, -- As luck would have it...
        QULTADA_LUCK_DO_NOT_FAIL     = 7849, -- Luck, do not fail me again...
        QULTADA_CHIPS_ARE_DOWN       = 7850, -- Sometimes the chips are down...
        QULTADA_THINGS_HEAT_UP       = 7851, -- Looks like things are beginning to heat up!
        LEVEL_LIMIT_75               = 7852, -- Your level limit is now 75.
        DAMAGE_FROM_MELEE_FRAME      = 7853, -- Damage from melee attacks... Changing frame...
        DAMAGE_FROM_RANGED_FRAME     = 7854, -- Damage from ranged attacks... Changing frame...
        DAMAGE_FROM_MAGIC_FRAME      = 7855, -- Damage from magic... Changing frame...
        DAMAGE_FROM_MELEE_MANEUVER   = 7856, -- Damage from melee attacks... Executing maneuver...
        DAMAGE_FROM_RANGED_MANEUVER  = 7857, -- Damage from ranged attacks... Executing maneuver...
        DAMAGE_FROM_MAGIC_MANEUVER   = 7858, -- Damage from magic... Executing maneuver...
        BCNM_SEALED                  = 7351, -- It appears as if something had been thrust into the rockface here...
        BCNM_TESTIMONY               = 7371, -- Your <item> is torn...
        BCNM_CLEARANCE               = 7619, -- Currently, <total> members of your party (including yourself) have clearance to enter the battlefield.
        BCNM_ENTERING                = 7683, -- Entering the battlefield for "<bcnmindex>"!
    },
    mob =
    {
        GESSHO = 17010725,
    },
    npc =
    {
    },
}

return zones[tpz.zone.TALACCA_COVE]
