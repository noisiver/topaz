-----------------------------------
-- Area: Manaclipper
--  Mob: Harajnite
-----------------------------------
mixins = {require("scripts/mixins/families/uragnite")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 10)
    mob:addMod(tpz.mod.EVA, 10)
    mob:setLocalVar("[uragnite]inShellRegen", 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
