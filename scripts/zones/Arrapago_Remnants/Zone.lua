-----------------------------------
--
-- Zone: Arrapago Remnants
--
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, 420, 5, -339, 0, 0, 0)
    zone:registerRegion(2, 420, 5, -499, 0, 0, 0)
    zone:registerRegion(3, 259, 5, -499, 0, 0, 0)
    zone:registerRegion(4, 259, 5, -339, 0, 0, 0) -- 1st floor G-7 Teleporter
    zone:registerRegion(5, 340, 5, 100, 0, 0, 0) -- 2nd floor H-8 2nd floor middle room teleporter
    zone:registerRegion(6, 339, 5, 419, 0, 0, 0) -- 3rd floor H-9 south teleporter
    zone:registerRegion(7, 339, 5, 500, 0, 0, 0) -- 3rd floor H-8 north teleporter
    zone:registerRegion(8, -379, 5, -620, 0, 0, 0) -- 4th Floor H-9 Teleporter
    zone:registerRegion(9, -300, 5, -461, 0, 0, 0) -- 4th Floor I-7 Teleporter
    zone:registerRegion(10, -339, 5, -99, 0, 0, 0) 
    zone:registerRegion(11, -339, 5, 300, 0, 0, 0)
    zone:registerRegion(12, 319, 8, -378, 0, 0, 0) -- First "forced" teleport to Crab
    zone:registerRegion(13, 280, 8, -380, 0, 0, 0) -- Second "forced" teleport to Leech
    zone:registerRegion(14, 319, 8, -460, 0, 0, 0) -- Third "forced" teleport to Kraken
end

function onInstanceZoneIn(player, instance)
    local cs = -1

    local pos = player:getPos()
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        local entrypos = instance:getEntryPos()
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot)
    end
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    local instance = player:getInstance()
    local chars = instance:getChars()

    if csid == 1 then
        for i, v in pairs(chars) do
            v:setPos(0, 0, 0, 0, 72)
        end
    elseif csid >= 200 and csid <= 210 and option == 1 then
        for i, v in ipairs(chars) do
            if v:getID() ~= player:getID() then
                v:startEvent(3)
                v:timer(4000, function(player)
                    player:setPos(pos.x, pos.y, pos.z, pos.rot)
                end)
            end
            v:setHP(v:getMaxHP())
            v:setMP(v:getMaxMP())
            if v:getPet() then
                local pet = v:getPet()
                pet:setHP(pet:getMaxHP())
                pet:setMP(pet:getMaxMP())
            end
        end
    end
end

function onInstanceLoadFailed()
    return 72
end
