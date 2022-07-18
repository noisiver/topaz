-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Wenonah, C.A.
-- Type: Campaign Arbiter
-- !pos -2.175 -2 10.184 94
-----------------------------------
require("scripts/globals/campaign")
-----------------------------------

local teleporterNation = tpz.alliedNation.WINDURST
local teleporterEvent  = 458

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCampaignAllegiance() == 0 then
        -- player not allied with any WotG nation
        player:startEvent(459) -- Civilian
    else
        tpz.campaign.teleporterOnTrigger(player, teleporterNation, teleporterEvent)
    end
end

function onEventUpdate(player, csid, option)
    tpz.campaign.teleporterOnEventUpdate(player, csid, option, teleporterNation, teleporterEvent)
end

function onEventFinish(player, csid, option)
    tpz.campaign.teleporterOnEventFinish(player, csid, option, teleporterNation, teleporterEvent)
end
