-----------------------------------
-- Area:  Ordelle's Caves
-- NM:   Aroma Leech
-- Notes: Spawns only from hours 06 to 16.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HASTE_MAGIC, 15)
end