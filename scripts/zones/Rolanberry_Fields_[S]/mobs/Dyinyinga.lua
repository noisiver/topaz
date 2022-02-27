------------------------------
-- Area: Rolanberry Fields [S]
--   NM: Dyinyinga
------------------------------
require("scripts/globals/hunts")
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/world")
require("scripts/globals/magic")
require("scripts/globals/utils")
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.MOVE, 20)
	mob:setMod(tpz.mod.UDMGMAGIC, 25)
end

function onMobFight(mob, target)
	if mob:getWeather() == tpz.weather.RAIN or mob:getWeather() == tpz.weather.SQUALL then
		mob:setMod(tpz.mod.REGEN, 100)
	else
		mob:setMod(tpz.mod.REGEN, 0)
	end
    local nearbyPlayers = mob:getPlayersInRange(8)
    if nearbyPlayers == nil then return end
    for _,v in ipairs(nearbyPlayers) do
        v:delStatusEffectSilent(tpz.effect.AMNESIA)
        v:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 5)
        v:delStatusEffectSilent(tpz.effect.MUTE)
        v:addStatusEffectEx(tpz.effect.MUTE, tpz.effect.MUTE, 1, 0, 5)
    end

end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SLOW, {power = 25})
end


function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 511)
end
