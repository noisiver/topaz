-----------------------------------
-- Area: Ranguemont Pass
--   NM: Gloom Eye
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(250)
	mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobFight(mob, target)
    --[[
    https://ffxiclopedia.fandom.com/wiki/Gloom_Eye

    "Possesses a potent Store TP effect that increases as HP declines.
    Below 25%, 1 swing from a 2-handed Weapon is estimated to give it approximately 50% TP."

    Using formula below, mob will have:
    at 100% HP, 20 storeTP
        75% HP, 80 storeTP
        50% HP, 140 storeTP
        25% HP, 200 storeTP (caps here - this is about 50% TP per greatsword swing)
    --]]
    local power = 20 + math.floor(utils.clamp(100 - mob:getHPP(), 0, 75) * 2.4)
    mob:setMod(tpz.mod.STORETP, power)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 346)
end
