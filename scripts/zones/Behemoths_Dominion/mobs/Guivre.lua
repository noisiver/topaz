-----------------------------------
-- Area: Behemoth's Dominion
--  Mob: Guivre
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------
local pathNodes =
{
    -180, -19, 58,
    -126, -21, 57,
    -103, -17, 57,
    -98, -9, 23,
    -71, -5, 18,
    -26, -3, -5,
    6,  -4, -36,
    -36, -5, -61,
    -79, -3, -73,
    -92, -4, -55,
    -102, -9, -20,
    -151, -20, -22,
    -217, -19, -18,
    -262, -20, 20,
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
        tpz.effect.WEAKENED_DAZE_1, tpz.effect.WEAKENED_DAZE_2, tpz.effect.WEAKENED_DAZE_3, tpz.effect.WEAKENED_DAZE_4, tpz.effect.WEAKENED_DAZE_5,
        tpz.effect.HELIX, tpz.effect.KAUSTRA
    }

function onPath(mob)
    tpz.path.patrol(mob, pathNodes)
end


function onMobSpawn(mob)
	mob:setDamage(175)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 320)
    mob:addMod(tpz.mod.MDEF, 40)
	mob:setMod(tpz.mod.VIT, 50)
    mob:setMod(tpz.mod.UDMGPHYS, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMod(tpz.mod.UDMGBREATH, 0)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMod(tpz.mod.REGEN, 40)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.MOVE, 40)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
    mob:setLocalVar("RunAwayPath", 0)
	mob:setLocalVar("RunAway", 0)
    onPath(mob)
end

function onMobRoam(mob)
    -- move to start position if not moving
    if not mob:isFollowingPath() then
        mob:pathThrough(tpz.path.first(pathNodes))
    end
end

function onMobEngaged(mob)
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:delStatusEffectSilent(tpz.effect.FLEE)
    mob:setMod(tpz.mod.UDMGPHYS, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMod(tpz.mod.UDMGBREATH, 0)
end

function onMobFight(mob, target)
	local RunAwayPath = mob:getLocalVar("RunAwayPath")
    local RunAway = mob:getLocalVar("RunAway")

    if mob:getHPP() < 90 and RunAway < 1 then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 1)
    elseif mob:getHPP() < 80 and RunAway < 2  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 2)
    elseif mob:getHPP() < 70 and RunAway < 3  then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 3)
    elseif mob:getHPP() < 60 and RunAway < 4  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 4)
    elseif mob:getHPP() < 50 and RunAway < 5  then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 5)
    elseif mob:getHPP() < 40 and RunAway < 6  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 6)
    elseif mob:getHPP() < 30 and RunAway < 7  then
		mob:setLocalVar("RunAwayPath", 1)
		mob:setLocalVar("RunAway", 7)
    elseif mob:getHPP() < 20 and RunAway < 8  then
		mob:setLocalVar("RunAwayPath", 2)
		mob:setLocalVar("RunAway", 8)
    elseif mob:getHPP() < 10 and RunAway < 9  then
    	mob:setLocalVar("RunAway", 10)
    end

	if RunAwayPath == 1 then
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                mob:delStatusEffectSilent(effect)
            end
        end
        mob:addStatusEffect(tpz.effect.FLEE, 25, 0, 30)
		mob:pathTo( -26, -3, -5) -- Position needs to be added
		mob:setLocalVar("RunAwayPath", 0)
	end
	
	if RunAwayPath == 2 then
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                mob:delStatusEffectSilent(effect)
            end
        end
        mob:addStatusEffect(tpz.effect.FLEE, 25, 0, 30)
		mob:pathTo(-262, -20, 20) -- Position needs to be added
		mob:setLocalVar("RunAwayPath", 0)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.LAMBTON_WORM_DESEGMENTER)
end
