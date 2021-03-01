-----------------------------------
-- Area: Monarch_Linn
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.MONARCH_LINN] =
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
        GLOWING_MIST            = 7126, -- A glowing mist of ever-changing proportions floats before you...
        CONQUEST_BASE           = 7462, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
    },
    fireInTheSky = {
        [1] = {
            RAZON_ID        = 16904211,
        },
        [2] = {
            RAZON_ID        = 16904213,
        },
        [3] = {
            RAZON_ID        = 16904215,
        },
    },
        badSeed = {
        [1] = {
            HAMADRYAD_ID        = 16904205,
        },
        [2] = {
            HAMADRYAD_ID        = 16904207,
        },
        [3] = {
            HAMADRYAD_ID        = 16904209,
        },
    },
        bugardInTheClouds = {
        [1] = {
            HOTUPUKU_ID        = 16904226,
        },
        [2] = {
            HOTUPUKU_ID        = 16904228,
        },
        [3] = {
            HOTUPUKU_ID        = 16904230,
        },
    },
        belovedOfTheAtlante = {
        [1] = {
            WATCH_HIPPOGRYPH_ID        = 16904217,
            GUARD_HIPPOGRYPH_ID        = 16904218,
            GUARD_HIPPOGRYPH_ID        = 16904219,
        },
        [2] = {
            WATCH_HIPPOGRYPH_ID        = 16904220,
            GUARD_HIPPOGRYPH_ID        = 16904221,
            GUARD_HIPPOGRYPH_ID        = 16904222,
        },
        [3] = {
            WATCH_HIPPOGRYPH_ID        = 16904223,
            GUARD_HIPPOGRYPH_ID        = 16904224,
            GUARD_HIPPOGRYPH_ID        = 16904225,
        },
    },
}

return zones[tpz.zone.MONARCH_LINN]
