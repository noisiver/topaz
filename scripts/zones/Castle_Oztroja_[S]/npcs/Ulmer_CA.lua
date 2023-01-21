-----------------------------------
-- Area: Castle Oztroja [S]
--  NPC: Ulmer, C.A.
-- Type: Campaign Arbiter
-- !pos TODO
-----------------------------------
require("scripts/globals/campaign")
require("scripts/globals/npc_util")
require("scripts/globals/salvage")
-----------------------------------

local campaignEvent = 457

function onTrade(player, npc, trade)
    if player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_I) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_II) and
        player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_III) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_IV) and
        player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_V) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_VI) and
        player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_VII) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_VIII) then
        if npcUtil.tradeHas(trade, tpz.items.GIL) then
            player:PrintToPlayer("Off you go!",0, "Ulmer, C.A.")
            local zonePlayers = player:getZone():getPlayers()
            for _, zonePlayer in pairs(zonePlayers) do
                zonePlayer:setPos(-100.000,-72.627,-20.000, 0, 99)
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
