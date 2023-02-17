-----------------------------------
-- Area: Beadeaux [S]
--  NPC: Thurlow, C.A.
-- Type: Campaign Arbiter
-- !pos TODO
-----------------------------------
require("scripts/globals/campaign")
require("scripts/globals/npc_util")
-----------------------------------

local campaignEvent = 457

function onTrade(player, npc, trade)
    if player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_I) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_II) and
        player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_III) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_IV) and
        player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_V) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_VI) and
        player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_VII) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_VIII) then
        if npcUtil.tradeHas(trade, tpz.items.GIL) then
            player:PrintToPlayer("Off you go!",0, "Ulmer, C.A.")
            local zonePlayers = player:getZone():getPlayers()
            for _, zonePlayer in pairs(zonePlayers) do
                zonePlayer:setPos(299.6108,39.8468,37.84, 59, 92)
            end
        end
    end
    if player:hasKeyItem(tpz.keyItem.DIAMOND_SEAL) then
        if npcUtil.tradeHas(trade, tpz.items.GIL) then
            player:PrintToPlayer("Off you go!",0, "Ulmer, C.A.")
            local zonePlayers = player:getZone():getPlayers()
            for _, zonePlayer in pairs(zonePlayers) do
                zonePlayer:setPos(299.6108,39.8468,37.84, 59, 0, 92)
            end
        end
    end
end

function onTrigger(player, npc)
    if player:getCampaignAllegiance() == 0 then
        player:startEvent(453)
    else
        tpz.campaign.campaignArbiterOnTrigger(player, npc, campaignEvent)        
    end
end

function onEventUpdate(player, csid, option)
    tpz.campaign.campaignArbiterOnEventUpdate(player, csid, option, campaignEvent)
end

function onEventFinish(player, csid, option)
    tpz.campaign.campaignArbiterOnEventFinish(player, csid, option, campaignEvent)
end
