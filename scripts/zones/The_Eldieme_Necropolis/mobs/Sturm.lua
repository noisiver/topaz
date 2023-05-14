-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Sturm
-- Involved in Quest: A New Dawn (BST AF3)
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMobMod(tpz.mobMod.WEAPON_BONUS, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 10) 
    mob:addMod(tpz.mod.EVA, 10)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.A_NEW_DAWN) == QUEST_ACCEPTED and player:getCharVar("ANewDawn_Event") == 4 then
        player:setCharVar("ANewDawn_Event", 5)
    end

    if isKiller then
        for i = ID.mob.TAIFUN, ID.mob.TROMBE do
            if GetMobByID(i):isSpawned() then
                DespawnMob(i)
            end
        end
    end
end
