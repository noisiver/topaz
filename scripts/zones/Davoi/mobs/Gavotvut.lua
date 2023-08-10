-----------------------------------
-- Area: Davoi
--  Mob: Gavotvut
-- Involved in Quest: The Doorman
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:addImmunity(tpz.immunity.SLEEP)
end

function onMobDeath(mob, player, isKiller, noKiller)

    if (player:getCharVar("theDoormanMyMob") == 1) then
        player:addCharVar("theDoormanKilledNM", 1)
    end

end
