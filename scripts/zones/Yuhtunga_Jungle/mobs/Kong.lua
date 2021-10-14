-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Kong
-- ZM5
-- Attacks up to 4 times per combat round
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 50)
    mob:setMod(tpz.mod.COUNTER, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setTrueDetection(true)
	mob:setAggressive(true)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 50)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 50)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900)
    end
end


