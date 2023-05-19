-----------------------------------
-- Area: Navukgo_Execution_Chamber
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.NAVUKGO_EXECUTION_CHAMBER] =
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
        SHAMARHAAN_LET_US_BEGIN = 7613, -- Let us begin.
        SHAMARHAAN_DO_NOT_UNDERESTIMATE = 7614, -- Do not underestimate my automaton's power!
        SHAMARHAAN_NOT_READY    = 7615, -- Unfortunately, it looks like you are still not ready yet...
        SHAMARHAAN_MAGNIFICENT  = 7616, -- Magnificent work...
        SHAMARHAAN_TRICKS       = 7617, -- I've got a few tricks up my own sleeve!
        SHAMARHAAN_LETS_TRY     = 7618, -- Hmm... Let's try this one...
        SHAMARHAAN_FULL_STEAM   = 7619, -- Full steam ahead!
        SHAMARHAAN_NO_DESIRE    = 7620, -- Enough. I have no desire to watch this foolishness all day.
        SHAMARHAAN_UNDERESTIMATED = 7621, -- It looks like I underestimated you!
        SHAMARHAAN_AUTOMATON    = 7622, -- My automaton! Amazing...
        LEVEL_LIMIT_75          = 7623, -- Your level limit is now 75.
        OHOHOHO                 = 7627, -- Ohohoho! Ohohoho! Ohohoho!!!
        KARABABA_ENOUGH         = 7629, -- That's quite enough...
        KARABABA_ROUGH          = 7630, -- Time for me to start playing rough!
        KARABARA_FIRE           = 7631, -- Fuel for the fire! It doesn't pay to invoke my ire!
        KARABARA_ICE            = 7632, -- Well, if you won't play nice, I'll put your sorry hide on ice!
        KARABARA_WIND           = 7633, -- This battle is growing stale. How about we have a refreshing gale!
        KARABARA_EARTH          = 7634, -- Sometimes it comes as quite a shock, how much damage you can deal with simple rock!
        KARABARA_LIGHTNING      = 7635, -- How I love to rip things asunder! Witness the power of lightning and thunder!
        KARABARA_WATER          = 7636, -- Water is more dangerous than most expect. Never fear, I'll teach you respect!
        KARABABA_QUIT           = 7644, -- What a completely useless shield. It's time for me to quit the field.
        LOSER                   = 7645, -- You Loser... I wont forget this day...
        RAGGED_BREATH           = 7650, -- The khimera's breathing has grown ragged
        KHIMERA_RECOVERED       = 7651, -- The khimera has recovered
        BCNM_SEALED             = 7254, -- The door is locked.
        BCNM_TESTIMONY          = 7272, -- Your <item> is torn...
        BCNM_CLEARANCE          = 7520, -- Currently, <total> members of your party (including yourself) have clearance to enter the battlefield.
        BCNM_ENTERING           = 7584, -- Entering the battlefield for "<bcnmindex>"!
    },
    mob =
    {
        KARABABA_OFFSET = 17039401,
        IMMORTAL_FLAN2  = 17039375, -- IMMORTAL_FLAN1 always pops in battlefield, other flans pop depending on party size
        IMMORTAL_FLAN3  = 17039376,
        IMMORTAL_FLAN4  = 17039377,
        IMMORTAL_FLAN5  = 17039378,
        IMMORTAL_FLAN6  = 17039379,
    },
    npc =
    {
    },
}

return zones[tpz.zone.NAVUKGO_EXECUTION_CHAMBER]
