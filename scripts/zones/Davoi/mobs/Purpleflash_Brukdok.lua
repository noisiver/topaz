-----------------------------------
-- Area: Davoi
--   NM: Purpleflash Brukdok
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

require("scripts/globals/titles")
require("scripts/globals/mobs")


function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
    end