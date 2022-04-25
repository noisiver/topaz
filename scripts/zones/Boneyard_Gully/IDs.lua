-----------------------------------
-- Area: Boneyard_Gully
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.BONEYARD_GULLY] = {
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        BCNM_SEALED             = 7078, -- An ominous veil of pitch-black gas blocks your path. You cannot proceed any further...
        CONQUEST_BASE           = 7420, -- Tallying conquest results...
        BCNM_CLEARANCE          = 7360, -- Currently, <total> members of your party (including yourself) have clearance to enter the battlefield.
        BCNM_ENTERING           = 7583, -- Entering the battlefield for "<bcnmindex>"!
        WE_ARE_TRACKERS         = 7703, -- We are the Mithran Trackers!
        HOW_IS_THIS_POSSIBLE    = 7704, -- H-how...is this possible...?
        ENOUGH_TIME             = 7705, -- Enough time has been wasted! (Z, ready)
        FOLLOW_MY_LEAD          = 7706, -- Follow my lead! (Z, begin)
        TIME_TO_DIE             = 7707, -- Time to die! (Z, mid)
        YOUR_SINS               = 7708, -- Your sins will be judged! (Z, end)
        THAT_SCENT              = 7709, -- That...that scent...
        TAKE_ME_FOR_A_FOOL      = 7710, -- Do you take me for a fool?
        CANT_HAVE_LOST          = 7715, -- I...I can't have lost...
        READY_TO_REAP           = 7716, -- Ready to rrrreap! (Y, ready)
        MASSACRRRE_BEGIN        = 7717, -- Let the massacrrre begin! (Y, begin)
        JUST_FOR_YOU            = 7718, -- Just for you, sugarplum! (Y, mid)
        IN_YOUR_EYE             = 7719, -- In your eye, honeycakes! (Y, end)
        DEFEATED                = 7726, -- Defeated...on my...first hunt...
        READY_TO_RUMBLE         = 7727, -- Ready to rrrumble! (X, ready)
        TIME_TO_HUNT            = 7728, -- Mithran Trackers! Time to hunt! (X, begin)
        MY_TURN_MY_TURN         = 7729, -- My turn! My turn! (X, mid)
        YOURE_MINE              = 7730, -- You're mine! (X, end)
        -- 7731-7737 more Sin Hunters speaking
        RETREATS_SOIL           = 7740, -- The Tuchulcha retreats beeanth the soil!
        GIANT_ANTLION           = 7741, -- A giant antlion appears! This one may be carrying an armoury crate!
        ANTLION_ESCAPED         = 7742, -- It's the antlion that escaped earlier!
        SMALL_ANTLION           = 7743, -- A small antlion appears! It doesn't seem large enough to carry an armoury crate.
        TUCHULCHA_DEATH         = 7744, -- Tuchulcha drops an armoury crate!
        -- 7746 - 7753 more Sin Hunters speaking
    },
    mob =
    {
    },
    npc =
    {
    },
    sheepInAntlionsClothing = {
        [1] = {
            TUCHULCHA_ID      = 16810001,
            SWIFT_HUNTER_ID   = 16810002,
            SHREWD_HUNTER_ID  = 16810003,
            ARMORED_HUNTER_ID = 16810004,
            -- List of positions used to set
            -- 	(1) Tuchulcha's location after using sand pit
            -- 	(2) The starting position of the hunters
            ant_positions = {
                { -517, 1.8, -521, 171 },
                { -534, 1.8, -460, 171 },
                { -552, 4.0, -440, 171 },
                { -572, -1.8, -464, 171 },
                { -573, 4.0, -427, 171 },
                { -562, 1.8, -484, 171 },
                { -593, 1.8, -480, 171 },
            },
        },
        [2] = {
            TUCHULCHA_ID      = 16810007,
            SWIFT_HUNTER_ID   = 16810008,
            SHREWD_HUNTER_ID  = 16810009,
            ARMORED_HUNTER_ID = 16810010,
            ant_positions = {
                { 43, 1.8, 40, 7 },
                { 26, 1.8, 100, 7 },
                { 7, 4.0, 118, 7 },
                { -13, -1.8, 95, 7 },
                { -13, 4.0, 133, 7 },
                { -2.3, 1.8, 76, 7 },
                { -33, 1.8, 79, 7 },
            },
        },
        [3] = {
            TUCHULCHA_ID      = 16810013,
            SWIFT_HUNTER_ID   = 16810014,
            SHREWD_HUNTER_ID  = 16810015,
            ARMORED_HUNTER_ID = 16810016,
            ant_positions = {
                { 522, 1.8, 521, 240 },
                { 506, 1.8, 580, 240 },
                { 466, 4.0, 614, 240 },
                { 467, -1.8, 574, 240 },
                { 488, 4.0, 598, 240 },
                { 478, 1.8, 557, 240 },
                { 446, 1.8, 558, 240 },
            },
        },
    },
    shellWeDance = {
        [1] = {
            PARATA_ID        = 16810024,
            BLADMALL_ID      = 16810025,
            PARATA_PET_IDS   = { 16810026, 16810027, 16810028 },
            BLADMALL_PET_IDS = { 16810029, 16810030, 16810031 },
        },
        [2] = {
            PARATA_ID        = 16810033,
            BLADMALL_ID      = 16810034,
            PARATA_PET_IDS   = { 16810035, 16810036, 16810037 },
            BLADMALL_PET_IDS = { 16810038, 16810039, 16810040 },
        },
        [3] = {
            PARATA_ID        = 16810042,
            BLADMALL_ID      = 16810043,
            PARATA_PET_IDS   = { 16810044, 16810045, 16810046 },
            BLADMALL_PET_IDS = { 16810047, 16810048, 16810049 },
        },
    },
}

return zones[tpz.zone.BONEYARD_GULLY]
