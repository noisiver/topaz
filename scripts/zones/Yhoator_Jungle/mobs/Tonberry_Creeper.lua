-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Tonberry Creeper
-- Note: PH for Hoar-knuckled Rimberry
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 133, 1, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.HOAR_KNUCKLED_RIMBERRY_PH, 20, math.random(5400, 7200)) -- 90 to 120 minutes
end
