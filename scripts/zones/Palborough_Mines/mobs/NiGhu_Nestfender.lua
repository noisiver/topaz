-----------------------------------
-- Area: Palborough Mines
--  Mob: Ni'Ghu Nestfender
-- Involved in Quest: he Talekeeper's Truth
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:addImmunity(tpz.immunity.SILENCE)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (player:getCharVar("theDoormanMyMob") == 1) then
        player:addCharVar("theDoormanKilledNM", 1)
    end
end
