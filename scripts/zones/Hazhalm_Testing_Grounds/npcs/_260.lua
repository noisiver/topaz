-----------------------------------
-- Area: Hazhalm Testing Grounds
--  NPC: Entry Gate (TOAU-36)
-----------------------------------
local ID = require("scripts/zones/Hazhalm_Testing_Grounds/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
require("scripts/globals/einherjar")
-----------------------------------

function onTrade(player,npc,trade)
    local party = player:getParty()
    if player:getCharVar("EinherjarStatus") > 0 and npcUtil.tradeHasExactly(trade, einherjar.SMOULDERING_LAMP) then
    -- TODO: Spawn random mobs from ID table properly upon entry
        for i, v in pairs(ID.mob[1]) do
            SpawnMob(v)
        end    
        if party ~= nil then
            for _,v in ipairs(party) do
              v:setPos(315.6180, -216.1000, 59.7922)              
            end
        end
    elseif player:getCharVar("EinherjarStatus") > 0 and npcUtil.tradeHasExactly(trade, einherjar.VALKYRIES_TEAR) then
    elseif player:getCharVar("EinherjarStatus") > 0 and npcUtil.tradeHasExactly(trade, einherjar.VALKYRIES_WING) then
    elseif player:getCharVar("EinherjarStatus") > 0 and npcUtil.tradeHasExactly(trade, einherjar.VALKYRIES_SOUL) then
    end
end

function onTrigger(player,npc)
    if player:getCurrentMission(TOAU) == GAZE_OF_THE_SABOTEUR and player:getCharVar("AhtUrganStatus") == 1 then
        player:startEvent(7)
    else
        player:messageSpecial(ID.text.BCNM_SEALED)
    end
end

function onEventUpdate(player,csid,option)
    --[[
        if csid == 2 then -- registering
        local party = player:getParty()

        if party ~= nil then
            for _,v in ipairs(party) do
                if v:getZoneID() ~= player:getZoneID() or v:checkDistance(player) > 50 then
                    player:messageText(player, zones[player:getZoneID()].text.MEMBER_TOO_FAR, false)
                    player:instanceEntry(target,1)
                    return
                end
            end
        end
        player:createInstance(99, 78)
    end
    ]]
end

function onEventFinish(player,csid,option)
    if csid == 7 then
        player:completeMission(TOAU,GAZE_OF_THE_SABOTEUR);
        player:setCharVar("AhtUrganStatus",0);
        player:setTitle(tpz.title.EMISSARY_OF_THE_EMPRESS);
        player:addKeyItem(tpz.ki.LUMINIAN_DAGGER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,tpz.ki.LUMINIAN_DAGGER);
        player:addMission(TOAU,PATH_OF_BLOOD);
    end
end
