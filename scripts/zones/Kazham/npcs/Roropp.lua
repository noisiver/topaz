-----------------------------------
-- Area: Kazham
--  NPC: Roropp
-- Standard Info NPC
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
local flags = tpz.path.flag.RUN
local path =
{
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    12.576, -8.000, -113.211,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    17.314, -8.000, -110.064,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    17.388, -8.000, -99.219,
    17.388, -8.000, -99.219,
    17.388, -8.000, -99.219,
    17.388, -8.000, -99.219,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    15.511, -8.000, -112.292,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    13.605, -8.000, -109.863,
    17.388, -8.000, -99.219,
    17.388, -8.000, -99.219,
    17.388, -8.000, -99.219,
    17.388, -8.000, -99.219,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
    13.323, -8.000, -102.821,
}

function onSpawn(npc)
    npc:initNpcAi()
    npc:setPos(tpz.path.first(path))
    onPath(npc)
end

function onPath(npc)
    tpz.path.patrolsimple(npc, path, flags)
end

function onTrade(player, npc, trade)
    -- item IDs
    -- 483       Broken Mithran Fishing Rod
    -- 22        Workbench
    -- 1008      Ten of Coins
    -- 1157      Sands of Silence
    -- 1158      Wandering Bulb
    -- 904       Giant Fish Bones
    -- 4599      Blackened Toad
    -- 905       Wyvern Skull
    -- 1147      Ancient Salt
    -- 4600      Lucky Egg
    local OpoOpoAndIStatus = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.THE_OPO_OPO_AND_I)
    local progress = player:getCharVar("OPO_OPO_PROGRESS")
    local failed = player:getCharVar("OPO_OPO_FAILED")
    local goodtrade = trade:hasItemQty(1157, 1)
    local badtrade = (trade:hasItemQty(483, 1) or trade:hasItemQty(22, 1) or trade:hasItemQty(1008, 1) or trade:hasItemQty(1158, 1) or trade:hasItemQty(904, 1) or trade:hasItemQty(4599, 1) or trade:hasItemQty(905, 1) or trade:hasItemQty(1147, 1) or trade:hasItemQty(4600, 1))

    if (OpoOpoAndIStatus == QUEST_ACCEPTED) then
        if progress == 3 or failed == 4 then
            if goodtrade then
                player:startEvent(222)
            elseif badtrade then
                player:startEvent(232)
            end
        end
    end
end

function onTrigger(player, npc)
    local OpoOpoAndIStatus = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.THE_OPO_OPO_AND_I)
    local progress = player:getCharVar("OPO_OPO_PROGRESS")
    local failed = player:getCharVar("OPO_OPO_FAILED")
    local retry = player:getCharVar("OPO_OPO_RETRY")

    if (OpoOpoAndIStatus == QUEST_ACCEPTED) then
        if retry >= 1 then                          -- has failed on future npc so disregard previous successful trade
            player:startEvent(200)
            npc:wait()
        elseif (progress == 3 or failed == 4) then
                player:startEvent(210)  -- asking for sands of silence
        elseif (progress >= 4 or failed >= 5) then
            player:startEvent(245) -- happy with sands of silence
        end
    else
        player:startEvent(200)
        npc:wait()
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option, npc)

    if (csid == 222) then    -- correct trade, onto next opo
        if player:getCharVar("OPO_OPO_PROGRESS") == 3 then
            player:tradeComplete()
            player:setCharVar("OPO_OPO_PROGRESS", 4)
            player:setCharVar("OPO_OPO_FAILED", 0)
        else
            player:setCharVar("OPO_OPO_FAILED", 5)
        end
    elseif (csid == 232) then              -- wrong trade, restart at first opo
        player:setCharVar("OPO_OPO_FAILED", 1)
        player:setCharVar("OPO_OPO_RETRY", 4)
    else
        npc:wait(0)
    end
end
