-----------------------------------
--
-- Zone: Beadeaux (147)
--
-----------------------------------
local ID = require("scripts/zones/Beadeaux/IDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/treasure")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/zone")
require("scripts/globals/ability")
require("scripts/globals/msg")
-----------------------------------

function onInitialize(zone)
    -- Regions 1-6 are for the Afflictor System (RegionID, X, Radius, Z)
    zone:registerRegion(1, -163, 10, -137, 0, 0, 0)
    zone:registerRegion(2, -209, 10, -131, 0, 0, 0)
    -- afflictor 3 and 4 have areas on map above them, so we won't use cylinders and use box regions instead.
    zone:registerRegion(3, -150, 16, 10, -130, 28, 32)
    zone:registerRegion(4, 251, 30, 130, 271, 50, 150)
    zone:registerRegion(5,  340, 10,  100, 0, 0, 0)
    zone:registerRegion(6,  380, 10,   60, 0, 0, 0)

    tpz.treasure.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(387.382, 38.029, 19.694, 3)
    end

    if prevZone == tpz.zone.PASHHOW_MARSHLANDS then
        if player:getQuestStatus(BASTOK, tpz.quest.id.bastok.BLADE_OF_DARKNESS) == QUEST_ACCEPTED and player:getCharVar("ChaosbringerKills") >= 100 then
            cs = 121
        elseif player:getCurrentMission(BASTOK) == tpz.mission.id.bastok.THE_FOUR_MUSKETEERS and player:getCharVar("MissionStatus") == 1 then
            cs = 120
        elseif player:getMainJob() == tpz.job.DRK and player:getQuestStatus(BASTOK, tpz.quest.id.bastok.DARK_PUPPET) == QUEST_COMPLETED and player:getQuestStatus(BASTOK, tpz.quest.id.bastok.BLADE_OF_EVIL) == QUEST_AVAILABLE then
            cs = 122
        end
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
    if region:GetRegionID() <= 6 then
        if not player:hasStatusEffect(tpz.effect.CURSE_I)
        and not player:hasStatusEffect(tpz.effect.SILENCE)
        and not player:hasStatusEffect(tpz.effect.MUTE)  then
            local animationId = 257
            player:injectActionPacket(tpz.action.MAGIC_FINISH, animationId, tpz.specEffect.NONE, tpz.reaction.HIT, tpz.msg.basic.NONE)
            player:addStatusEffect(tpz.effect.CURSE_I, 70, 0, math.random(240, 480))
            -- Display messages for being cursed
            player:messageSpecial(ID.text.YOU_FEEL_COLD)
            player:messageSpecial(math.random(7335, 7336))
            if player:getQuestStatus(BASTOK, tpz.quest.id.bastok.THE_CURSE_COLLECTOR) == QUEST_ACCEPTED and player:getCharVar("cCollectCurse") == 0 then
                player:setCharVar("cCollectCurse", 1)
            end
        else
            player:messageSpecial(ID.text.YOU_FEEL_COLD)
            player:messageSpecial(ID.text.YOU_FEEL_A_LITTLE_LIGHT_HEADED)
        end
    end
end

function onRegionLeave(player, region)
    if region:GetRegionID() <= 6 then
        -- Message displayed when getting out of range of The Afflictor if the curse was avoided by having silence/mute
        if not player:hasStatusEffect(tpz.effect.CURSE_I) then
            player:messageSpecial(ID.text.YOU_FEEL_NORMAL_AGAIN)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 121 and npcUtil.completeQuest(player, BASTOK, tpz.quest.id.bastok.BLADE_OF_DARKNESS, {title=tpz.title.DARK_SIDER, var="ZeruhnMines_Zeid_CS"}) then
        player:unlockJob(tpz.job.DRK)
        player:messageSpecial(ID.text.YOU_CAN_NOW_BECOME_A_DARK_KNIGHT)
    elseif csid == 120 then
        player:setCharVar("MissionStatus", 2)
        player:setPos(-297, 1, 96, 1)
    elseif csid == 122 then
        player:addQuest(BASTOK, tpz.quest.id.bastok.BLADE_OF_EVIL)
    end
end
