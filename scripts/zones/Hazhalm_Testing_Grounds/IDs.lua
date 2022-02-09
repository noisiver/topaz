-----------------------------------
-- Area: Hazhalm_Testing_Grounds
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.HAZHALM_TESTING_GROUNDS] =
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
    },
    mob =
    {
        [1] =
        {
            { 17096730, 17096741 }, -- Dark_Elemental
            { 17096742, 17096753 }, -- Rotting_Huskarl (WAR)
            { 17096766, 17096777 }, -- Craven_Einherjar (Ghost)
            { 17096778, 17096789 }, -- Hyndla
            { 17096790, 17096795 }, -- Nickur
            { 17096796, 17096807 }, -- Hazhalm_Bat
            { 17096808, 17096819 }, -- Hazhalm_Bats
            { 17096754, 17096765 }, -- Rotting_Huskarl (BLM)
            { 17097078, 17097089 }, -- Chigoe
            { 17097102, 17097113 }, -- Logi
            { 17097126, 17097131 }, -- Infected_Wamoura
            { 17097132, 17097143 }, -- Sjokrakjen
            { 17097144, 17097155 }, -- Einherjar_Eater
            { 17097210, 17097215 }, -- Bugard-X
        },
        [2] =
        {
            { 17096916, 17096927 }, -- Battlemite
            { 17097054, 17097065 }, -- Corrupt_Einherjar
            { 17096880, 17096891 }, -- Craven_Einherjar (Bhoot)
            { 17096832, 17096843 }, -- Einherjar_Brei
            { 17097144, 17097155 }, -- Einherjar_Eater t1
            { 17097114, 17097125 }, -- Flames_of_Muspelheim
            { 17096820, 17096831 }, -- Gardsvor
            { 17096796, 17096807 }, -- Hazhalm_Bat t1
            { 17096808, 17096819 }, -- Hazhalm_Bats t1
            { 17096844, 17096855 }, -- Hazhalm_Leech
            { 17096904, 17096915 }, -- Odin\'s_Fool
            { 17096892, 17096903 }, -- Rotting_Huskarl (DRK)
            { 17097072, 17097077 }, -- Ormr
            { 17097132, 17097143 }, -- Sjokrakjen t1
            { 17096928, 17096939 }, -- Utgarth_Bat
            { 17096940, 17096951 }, -- Utgarth_Bats
            { 17096952, 17096963 }, -- Utgarth_Leech
            { 17096868, 17096879 }, -- Waldgeist
            { 17096856, 17096867 }, -- Winebibber
        },
        [3] =
        {
            { 17097000, 17097005 }, -- Audhumbla
            { 17097018, 17097029 }, -- Berserkr
            { 17097054, 17097065 }, -- Corrupt_Einherjar t2
            { 17097090, 17097101 }, -- Djigga
            { 17096964, 17096975 }, -- Experimental_Poroggo
            { 17097114, 17097125 }, -- Flames_of_Muspelheim t2
            { 17097156, 17097161 }, -- Hafgygr
            { 17097186, 17097197 }, -- Idun
            { 17097126, 17097131 }, -- Infected_Wamoura t1
            { 17096976, 17096987 }, -- Liquified_Einherjar
            { 17097102, 17097113 }, -- Logi t1
            { 17097066, 17097071 }, -- Manticore-X
            { 17097030, 17097041 }, -- Margygr
            { 17097006, 17097011 }, -- Marid-X
            { 17097042, 17097053 }, -- Odin\'s_Jester
            { 17096988, 17096999 }, -- Soulflayer
            { 17096928, 17096939 }, -- Utgarth_Bat t2
            { 17096940, 17096951 }, -- Utgarth_Bats t2
            { 17097198, 17097209 }, -- Vanquished_Einherjar
            { 17097012, 17097017 }, -- Wivre-X
        },
        [4] = { 17096711, 17096717 }, -- T1 Bosses
        [5] = { 17096717, 17096723 }, -- T2 Bosses
        [6] = { 17096724, 17096729 }, -- T3 Bosses
    },
    npc =
    {
    },
}

return zones[tpz.zone.HAZHALM_TESTING_GROUNDS]
