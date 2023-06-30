-----------------------------------
-- Area: Yhoator Jungle
--   NM: Hoar-knuckled Rimberry
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setDamage(150)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 368)
    tpz.regime.checkRegime(player, mob, 133, 1, tpz.regime.type.FIELDS)
end
