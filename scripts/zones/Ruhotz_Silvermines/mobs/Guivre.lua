-----------------------------------
-- Area: Ruhotz Silvermines
--  Mob: Guivre
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------
--TODO: Missing pathNodes positions
local pathNodes =
{
    106, 0, -3,
    106, 0, -4,
    107, 0, -5,
    107, 0, -6,
    108, 0, -7,
    108, 0, -9,
    109, 0, -10,
    109, 0, -11,
    111, 0, -15,
    112, 0, -16,
    112, 0, -18,
    113, 0, -18,
    113, 0, -19,
    114, 0, -21,
    114, 0, -23,
    115, 0, -24,
    115, 0, -27,
    116, 0, -32,
    117, 0, -33,
    117, 0, -38,
    116, 0, -39,
    116, 0, -40,
    115, 0, -41,
    115, 0, -43,
    114, 0, -44,
    113, 0, -45,
    113, 0, -46,
    112, 0, -46,
    111, 0, -47,
    111, 0, -48,
    110, 0, -48,
    109, 0, -49,
    108, 0, -50,
    107, 0, -50,
    107, 0, -51,
    105, 0, -51,
    105, 0, -52,
    104, 0, -52,
    103, -1, -53,
    101, -1, -54,
    100, -1, -54,
    98, -2, -55,
    94, -4, -57,
    93, -4, -57,
    92, -5, -58,
    89, -5, -58,
    88, -6, -58,
    87, -6, -59,
    85, -7, -59,
    84, -7, -59,
    83, -8, -59,
    79, -8, -59,
    75, -9, -59,
    74, -9, -59,
    71, -8, -59,
    70, -8, -59,
    69, -8, -60,
    69, -8, -60,
    68, -8, -61,
    67, -8, -61,
    66, -8, -62,
    65, -8, -62,
    64, -8, -63,
    64, -9, -64,
    63, -9, -65,
    63, -9, -66,
    62, -9, -67,
    62, -9, -68,
    61, -9, -68,
    61, -9, -70,
    60, -9, -71,
    60, -9, -72,
    58, -8, -78,
    58, -8, -79,
    58, -8, -80,
    57, -8, -81,
    56, -8, -83,
    55, -9, -88,
    54, -9, -90,
    53, -9, -93,
    53, -9, -94,
    52, -9, -94,
    51, -9, -95,
    51, -9, -96,
    50, -9, -96,
    49, -8, -97,
    48, -8, -97,
    47, -8, -98,
    43, -8, -98,
    42, -8, -99,
    38, -8, -99,
    37, -8, -98,
    36, -8, -98,
    35, -7, -98,
    32, -6, -98,
    30, -6, -98,
    29, -5, -98,
    27, -4, -97,
    26, -4, -97,
    24, -3, -97,
    23, -3, -96,
    21, -2, -96,
    20, -2, -96,
    19, -1, -95,
    18, -1, -95,
    17, -1, -94,
    16, -1, -94,
    14, 0, -93,
    13, 0, -92,
    13, 0, -92,
    11, 0, -91,
    8, 0, -89,
    7, 0, -88,
    6, 0, -88,
    5, 0, -87,
    4, 0, -87,
    3, 0, -86,
    3, 0, -85,
    2, 0, -84,
    1, 0, -84,
    0, 0, -83,
    0, 0, -81,
    -1, 0, -81,
    -2, 0, -80,
    -3, 0, -79,
    -3, 0, -78,
    -4, 0, -77,
    -5, 0, -76,
    -7, 0, -74,
    -8, 0, -72,
    -16, 0, -63,
    -26, 0, -51,
    -33, 0, -43,
    -36, 0, -41,
    -38, 0, -38,
    -39, 0, -37,
    -39, 0, -36,
    -40, 0, -35,
    -40, 0, -34,
    -41, 0, -33,
    -41, 0, -32,
    -42, 0, -31,
    -42, 0, -28,
    -43, 0, -27,
    -45, 0, -20,
    -46, 0, -16,
    -47, 0, -11,
    -48, 0, -8,
    -48, 0, -7,
    -49, 0, -6,
    -49, 0, -2,
    -49, 0, 0,
    -49, 0, 1,
    -50, 0, 2,
    -50, 0, 6,
    -49, 0, 7,
    -49, 0, 11,
    -48, 0, 12,
    -48, 0, 15,
    -47, 0, 16,
    -44, 0, 26,
    -43, 0, 30,
    -42, 0, 33,
    -43, 0, 32,
    -44, 0, 31,
    -44, 0, 15,
    -45, 0, 11,
    -45, 0, 7,
    -45, 0, 6,
    -45, 0, 5,
    -44, 0, 4,
    -44, 0, 1,
    -43, 0, -5,
    -42, 0, -9,
    -42, 0, -13,
    -41, 0, -19,
    -39, 0, -34,
    -38, 0, -35,
    -38, 0, -37,
    -37, 0, -38,
    -37, 0, -39,
    -36, 0, -41,
    -36, 0, -42,
    -35, 0, -43,
    -35, 0, -44,
    -34, 0, -45,
    -34, 0, -46,
    -33, 0, -47,
    -32, 0, -48,
    -31, 0, -49,
    -30, 0, -49,
    -30, 0, -50,
    -28, 0, -52,
    -22, 0, -57,
    -14, 0, -64,
    -9, 0, -69,
    0, 0, -77,
    8, 0, -84,
    8, 0, -84,
    13, -0, -88,
    18, -1, -93,
    20, -1, -94,
    20, -2, -94,
    22, -2, -95,
    23, -3, -95,
    24, -3, -95,
    25, -4, -96,
    29, -5, -97,
    35, -7, -99,
    36, -8, -99,
    45, -8, -99,
    46, -8, -98,
    47, -8, -98,
    48, -8, -97,
    50, -8, -97,
    51, -8, -96,
    52, -9, -96,
    53, -8, -95,
    54, -9, -94,
    54, -8, -93,
    55, -8, -93,
    56, -8, -92,
    56, -8, -91,
    57, -8, -90,
    57, -8, -87,
    58, -8, -86,
    58, -8, -81,
    57, -8, -80,
    58, -8, -79,
    58, -8, -77,
    59, -8, -76,
    59, -8, -75,
    59, -9, -74,
    60, -8, -73,
    60, -9, -72,
    61, -9, -71,
    61, -9, -70,
    62, -9, -69,
    63, -9, -68,
    63, -9, -67,
    64, -9, -66,
    64, -9, -65,
    65, -9, -64,
    65, -8, -64,
    66, -8, -63,
    67, -8, -62,
    68, -8, -62,
    69, -8, -61,
    71, -8, -61,
    72, -9, -60,
    75, -9, -60,
    76, -9, -59,
    77, -8, -59,
    80, -8, -59,
    88, -6, -57,
    92, -5, -56,
    97, -3, -55,
    101, -1, -54,
    102, -1, -54,
    103, -1, -53,
    104, 0, -53,
    105, 0, -52,
    107, 0, -52,
    108, 0, -51,
    108, 0, -50,
    109, 0, -50,
    110, 0, -49,
    110, 0, -48,
    111, 0, -47,
    111, 0, -45,
    112, 0, -44,
    112, 0, -41,
    113, 0, -40,
    113, 0, -18,
    113, 0, -17,
    112, 0, -16,
    112, 0, -15,
    110, 0, -7,
    110, 0, -4,
    109, 0, -2,
    109, 0, -1,
    108, 0, 1,
    107, 0, 3
}

local removables =
{
    tpz.effect.FLASH, tpz.effect.BLINDNESS, tpz.effect.ELEGY, tpz.effect.REQUIEM, tpz.effect.PARALYSIS, tpz.effect.POISON,
    tpz.effect.CURSE_I, tpz.effect.CURSE_II, tpz.effect.DISEASE, tpz.effect.PLAGUE, tpz.effect.WEIGHT, tpz.effect.BIND,
    tpz.effect.BIO, tpz.effect.DIA, tpz.effect.BURN, tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN,
    tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN,
    tpz.effect.CHR_DOWN, tpz.effect.ADDLE, tpz.effect.SLOW, tpz.effect.HELIX, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN,
    tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAGIC_EVASION_DOWN,
    tpz.effect.MAGIC_DEF_DOWN, tpz.effect.CRIT_HIT_EVASION_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.MAX_MP_DOWN, tpz.effect.MAX_HP_DOWN,
    tpz.effect.SLUGGISH_DAZE_1, tpz.effect.SLUGGISH_DAZE_2, tpz.effect.SLUGGISH_DAZE_3, tpz.effect.SLUGGISH_DAZE_4, tpz.effect.SLUGGISH_DAZE_5,
    tpz.effect.LETHARGIC_DAZE_1, tpz.effect.LETHARGIC_DAZE_2, tpz.effect.LETHARGIC_DAZE_3, tpz.effect.LETHARGIC_DAZE_4, tpz.effect.LETHARGIC_DAZE_5,
    tpz.effect.WEAKENED_DAZE_1, tpz.effect.WEAKENED_DAZE_2, tpz.effect.WEAKENED_DAZE_3, tpz.effect.WEAKENED_DAZE_4, tpz.effect.WEAKENED_DAZE_5
}

function onPath(mob)
    tpz.path.patrol(mob, pathNodes)
end


function onMobSpawn(mob)
	mob:setDamage(150)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 395)
    mob:addMod(tpz.mod.MDEF, 40)
    mob:addMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMod(tpz.mod.REGEN, 40)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
    mob:setLocalVar("RunAwayPath", 0)
	mob:setLocalVar("RunAway", 0)
end

function onMobRoam(mob)
    -- move to start position if not moving
    if not mob:isFollowingPath() then
        mob:pathThrough(tpz.path.first(pathNodes))
    end
end

function onMobEngaged(mob)
	mob:setLocalVar("RunAway", 0)
end

function onMobFight(mob, target)
	local RunAwayPath = mob:getLocalVar("RunAwayPath")
    local RunAway = mob:getLocalVar("RunAway")

    if mob:getHPP() <= 90 and mob:getHPP() >= 80 and RunAway == 0 then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 90 and mob:getHPP() >= 80 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 80 and mob:getHPP() >= 70 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 70 and mob:getHPP() >= 60 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 60 and mob:getHPP() >= 50 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 50 and mob:getHPP() >= 40 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 40 and mob:getHPP() >= 30 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 30 and mob:getHPP() >= 20 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 20 and mob:getHPP() >= 10 and RunAway == 0  then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() <= 10 and mob:getHPP() >= 1 and RunAway == 0  then
    end

	if RunAwayPath == 1 then
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                mob:delStatusEffectSilent(effect)
            end
        end
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGBREATH, -100)
        mob:addTP(3000)
		mob:pathTo(38, 17, -391) -- Position needs to be added
        mob:disengage()
		mob:setLocalVar("RunAwayPath", 0)
	end
	
	if RunAwayPath == 2 then
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                mob:delStatusEffectSilent(effect)
            end
        end
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGBREATH, -100)
        mob:addTP(3000)
		mob:pathTo(38, 17, -391) -- Position needs to be added
        mob:disengage()
		mob:setLocalVar("RunAwayPath", 0)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.LAMBTON_WORM_DESEGMENTER)
end
