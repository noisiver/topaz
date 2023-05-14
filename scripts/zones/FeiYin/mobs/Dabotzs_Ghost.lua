-----------------------------------
-- Area: FeiYin
--   NM: Dabotz's Ghost
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMobMod(tpz.mobMod.WEAPON_BONUS, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 10) 
    mob:addMod(tpz.mod.EVA, 10)
end

function onMobDeath(mob, player, isKiller)
    if player:hasKeyItem(tpz.ki.AQUAFLORA3) then
        player:setCharVar("DabotzKilled", 1)
    end
end
