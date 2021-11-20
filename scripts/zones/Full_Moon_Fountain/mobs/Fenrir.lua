-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Fenrir
-- Avatar Prime fight
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Full_Moon_Fountain/IDs")
------------------------------

function onMobSpawn(mob)
	mob:setDamage(120)
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.DEFP, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller)
end
