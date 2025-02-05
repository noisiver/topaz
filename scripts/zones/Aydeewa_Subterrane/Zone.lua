-----------------------------------
--
-- Zone: Aydeewa_Subterrane (68)
--
-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, 378, -3, 338, 382, 3, 342)
    zone:registerRegion(2, -389.242, 13, -445.296, -382.456, 15, -434.242) -- What Friends are For
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(356.503, -0.364, -179.607, 122)
    end

    if player:getCurrentMission(TOAU) == tpz.mission.id.toau.TEAHOUSE_TUMULT and player:getCharVar("AhtUrganStatus") == 0 then
        cs = 10
    end

    return cs
end

function onRegionEnter(player, region)
    if region:GetRegionID() == 1 then
        local StoneID = player:getCharVar("EmptyVesselStone")
        if player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.AN_EMPTY_VESSEL) == QUEST_ACCEPTED and player:getCharVar("AnEmptyVesselProgress") == 4 and player:hasItem(StoneID) then
            player:startEvent(3, StoneID)
        end
    elseif region:GetRegionID() == 2 then
        if (player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.WHAT_FRIENDS_ARE_FOR) == QUEST_AVAILABLE) and (player:getCharVar("WhatFriendsAreFor") == 0) then
            player:delStatusEffect(tpz.effect.INVISIBLE)
            player:startEvent(7)
        end
    end
end

function onGameDay()
    -- move damp soil
    local positions =
    {
        {-302.285,36.687,-32.392},
        {-308.9644,  36.7856,   -1.1265},
        {-314.3235,  36.9701,  -15.5626},
        {-272.4044,  36.5532,  -64.8852},
        {-274.8207,  36.7241,  -96.9227},
        {-260.1673,  36.2386,  -27.9922},
        {-276.5262,  36.7957,  -96.8899},
    }
    local newPosition = npcUtil.pickNewPosition(ID.npc.DAMPSOIL, positions)
    GetNPCByID(ID.npc.DAMPSOIL):setPos(newPosition.x, newPosition.y, newPosition.z)
end

function onRegionLeave(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if
        csid == 3 and
        option == 13 and
        npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.AN_EMPTY_VESSEL, {title=tpz.title.BEARER_OF_THE_MARK_OF_ZAHAK, ki=tpz.ki.MARK_OF_ZAHAK, var={"AnEmptyVesselProgress", "EmptyVesselStone"}})
    then -- Accept and unlock
        player:unlockJob(tpz.job.BLU)
        player:setPos(148, -2, 0, 130, 50)
    elseif csid == 3 and option ~= 13 then -- Make a mistake and get reset
        player:setCharVar("AnEmptyVesselProgress", 0)
        player:setCharVar("EmptyVesselStone", 0)
        player:delQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.AN_EMPTY_VESSEL)
        player:setPos(148, -2, 0, 130, 50)
    elseif csid == 7 then
        player:setCharVar("WhatFriendsAreFor", 1)
    elseif csid == 10 then
        player:setCharVar("AhtUrganStatus", 1)
    end
end
