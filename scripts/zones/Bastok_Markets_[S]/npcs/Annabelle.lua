-- Area: Bastok Markets [S] (H-10)
--  NPC: Annabelle
-- Type: Campaign Rank Up NPC
-- !pos -294.363 -11.999 -72.077 87
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/titles")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local rankUpPoints = player:getCharVar("CampaignPromotion")
    printf("rankUpPoints %s", rankUpPoints)
    if player:hasKeyItem(tpz.ki.MEDAL_OF_ALTANA) then -- Already max rank
        player:PrintToPlayer("You are a well decorated war general. Thank you for your service",0,"Annabelle")
    elseif (rankUpPoints >= 50 and rankUpPoints < 100) then -- 50-99 rank points message
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
    elseif (rankUpPoints >= 100 and rankUpPoints < 150) then -- 100-149 rank pooints message
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.BRASS_RIBBON_OF_SERVICE) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BRASS_RIBBON_OF_SERVICE)
        player:delKeyItem(tpz.ki.BRASS_RIBBON_OF_SERVICE -1)
        player:addKeyItem(tpz.ki.BRASS_RIBBON_OF_SERVICE)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.ALLIED_RIBBON_OF_BRAVERY) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.ALLIED_RIBBON_OF_BRAVERY)
        player:delKeyItem(tpz.ki.ALLIED_RIBBON_OF_BRAVERY -1)
        player:addKeyItem(tpz.ki.ALLIED_RIBBON_OF_BRAVERY)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.ALLIED_RIBBON_OF_GLORY) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.ALLIED_RIBBON_OF_GLORY)
        player:delKeyItem(tpz.ki.ALLIED_RIBBON_OF_GLORY -1)
        player:addKeyItem(tpz.ki.ALLIED_RIBBON_OF_GLORY)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.BRONZE_STAR) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BRONZE_STAR)
        player:delKeyItem(tpz.ki.BRONZE_STAR -1)
        player:addKeyItem(tpz.ki.BRONZE_STAR)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.STERLING_STAR) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.STERLING_STAR)
        player:delKeyItem(tpz.ki.STERLING_STAR -1)
        player:addKeyItem(tpz.ki.STERLING_STAR)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.MYTHRIL_STAR) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MYTHRIL_STAR)
        player:delKeyItem(tpz.ki.MYTHRIL_STAR -1)
        player:addKeyItem(tpz.ki.MYTHRIL_STAR)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.GOLDEN_STAR) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.GOLDEN_STAR)
        player:delKeyItem(tpz.ki.GOLDEN_STAR -1)
        player:addKeyItem(tpz.ki.GOLDEN_STAR)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.COPPER_EMBLEM_OF_SERVICE) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.COPPER_EMBLEM_OF_SERVICE)
        player:delKeyItem(tpz.ki.COPPER_EMBLEM_OF_SERVICE -1)
        player:addKeyItem(tpz.ki.COPPER_EMBLEM_OF_SERVICE)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.IRON_EMBLEM_OF_SERVICE) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.IRON_EMBLEM_OF_SERVICE)
        player:delKeyItem(tpz.ki.IRON_EMBLEM_OF_SERVICE -1)
        player:addKeyItem(tpz.ki.IRON_EMBLEM_OF_SERVICE)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.STEELKNIGHT_EMBLEM) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.STEELKNIGHT_EMBLEM)
        player:delKeyItem(tpz.ki.STEELKNIGHT_EMBLEM -1)
        player:addKeyItem(tpz.ki.STEELKNIGHT_EMBLEM)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.HOLYKNIGHT_EMBLEM) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.HOLYKNIGHT_EMBLEM)
        player:delKeyItem(tpz.ki.HOLYKNIGHT_EMBLEM -1)
        player:addKeyItem(tpz.ki.HOLYKNIGHT_EMBLEM)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.BRASS_WINGS_OF_SERVICE) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BRASS_WINGS_OF_SERVICE)
        player:delKeyItem(tpz.ki.BRASS_WINGS_OF_SERVICE -1)
        player:addKeyItem(tpz.ki.BRASS_WINGS_OF_SERVICE)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.MYTHRIL_WINGS_OF_SERVICE) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MYTHRIL_WINGS_OF_SERVICE)
        player:delKeyItem(tpz.ki.MYTHRIL_WINGS_OF_SERVICE -1)
        player:addKeyItem(tpz.ki.MYTHRIL_WINGS_OF_SERVICE)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.WINGS_OF_INTEGRITY) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.WINGS_OF_INTEGRITY)
        player:delKeyItem(tpz.ki.WINGS_OF_INTEGRITY -1)
        player:addKeyItem(tpz.ki.WINGS_OF_INTEGRITY)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.WINGS_OF_HONOR) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.WINGS_OF_HONOR)
        player:delKeyItem(tpz.ki.WINGS_OF_HONOR -1)
        player:addKeyItem(tpz.ki.WINGS_OF_HONOR)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.STARLIGHT_MEDAL) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.STARLIGHT_MEDAL, tpz.ki.STARLIGHT_MEDAL)
        player:delKeyItem(tpz.ki.ALLIED_RIBBON_OF_BRAVERY -1)
        player:addKeyItem(tpz.ki.STARLIGHT_MEDAL)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.MOONLIGHT_MEDAL) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MOONLIGHT_MEDAL)
        player:delKeyItem(tpz.ki.MOONLIGHT_MEDAL -1)
        player:addKeyItem(tpz.ki.MOONLIGHT_MEDAL)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.DAWNLIGHT_MEDAL) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.DAWNLIGHT_MEDAL)
        player:delKeyItem(tpz.ki.DAWNLIGHT_MEDAL -1)
        player:addKeyItem(tpz.ki.DAWNLIGHT_MEDAL)
        player:setCharVar("CampaignPromotion", 0)
    elseif (rankUpPoints >= 150 and player:hasKeyItem(tpz.ki.MEDAL_OF_ALTANA) == false) then
        player:PrintToPlayer("Congratulations, you have ranked up!",0,"Annabelle")
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MEDAL_OF_ALTANA)
        player:delKeyItem(tpz.ki.MEDAL_OF_ALTANA -1)
        player:addKeyItem(tpz.ki.MEDAL_OF_ALTANA)
        player:setCharVar("CampaignPromotion", 0)
    else
        player:PrintToPlayer("You have not done enough for us to recieve a prmotion. Get back out there!",0,"Annabelle")
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end