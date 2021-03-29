-----------------------------------
-- Area: Oztroja
--  NM: Odontotyrannus
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------


function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
end