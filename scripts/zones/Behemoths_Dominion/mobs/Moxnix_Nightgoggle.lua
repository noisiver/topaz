-----------------------------------
-- Area: Behemoth's Dominion
--   NM: Moxnix Nightgoggle
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 24)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMod(tpz.mod.SDT_DARK, 20)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getQuestStatus(BASTOK, tpz.quest.id.bastok.THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED then
        player:addCharVar("theTalekeepersGiftKilledNM", 1)
    end
end
