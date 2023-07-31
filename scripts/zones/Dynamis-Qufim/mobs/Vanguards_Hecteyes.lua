-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Vanguards Hecteyes
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SDT_DARK, 5)

end
function onMobDeath(mob, player, isKiller, noKiller)
end
