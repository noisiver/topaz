-----------------------------------
-- Area: Uleguerand Range
--  Mob: Mountain Worm
-----------------------------------
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------
function onMobInitialize(mob)
	mob:setMod(tpz.mod.REGEN, 50)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 21 to 24 hours
end