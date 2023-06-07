-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Tzee Xicu's Elemental'
-- BCNM: A Malicious Manifest
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/elemental_spirit")}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ENFEEBLE_NEVER_MISS, 1)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 20)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobEngaged(mob, target)
    -- Force adds to link when aggrod
    for v = 17183062, 17183066 do
        GetMobByID(v):updateEnmity(target)
    end
end


function onMobDeath(mob, player, isKiller, noKiller)
end
