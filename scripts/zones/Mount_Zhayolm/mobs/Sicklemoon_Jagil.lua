------------------------------
-- Area: Mount Zhayolm
--   NM: Sicklemoon_Jagil
------------------------------
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller)
end
