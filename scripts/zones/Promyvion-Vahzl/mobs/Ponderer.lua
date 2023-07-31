-----------------------------------
-- Area: Promyvion - Vahzl
--   NM: Ponderer
-----------------------------------
require("scripts/globals/pathfind")
require("scripts/globals/promyvion")
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 40)
    tpz.promyvion.setEmptyModel(mob)
end

function onMobFight(mob, target)
    if mob:getHPP() <= 25  then
        mob:setMod(tpz.mod.REGAIN, 250)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCurrentMission(COP) == tpz.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus") == 5 then
        player:setCharVar("PromathiaStatus", 6)
    end
	tpz.promyvion.onEmptyDeath(mob)
end
