-----------------------------------
-- Area: Manaclipper
--  Mob: Cyclopean Conch
-----------------------------------
mixins = {require("scripts/mixins/families/uragnite")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 10)
    mob:addMod(tpz.mod.EVA, 10)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
