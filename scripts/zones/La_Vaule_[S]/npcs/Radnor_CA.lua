-----------------------------------
-- Area: Jugner Forest [S]
--  NPC: Radnor, C.A.
-- Type: Campaign Arbiter
-- !pos TODO
-----------------------------------
require("scripts/globals/campaign")
require("scripts/globals/npc_util")
-----------------------------------

local campaignEvent = 457

function onTrade(player, npc, trade)
    if player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_I) and player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_II) and
        player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_III) and player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_IV) and
        player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_V) and player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_VI) and
        player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_VII) and player:hasKeyItem(tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_VIII) then
        if npcUtil.tradeHas(trade, tpz.items.GIL) then
            player:PrintToPlayer("Off you go!",0, "Ulmer, C.A.")
            local zonePlayers = player:getZone():getPlayers()
            for _, zonePlayer in pairs(zonePlayers) do
                zonePlayer:setPos(-114.386,-3.599,-179.804, 0, 85)
            end
        end
    end
    if player:hasKeyItem(tpz.keyItem.TIGRIS_STONE) then
        if npcUtil.tradeHas(trade, tpz.items.GIL) then
            player:PrintToPlayer("Off you go!",0, "Ulmer, C.A.")
            local zonePlayers = player:getZone():getPlayers()
            for _, zonePlayer in pairs(zonePlayers) do
                zonePlayer:setPos(-114.386,-3.599,-179.804, 0, 85)
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
