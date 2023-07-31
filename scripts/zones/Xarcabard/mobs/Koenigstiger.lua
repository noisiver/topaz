-----------------------------------
-- Area: Xarcabard
--  Mob: Koenigstiger
-- Involved in Quests: Unbridled Passion (RNG AF3)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 200)
    mob:addMod(tpz.mod.DEFP, 35) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCharVar("unbridledPassion") == 4 then
        player:setCharVar("unbridledPassion", 5)
    end
end
