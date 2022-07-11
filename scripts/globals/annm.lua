-----------------------------------
--
--  ANNM(Allied Notes Notorious Monster) utilities
--
-- TODO: This system is used to rank up in campaign
-- TODO: finish loot tables(not weapons/gear) and give proper drop %'s on valuables and stuff
-- TODO: Finish NMMods
-- TODO: Finish PetMods
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("scripts/globals/zone")
require("scripts/globals/keyitems")
require("scripts/globals/items")
require("scripts/globals/augments")
-----------------------------------

tpz = tpz or {}
tpz.annm = tpz.annm or {}
tpz.annm.augment = tpz.annm.augment or {}

local ore =
{
    tpz.items.CHUNK_OF_COPPER_ORE, tpz.items.CHUNK_OF_TIN_ORE, tpz.items.CHUNK_OF_ZINC_ORE, tpz.items.CHUNK_OF_SILVER_ORE,
    tpz.items.CHUNK_OF_IRON_ORE, tpz.items.CHUNK_OF_MYTHRIL_ORE, tpz.items.CHUNK_OF_GOLD_ORE, tpz.items.CHUNK_OF_GOLD_ORE,
    tpz.items.CHUNK_OF_DARKSTEEL_ORE,tpz.items.CHUNK_OF_ADAMAN_ORE
}
local log =
{
    tpz.items.ARROWWOOD_LOG, tpz.items.LAUAN_LOG, tpz.items.ELM_LOG, tpz.items.MAPLE_LOG, tpz.items.BEECH_LOG,
    tpz.items.WALNUT_LOG, tpz.items.CHESTNUT_LOG, tpz.items.WILLOW_LOG, tpz.items.YEW_LOG, tpz.items.HOLLY_LOG,
    tpz.items.OAK_LOG, tpz.items.MAHOGANY_LOG, tpz.items.ROSEWOOD_LOG, tpz.items.EBONY_LOG, tpz.items.PETRIFIED_LOG
}
local thread =
{
    tpz.items.SPOOL_OF_SILK_THREAD, tpz.items.SPOOL_OF_GRASS_THREAD, tpz.items.SPOOL_OF_COTTON_THREAD, tpz.items.SPOOL_OF_LINEN_THREAD,
    tpz.items.SPOOL_OF_WOOL_THREAD, tpz.items.SPOOL_OF_RAINBOW_THREAD, tpz.items.SPOOL_OF_SILVER_THREAD, tpz.items.SPOOL_OF_GOLD_THREAD,
    tpz.items.YOICHIS_SASH
}
local leather =
{
    tpz.items.SQUARE_OF_SHEEP_LEATHER, tpz.items.SQUARE_OF_DHALMEL_LEATHER, tpz.items.SQUARE_OF_RAM_LEATHER,
    tpz.items.SQUARE_OF_BLACK_TIGER_LEATHER, tpz.items.UNDEAD_SKIN, tpz.items.RAPTOR_SKIN, tpz.items.COCKATRICE_SKIN,
    tpz.items.SQUARE_OF_MANTICORE_LEATHER, tpz.items.SQUARE_OF_COEURL_LEATHER
}
local gem =
{
    tpz.items.EMERALD, tpz.items.RUBY, tpz.items.DIAMOND, tpz.items.PERIDOT, tpz.items.TOPAZ, tpz.items.GARNET, tpz.items.AQUAMARINE,
    tpz.items.PEARL, tpz.items.BLACK_PEARL, tpz.items.SAPPHIRE, tpz.items.LAPIS_LAZULI, tpz.items.LIGHT_OPAL, tpz.items.PAINITE,
    tpz.items.TURQUOISE, tpz.items.ONYX, tpz.items.AMETHYST, tpz.items.CHRYSOBERYL, tpz.items.MOONSTONE, tpz.items.SUNSTONE,
    tpz.items.SPINEL, tpz.items.ZIRCON, tpz.items.TOURMALINE, tpz.items.SARDONYX, tpz.items.GOSHENITE, tpz.items.CLEAR_TOPAZ,
    tpz.items.FLUORITE, tpz.items.AMETRINE, tpz.items.JADEITE
}
local food =
{
    tpz.items.BOWL_OF_DRAGON_SOUP, tpz.items.DRAGON_STEAK, tpz.items.HELLSTEAK, tpz.items.DISH_OF_HYDRA_KOFTE,
    tpz.items.SERVING_OF_RED_CURRY, tpz.items.SERVING_OF_CRIMSON_JELLY, tpz.items.GOBLIN_MUSHPOT
}
local junk =
{
    tpz.items.SLAB_OF_TUFA, tpz.items.PIECE_OF_OXBLOOD, tpz.items.PIECE_OF_ANGEL_SKIN, tpz.items.LOCK_OF_SIRENS_HAIR,
    tpz.items.VIAL_OF_BLACK_BEETLE_BLOOD
    --TODO: More useless items or rename to high quality and make low chance of giving one(~20%?)
}
local valuable =
{
    tpz.items.IMPERIAL_WOOTZ_INGOT, tpz.items.DAMASCUS_INGOT, tpz.items.STAR_SAPPHIRE
}
local chests =
{
    { tpz.zone.EAST_RONFAURE_S, 17109730 },
    { tpz.zone.JUGNER_FOREST_S, 17113839 },
    { tpz.zone.VUNKERL_INLET_S, 17117904 },
    { tpz.zone.BATALLIA_DOWNS_S, 17122062 },
    { tpz.zone.NORTH_GUSTABERG_S, 17138421 },
    { tpz.zone.GRAUBERG_S, 17142463 },
    { tpz.zone.PASHHOW_MARSHLANDS_S, 17146522 },
    { tpz.zone.ROLANBERRY_FIELDS_S, 17150680 },
    { tpz.zone.WEST_SARUTABARUTA_S, 17167125 },
    { tpz.zone.FORT_KARUGO_NARUGO_S, 17171015 },
    { tpz.zone.MERIPHATAUD_MOUNTAINS_S, 17175262 },
    { tpz.zone.SAUROMUGUE_CHAMPAIGN_S, 17179275 },
    { tpz.zone.GARLAIGE_CITADEL_S, 17335171 }, 
    { tpz.zone.CRAWLERS_NEST_S, 17339267 },
    { tpz.zone.THE_ELDIEME_NECROPOLIS_S, 17339267 },
}
-- New system for agumenting below
tpz.annm.augment[tpz.items.HEAVY_CROSSBOW] =
{
    {
        stat = tpz.augments.RACC, 
        chance = 100, 
        minimum = 0,
        maximum = 9
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.AGI, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.SNAP_SHOT,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.CRITHITRATE,
        chance = 10,
        minimum = 0,
        maximum = 1
    },
}
tpz.annm.augment[tpz.items.DARKSTEEL_MUFFLERS] =
{
    {
        stat = tpz.augments.MP, 
        chance = 100,
        minimum = 13,
        maximum = 25
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DOUBLE_ATTACK,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.CRITHITRATE,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.SCORPION_SUBLIGAR] =
{
    {
        stat = tpz.augments.ATTK, 
        chance = 100, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.CRITHITRATE,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}

tpz.annm.augment[tpz.items.EBONY_WAND] =
{
    {
        stat = tpz.augments.MP, 
        chance = 100, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.INT, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MND, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.REFRESH,
        chance = 10,
        minimum = 0,
        maximum = 0
    },
    {
        stat = tpz.augments.PET_ATTK_RATTK,
        chance = 10,
        minimum = 0,
        maximum = 5
    },
}
tpz.annm.augment[tpz.items.SILK_CLOAK] =
{
    {
        stat = tpz.augments.MP,
        chance = 100, 
        minimum = 15,
        maximum = 29
    },
    {
        stat = tpz.augments.INT,
        chance = 30,
        minimum = 0,
        maximum = 12
    },
    {
        stat = tpz.augments.MND,
        chance = 30,
        minimum = 0,
        maximum = 12
    },
    {
        stat = tpz.augments.CHR,
        chance = 30,
        minimum = 0,
        maximum = 12
    },
    {
        stat = tpz.augments.MACC,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.FASTCAST,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.CORAL_HAIRPIN] =
{
    {
        stat = tpz.augments.MP,
        chance = 100, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.INT,
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MND,
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.CHR,
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MACC,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.CURE_POTENCY,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}

tpz.annm.augment[tpz.items.KABUTOWARI] =
{
    {
        stat = tpz.augments.MAIN_DMG_RATING, 
        chance = 100, 
        minimum = 6,
        maximum = 12
    },
    {
        stat = tpz.augments.DELAYMINUS, 
        chance = 30, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.ATTK,
        chance = 10,
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
}
tpz.annm.augment[tpz.items.BATTLE_BOOTS] =
{
    {
        stat = tpz.augments.WSACC, 
        chance = 100, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.DOUBLE_ATTACK,
        chance = 10,
        minimum = 0,
        maximum = 1
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.BEAK_JERKIN] =
{
    {
        stat = tpz.augments.DOUBLE_ATTACK, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.WSACC, 
        chance = 30,
        minimum = 10,
        maximum = 15
    },
    {
        stat = tpz.augments.ZANSHIN,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.NINJATOOLEXPERTISE,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.NAGAN] =
{
    {
        stat = tpz.augments.MAIN_DMG_RATING, 
        chance = 100, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DELAYMINUS, 
        chance = 30, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
    {
        stat = tpz.augments.PDT,
        chance = 10,
        minimum = 0,
        maximum = 3
    },
}
tpz.annm.augment[tpz.items.BATTLE_JUPON] =
{
    {
        stat = tpz.augments.ATTK, 
        chance = 100, 
        minimum = 0,
        maximum = 14
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DUAL_WIELD, 
        chance = 30,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.CRITHITRATE,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.SILK_SLACKS] =
{
    {
        stat = tpz.augments.ATTK_RATTK, 
        chance = 100, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.ACC_RACC, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.RAPID_SHOT, 
        chance = 30,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.ENMITYMINUS,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.RECYCLE,
        chance = 10,
        minimum = 4,
        maximum = 9
    },
}
tpz.annm.augment[tpz.items.HEXAGUN] =
{
    {
        stat = tpz.augments.RANGED_DMG_RATING, 
        chance = 100, 
        minimum = 6,
        maximum = 11
    },
    {
        stat = tpz.augments.RANGED_DELAYMINUS, 
        chance = 30, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.AGI, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MATT,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
}
tpz.annm.augment[tpz.items.TIGER_MASK] =
{
    {
        stat = tpz.augments.WSACC, 
        chance = 100, 
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.ATTK,
        chance = 10,
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.CRITHITRATE,
        chance = 10,
        minimum = 0,
        maximum = 1
    },
}
tpz.annm.augment[tpz.items.COEURL_LEDELSENS] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 1
    },
    {
        stat = tpz.augments.ATTK, 
        chance = 30,
        minimum = 3,
        maximum = 5
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.ACC,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.KAZARIDACHI] =
{
    {
        stat = tpz.augments.MAIN_DMG_RATING, 
        chance = 100, 
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.DELAYMINUS, 
        chance = 30, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.DARKSTEEL_HARNESS] =
{
    {
        stat = tpz.augments.HP, 
        chance = 100, 
        minimum = 14,
        maximum = 29
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.DEF, 
        chance = 30,
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.ENEMY_CRITHITRATEMINUS,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.ENMITY,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.SILK_MITTS] =
{
    {
        stat = tpz.augments.WSACC, 
        chance = 100, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.ATTK,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.CRITHITRATE,
        chance = 10,
        minimum = 0,
        maximum = 1
    },
}
tpz.annm.augment[tpz.items.MANOPLES] = 
{
    {
        stat = tpz.augments.DELAYMINUS, 
        chance = 100, 
        minimum = 18,
        maximum = 24
    },
    {
        stat = tpz.augments.MAIN_DMG_RATING,
        chance = 30, 
        minimum = 0,
        maximum = 1
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
    {
        stat = tpz.augments.COUNTER,
        chance = 10,
        minimum = 1,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.RASETSU_SUNE_ATE] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 1
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.FASTCAST,
        chance = 10,
        minimum = 1,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.YASHA_SAMUE] =
{
    {
        stat = tpz.augments.MATT, 
        chance = 100, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MACC, 
        chance = 30,
        minimum = 0,
        maximum = 5
    },
    {
        stat = tpz.augments.MDEF, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.NINJUTSU,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.NTE,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.GULLY] =
{
    {
        stat = tpz.augments.MAIN_DMG_RATING, 
        chance = 100, 
        minimum = 4,
        maximum = 7
    },
    {
        stat = tpz.augments.DELAYMINUS, 
        chance = 30, 
        minimum = 0,
        maximum = 8
    },
    {
        stat = tpz.augments.ATTK,
        chance = 30,
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
    {
        stat = tpz.augments.ACC,
        chance = 10,
        minimum = 0,
        maximum = 3
    },
}
tpz.annm.augment[tpz.items.BARONE_MANOPOLAS] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 5
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 5
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.POLEARM,
        chance = 10,
        minimum = 0,
        maximum = 8
    },
}
tpz.annm.augment[tpz.items.PANTHER_MASK] =
{
    {
        stat = tpz.augments.ACC, 
        chance = 100, 
        minimum = 0,
        maximum = 7
    },
    {
        stat = tpz.augments.ATTK, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 3
    },
}
tpz.annm.augment[tpz.items.GENDAWA] =
{
    {
        stat = tpz.augments.RANGED_DMG_RATING, 
        chance = 100, 
        minimum = 8,
        maximum = 15
    },
    {
        stat = tpz.augments.RANGED_DELAYMINUS, 
        chance = 30, 
        minimum = 0,
        maximum = 7
    },
    {
        stat = tpz.augments.RATTK, 
        chance = 30,
        minimum = 13,
        maximum = 25
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
    {
        stat = tpz.augments.SNAP_SHOT,
        chance = 10,
        minimum = 0,
        maximum = 3
    },
}
tpz.annm.augment[tpz.items.ADAMAN_CUIRASS] =
{
    {
        stat = tpz.augments.SHIELD, 
        chance = 100, 
        minimum = 4,
        maximum = 7
    },
    {
        stat = tpz.augments.HP, 
        chance = 30,
        minimum = 12,
        maximum = 24
    },
    {
        stat = tpz.augments.DEF, 
        chance = 30,
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.SPELLINTERRUPT,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.REGEN,
        chance = 10,
        minimum = 0,
        maximum = 0
    },
}
tpz.annm.augment[tpz.items.PLATINUM_BANGLES] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.ATTK, 
        chance = 30,
        minimum = 4,
        maximum = 7
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.CRITHITRATE,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.BHUJ] =
{
    {
        stat = tpz.augments.MDT, 
        chance = 100, 
        minimum = 2,
        maximum = 4
    },
    {
        stat = tpz.augments.COUNTER, 
        chance = 30, 
        minimum = 3,
        maximum = 4
    },
    {
        stat = tpz.augments.BDT, 
        chance = 30,
        minimum = 3,
        maximum = 4
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
    {
        stat = tpz.augments.MAIN_DMG_RATING,
        chance = 10,
        minimum = 0,
        maximum = 1
    },
}
tpz.annm.augment[tpz.items.ADAMAN_CUISSES] = 
{
    {
        stat = tpz.augments.COUNTER, 
        chance = 100, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.EARTHRES, 
        chance = 30,
        minimum = 10,
        maximum = 19
    },
    {
        stat = tpz.augments.HP, 
        chance = 30,
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.MDT,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.BDT,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.CARDINAL_VEST] =
{
    {
        stat = tpz.augments.ATTK, 
        chance = 100, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DOUBLE_ATTACK,
        chance = 10,
        minimum = 0,
        maximum = 1
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.TABARZIN] =
{
    {
        stat = tpz.augments.WSD_DECIMATION, 
        chance = 100, 
        minimum = 1,
        maximum = 1
    },
    {
        stat = tpz.augments.STR, 
        chance = 30, 
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.STORETP, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.NTE,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 3
    },
}
tpz.annm.augment[tpz.items.DANCE_SHOES] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.ATTK, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.ACC, 
        chance = 30,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.SNAP_SHOT,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.DEMON_HELM] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.STR, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.HP, 
        chance = 30,
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.DARK,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MACC,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.ANELACE] =
{
    {
        stat = tpz.augments.MAIN_DMG_RATING, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.DELAYMINUS, 
        chance = 30, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.MACC, 
        chance = 30,
        minimum = 0,
        maximum = 1
    },
    {
        stat = tpz.augments.ALL_WSDMG_FIRST_HIT,
        chance = 10,
        minimum = 3,
        maximum = 7
    },
    {
        stat = tpz.augments.FASTCAST,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.DRAGON_MITTENS] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.ACC, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.ATTK, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.DAGGER,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.ERRANT_PIGACHES] =
{
    {
        stat = tpz.augments.CURE_POTENCY, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.HEALING, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.WSACC,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MATT,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.augment[tpz.items.MYTHIC_POLE] =
{
    {
        stat = tpz.augments.ENH_DRAIN_ASPIR, 
        chance = 100,
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.MACC, 
        chance = 30, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.DARK, 
        chance = 30, 
        minimum = 2,
        maximum = 10
    },
    {
        stat = tpz.augments.SUMMONING,
        chance = 10,
        minimum = 5,
        maximum = 9
    },
    {
        stat = tpz.augments.ENHANCE,
        chance = 10,
        minimum = 5,
        maximum = 9
    },
}
tpz.annm.augment[tpz.items.ELITE_BERET] =
{
    {
        stat = tpz.augments.DARK, 
        chance = 100, 
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.BLUE, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.ENHANCE, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.CONSERVE_MP,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MACC,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.ERRANT_HOUPPELANDE] =
{
    {
        stat = tpz.augments.PET_ACC_RACC, 
        chance = 100, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.MP, 
        chance = 30,
        minimum = 9,
        maximum = 19
    },
    {
        stat = tpz.augments.ATTK, 
        chance = 30,
        minimum = 9,
        maximum = 13
    },
    {
        stat = tpz.augments.REGEN,
        chance = 10,
        minimum = 0,
        maximum = 0
    },
    {
        stat = tpz.augments.WSACC,
        chance = 10,
        minimum = 14,
        maximum = 19
    },
}
tpz.annm.augment[tpz.items.ICE_LANCE] =
{
    {
        stat = tpz.augments.DT, 
        chance = 100, 
        minimum = 7,
        maximum = 15
    },
    {
        stat = tpz.augments.ENMITYMINUS, 
        chance = 30, 
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.MDEF, 
        chance = 30,
        minimum = 0,
        maximum = 5
    },
    {
        stat = tpz.augments.MAIN_DMG_RATING,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.DELAYMINUS,
        chance = 10,
        minimum = 4,
        maximum = 9
    },
}
tpz.annm.augment[tpz.items.CLOWNS_SUBLIGAR] =
{
    {
        stat = tpz.augments.HASTE, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.ACC, 
        chance = 30,
        minimum = 0,
        maximum = 3
    },
    {
        stat = tpz.augments.DEX, 
        chance = 30,
        minimum = 0,
        maximum = 1
    },
    {
        stat = tpz.augments.WSACC,
        chance = 10,
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.ENSPELL_DMG_BONUS,
        chance = 10,
        minimum = 0,
        maximum = 5
    },
}
tpz.annm.augment[tpz.items.IGQIRA_MANILLAS] =
{
    {
        stat = tpz.augments.INT, 
        chance = 100, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.MP, 
        chance = 30,
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.CONSERVE_MP,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.PDT,
        chance = 10,
        minimum = 0,
        maximum = 1
    },
}
tpz.annm.augment[tpz.items.DEATH_SCYTHE] =
{
    {
        stat = tpz.augments.WSD_SPIRAL_HELL, 
        chance = 100, 
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.STR, 
        chance = 30, 
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.INT, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.REGAIN,
        chance = 10,
        minimum = 0,
        maximum = 0
    },
}
tpz.annm.augment[tpz.items.ROSHI_JINPACHI] =
{
    {
        stat = tpz.augments.DEF, 
        chance = 100, 
        minimum = 12,
        maximum = 24
    },
    {
        stat = tpz.augments.HP, 
        chance = 30,
        minimum = 9,
        maximum = 19
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.SUBTLE_BLOW,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
    {
        stat = tpz.augments.STORETP,
        chance = 10,
        minimum = 0,
        maximum = 4
    },
}
tpz.annm.augment[tpz.items.VENDORS_SLOPS] =
{
    {
        stat = tpz.augments.INT, 
        chance = 100, 
        minimum = 4,
        maximum = 9
    },
    {
        stat = tpz.augments.ENMITY, 
        chance = 30,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.VIT, 
        chance = 30,
        minimum = 7,
        maximum = 14
    },
    {
        stat = tpz.augments.MATT,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
    {
        stat = tpz.augments.MACC,
        chance = 10,
        minimum = 0,
        maximum = 2
    },
}
tpz.annm.OpenChest = function(player, npc, item)
    local ID = zones[player:getZoneID()]
    local augmentOptions = tpz.annm.augment[item];
    local augmentIndex = 1;
    local augments = {};
    for _,augment in ipairs(augmentOptions) do
        if math.random(100) <= augment.chance then
            augments[augmentIndex] = augment.stat;
            augments[augmentIndex + 1] = math.random(augment.minimum, augment.maximum);
            augmentIndex = augmentIndex + 2;
            if augmentIndex == 11 then
                break;
            end
        end
    end
    local Message = npc:getLocalVar("Message")
    if (Message == 0) then
        ANNMAddChestLoot(player, npc)
        player:addItem(item,1,augments[1],augments[2],augments[3],augments[4],augments[5],augments[6],augments[7],augments[8],augments[9],augments[10]);
        player:messageSpecial( ID.text.ITEM_OBTAINED, item)
        player:setCharVar("CampaignPromotion", player:getCharVar("CampaignPromotion") +1)
        npc:setLocalVar("Message", 1)
    end
    npc:entityAnimationPacket("open")
    npc:setLocalVar("open", 1)
    npc:timer(15000, function(npc)
        npc:entityAnimationPacket("kesu")
    end)
    npc:timer(16000, function(npc)
        npc:setStatus(tpz.status.DISAPPEAR)
        npc:timer(500, function(mob)
            npc:setLocalVar("open", 0)
        end)
    end)
end

tpz.annm.GiveKI = function(player, npc, trade)
    local npcs =
    {
        KEENAN   = 17134255,
        THIRKELL = 17105647,
        SCOTWICK = 17162918
    }

    local allgeiance =
    {
        NONE        = 0,
        SANDORIA    = 1,
        BASTOK      = 2, 
        WINDURST    = 3,
    }

    local playerAllegiance = player:getCampaignAllegiance()
    local alliedNotesCost = 3000
    local ID = zones[player:getZoneID()]
    local BlueCrateTimer = player:getCharVar("[ANNM]BlueCrateTimer")
    local RedCrateTimer = player:getCharVar("[ANNM]RedCrateTimer")
    local GreenCrateTimer = player:getCharVar("[ANNM]GreenCrateTimer")

    if npcUtil.tradeHas(trade, tpz.items.GIL) then 
        if npc:getID() == npcs.KEENAN then
            if NoAllegianceMsg(player, playerAllegiance, 'Keenan') then
                return
            end
            if (playerAllegiance == 2) then
                alliedNotesCost = 1500
            end
            if (VanadielTime() >= BlueCrateTimer) and (player:hasKeyItem(tpz.ki.BLUE_LABELED_CRATE) == false) then
                player:PrintToPlayer("Take this to a nearby battlefield and it will attract something worthwhile.",0,"Keenan")
                player:addKeyItem(tpz.ki.BLUE_LABELED_CRATE)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BLUE_LABELED_CRATE)
                player:delCurrency("allied_notes", alliedNotesCost)
                player:setCharVar("[ANNM]BlueCrateTimer", VanadielTime()+39600) -- Current time +11 hrs
                player:confirmTrade()
            else
                player:PrintToPlayer("I don't have any crates right now, come back later.",0,"Keenan")
            end
        elseif npc:getID() == npcs.THIRKELL then
            if NoAllegianceMsg(player, playerAllegiance, 'Thirkell') then
                return
            end
            if (playerAllegiance == 1) then
                alliedNotesCost = 1500
            end
            if (VanadielTime() >= RedCrateTimer) and (player:hasKeyItem(tpz.ki.RED_LABELED_CRATE) == false) then
                player:PrintToPlayer("Take this to a nearby battlefield and it will attract something worthwhile.",0,"Thirkell")
                player:addKeyItem(tpz.ki.RED_LABELED_CRATE)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.RED_LABELED_CRATE)
                player:delCurrency("allied_notes", alliedNotesCost)
                player:setCharVar("[ANNM]RedCrateTimer", VanadielTime()+39600) -- Current time +11 hrs
                player:confirmTrade()
            else
                player:PrintToPlayer("I don't have any crates right now, come back later.",0,"Thirkell")
            end
        elseif npc:getID() == npcs.SCOTWICK then
            if NoAllegianceMsg(player, playerAllegiance, 'Scotwick') then
                return
            end
            if (playerAllegiance == 3) then
                alliedNotesCost = 1500
            end
            if (VanadielTime() >= GreenCrateTimer) and (player:hasKeyItem(tpz.ki.GREEN_LABELED_CRATE) == false) then
                player:PrintToPlayer("Take this to a nearby battlefield and it will attract something worthwhile.",0,"Scotwick")
                player:addKeyItem(tpz.ki.GREEN_LABELED_CRATE)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.GREEN_LABELED_CRATE)
                player:delCurrency("allied_notes", alliedNotesCost)
                player:setCharVar("[ANNM]GreenCrateTimer", VanadielTime()+39600) -- Current time +11 hrs
                player:confirmTrade()
            else
                player:PrintToPlayer("I don't have any crates right now, come back later.",0,"Scotwick")
            end
        end
    end
end

tpz.annm.GetAlliedNotesCost = function(player)
    local allgeiance =
    {
        NONE        = 0,
        SANDORIA    = 1,
        BASTOK      = 2, 
        WINDURST    = 3,
    }

    local playerAllegiance = player:getCampaignAllegiance()
    local alliedNotesCost = 3000

    if (player:getZoneID() == tpz.zone.BASTOK_MARKETS_S) then
        if (playerAllegiance == 2) then
            alliedNotesCost = 1500
        end
    elseif (player:getZoneID() == tpz.zone.SOUTHERN_SAN_DORIA_S) then
        if (playerAllegiance == 1) then
            alliedNotesCost = 1500
        end
    elseif (player:getZoneID() == tpz.zone.WINDURST_WATERS_S) then
        if (playerAllegiance == 3) then
            alliedNotesCost = 1500
        end
    end
    return alliedNotesCost
end

tpz.annm.PopNM = function(player, npc)
    local zone = player:getZoneID()

    if (zone == tpz.zone.EAST_RONFAURE_S) then
        StartANNMFight(player, tpz.ki.RED_LABELED_CRATE, 17109368, 17109374)
    elseif (zone == tpz.zone.JUGNER_FOREST_S) then
        StartANNMFight(player, tpz.ki.RED_LABELED_CRATE, 17113469, 17113475)
    elseif (zone == tpz.zone.VUNKERL_INLET_S) then
        StartANNMFight(player, tpz.ki.RED_LABELED_CRATE, 17117553, 17117559)
    elseif (zone == tpz.zone.BATALLIA_DOWNS_S) then
        StartANNMFight(player, tpz.ki.RED_LABELED_CRATE, 17121698, 17121704)
    elseif (zone == tpz.zone.NORTH_GUSTABERG_S) then
        StartANNMFight(player, tpz.ki.BLUE_LABELED_CRATE, 17138051, 17138057)
    elseif (zone == tpz.zone.GRAUBERG_S) then
        StartANNMFight(player, tpz.ki.BLUE_LABELED_CRATE, 17142113, 17142119)
    elseif (zone == tpz.zone.PASHHOW_MARSHLANDS_S) then
        StartANNMFight(player, tpz.ki.BLUE_LABELED_CRATE, 17146151, 17146157)
    elseif (zone == tpz.zone.ROLANBERRY_FIELDS_S) then
        StartANNMFight(player, tpz.ki.BLUE_LABELED_CRATE, 17150322, 17150328)
    elseif (zone == tpz.zone.WEST_SARUTABARUTA_S) then
        StartANNMFight(player, tpz.ki.GREEN_LABELED_CRATE, 17166731, 17166737)
    elseif (zone == tpz.zone.FORT_KARUGO_NARUGO_S) then
        StartANNMFight(player, tpz.ki.GREEN_LABELED_CRATE, 17170650, 17170656)
    elseif (zone == tpz.zone.MERIPHATAUD_MOUNTAINS_S) then
        StartANNMFight(player, tpz.ki.GREEN_LABELED_CRATE, 17174893, 17174899)
    elseif (zone == tpz.zone.SAUROMUGUE_CHAMPAIGN_S) then
        StartANNMFight(player, tpz.ki.GREEN_LABELED_CRATE, 17178905, 17178911)
    elseif (zone == tpz.zone.GARLAIGE_CITADEL_S) then
        StartANNMFight(player, tpz.ki.GREEN_LABELED_CRATE, 17449032, 17449038)
    elseif (zone == tpz.zone.CRAWLERS_NEST_S) then
        StartANNMFight(player, tpz.ki.BLUE_LABELED_CRATE, 17477729, 17477735)
    elseif (zone == tpz.zone.THE_ELDIEME_NECROPOLIS_S) then
        StartANNMFight(player, tpz.ki.RED_LABELED_CRATE, 17494279, 17494285)
    end
end

tpz.annm.NMMods = function(mob)
	mob:setDamage(140)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REGAIN, 150)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMod(tpz.mod.MOVE, 20)
    mob:setMod(tpz.mod.REGEN, 50)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 35)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
    mob:addImmunity(tpz.immunity.SILENCE) 
    mob:addImmunity(tpz.immunity.POISON)
    mob:addImmunity(tpz.immunity.ELEGY)
    mob:setUnkillable(true)
end

tpz.annm.PetMods = function(mob)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function StartANNMFight(player, keyitem, mobIDstart, mobIDend)
    local ID = zones[player:getZoneID()]

    if player:hasKeyItem(keyitem) then
        for i = mobIDstart, mobIDend do
            local mob = GetMobByID(i)
            mob:setSpawn(player:getXPos() + math.random(1, 3), player:getYPos(), player:getZPos() + math.random(1, 3))
            mob:spawn()
            mob:stun(500)
            mob:updateEnmity(player) 
        end
        player:delKeyItem(keyitem)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED +1, keyitem)
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY +1)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

tpz.annm.PetShield = function(mob, addsIDstart, addsIDend)
    for i = addsIDstart, addsIDend do
        if not GetMobByID(i):isDead() then
            return
        end
    end
    mob:setUnkillable(false)
end

tpz.annm.SpawnChest = function(mob, player, isKiller)
    local zone = mob:getZoneID()
    local chestID = GetChestID(zone)

    if isKiller or noKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        GetNPCByID(chestID):setPos(mobX, mobY, mobZ)
        GetNPCByID(chestID):setStatus(tpz.status.NORMAL)
        GetNPCByID(chestID):setLocalVar("Message", 0)GetNPCByID(chestID):setLocalVar("Message", 0)
    end
    player:setCharVar("CampaignPromotion", player:getCharVar("CampaignPromotion") +1)
end

function GetChestID(zone)
    for i,chestIDs in pairs(chests) do
        if (zone == chestIDs[1]) then
            return chestIDs[2]
        end
    end

    return 0
end

function ANNMAddChestLoot(player, npc)
    local zone = player:getZoneID()
    local zonePlayers = player:getZone():getPlayers()

    player:addTreasure(ore[math.random(#ore)], npc)
    player:addTreasure(log[math.random(#log)], npc)
    player:addTreasure(thread[math.random(#thread)], npc)
    player:addTreasure(leather[math.random(#leather)], npc)
    player:addTreasure(gem[math.random(#gem)], npc)
    player:addTreasure(food[math.random(#food)], npc)
    player:addTreasure(junk[math.random(#junk)], npc)
    if math.random(100) <= 5 then
        player:addTreasure(valuable[math.random(#valuable)], npc)
    end
    for _, zonePlayer in pairs(zonePlayers) do
        zonePlayer:addExp(2500)
    end
end

function NoAllegianceMsg(player, playerAllegiance, npcName)
    if (playerAllegiance == 0) then
        player:PrintToPlayer("I can't do anything for you.",0,npcName)
        return true
    end
    return false
end