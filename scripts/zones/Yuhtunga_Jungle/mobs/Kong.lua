-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Kong
-- ZM5
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.REGAIN, 50)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900)
    end
end


