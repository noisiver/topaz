-----------------------------------
-- Area: Davoi
--   NM: Purpleflash Brukdok
-----------------------------------

require("scripts/globals/titles")
require("scripts/globals/mobs")


function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERES, 75)
    mob:setMod(tpz.mod.SLEEPRES, 75)
    end