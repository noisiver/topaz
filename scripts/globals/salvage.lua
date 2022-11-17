-----------------------------------
-- Salvage Utilities
-- desc: Common functionality for Salvage
-- Notes: needs correct csid for align to enter in scripts
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/zone")
require("scripts/globals/world")
-----------------------------------
salvageUtil = {}
-----------------------------------

function salvageUtil.onCellItemCheck(target, effect, value)
    local statusEffect = target:getStatusEffect(effect)
    if statusEffect then
        local power = statusEffect:getPower()
        if bit.band(power, value) > 0 then
            return 0
        end
    end
    return 55
end

function salvageUtil.onCellItemUse(target, effect, value, offset)
    local statusEffect = target:getStatusEffect(effect)
    local power = statusEffect:getPower()
    local newpower = bit.band(power, bit.bnot(value))
    local pet = target:getPet()

    target:delStatusEffectSilent(effect)
    if newpower > 0 then
        local duration = math.floor(statusEffect:getTimeRemaining()/1000)
        target:addStatusEffectEx(effect, effect, newpower, 0, duration)
    end
    if pet ~= nil and effect == tpz.effect.DEBILITATION then
        pet:delStatusEffectSilent(effect)
        if newpower > 0 then
            local duration = math.floor(statusEffect:getTimeRemaining()/1000)
            pet:addStatusEffectEx(effect, effect, newpower, 0, duration)
        end
    end
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + offset)
end


function salvageUtil.onSalvageTrigger(player, npc, CSID, indexID)
    if player:hasKeyItem(tpz.ki.REMNANTS_PERMIT) or player:getGMLevel() > 1  or IsTestServer() then
        local mask = -2
        if player:getMainLvl() >= 96 then
            mask = -14
        elseif player:getMainLvl() >= 65 then
            mask = -6
        end

        player:startEvent(CSID, 0, mask, 0, 0, indexID)
    else
        player:messageText(player, zones[player:getZoneID()].text.NOTHING_HAPPENS)
    end
end

function salvageUtil.onSalvageUpdate(player, csid, option, target, shiftID, zoneID)
    local instanceid = bit.rshift(option, 19) + shiftID

    local align = player:getAlliance()

    if player:getGMLevel() == 0 and player:getPartySize() < 6 and not IsTestServer() then
        player:messageSpecial(zones[player:getZoneID()].text.PARTY_MIN_REQS, 3)
        player:instanceEntry(target,1)
        return
    end

    if player:getGMLevel() == 0 and not IsTestServer() then
        for i, players in ipairs(align) do
            if not players:hasKeyItem(tpz.ki.REMNANTS_PERMIT) then
                player:messageText(player, zones[player:getZoneID()].text.MEMBER_NO_REQS, false)
                player:instanceEntry(target, 1)
                return
            elseif players:getZoneID() ~= player:getZoneID() or players:checkDistance(player) > 50 then
                player:messageText(player, zones[player:getZoneID()].text.MEMBER_TOO_FAR, false)
                player:instanceEntry(target, 1)
                return
            elseif (players:checkImbuedItems()) then
                player:messageText(player, zones[player:getZoneID()].text.MEMBER_IMBUED_ITEM, false)
                player:instanceEntry(target, 1)
                return
            end
        end
    end

    player:createInstance(instanceid, zoneID)
end

function salvageUtil.onInstanceCreated(player, target, instance, endID, destinationID)
    local ID = zones[player:getZoneID()]

    if instance then
        player:setInstance(instance)
        player:instanceEntry(target, 4)
        player:delKeyItem(tpz.ki.REMNANTS_PERMIT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED +1, tpz.ki.REMNANTS_PERMIT)
        player:setLocalVar("Area", destinationID)

        local align = player:getAlliance()
        local initiator = player:getID()
        local Pzone = player:getZoneID()

        if align ~= nil then
            for i, players in ipairs(align) do
                if players:getID() ~= initiator and players:getZoneID() == Pzone then
                    players:setLocalVar("Area", destinationID)
                    players:setInstance(instance)
                    players:startEvent(endID, destinationID)
                    players:delKeyItem(tpz.ki.REMNANTS_PERMIT)
                    players:messageSpecial(ID.text.KEYITEM_OBTAINED +1, tpz.ki.REMNANTS_PERMIT)
                end
            end
        end
    else
        player:messageText(player, zones[player:getZoneID()].text.CANNOT_ENTER, false)
        player:instanceEntry(target, 3)
    end
end

function salvageUtil.afterInstanceRegister(player, fireFlies, mapID)
    local instance = player:getInstance()
    local ID = zones[player:getZoneID()]
    -- Fireflies
    -- CAGE_OF_Z_REMNANTS_FIREFLIES 
    -- CAGE_OF_A_REMNANTS_FIREFLIES
    -- CAGE_OF_B_REMNANTS_FIREFLIES
    -- CAGE_OF_S_REMNANTS_FIREFLIES 

    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
    player:messageSpecial(ID.text.SALVAGE_START, 1)
    --player:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, 0xFFFF, 0, 6000)
    player:addStatusEffectEx(tpz.effect.OBLIVISCENCE, tpz.effect.OBLIVISCENCE, 1, 0, 6000)
    --player:addStatusEffectEx(tpz.effect.OMERTA, tpz.effect.OMERTA, 0x3F, 0, 6000)
    --player:addStatusEffectEx(tpz.effect.IMPAIRMENT, tpz.effect.IMPAIRMENT, 3, 0, 6000)
    --player:addStatusEffectEx(tpz.effect.DEBILITATION, tpz.effect.DEBILITATION, 0x1FF, 0, 6000)
    player:addTempItem(fireFlies)
    player:addKeyItem(mapID)

    --for i = tpz.slot.MAIN, tpz.slot.BACK do
      --  player:unequipItem(i)
    --end
end

function salvageUtil.onDoorOpen(npc, stage, progress)
    local instance = npc:getInstance()
    if stage ~= nil then
        instance:setStage(stage)
    end
    if progress ~= nil then
        instance:setProgress(progress)
    end
    npc:setAnimation(8)
    npc:untargetable(true)
end

function salvageUtil.doorsUntargetable(npc, indexID)
    local instance = npc:getInstance()

    if type(indexID) == "table" then
        for i,v in pairs(indexID) do
            local door = instance:getEntity(bit.band(v, 0xFFF), tpz.objType.NPC)
            door:untargetable(true)
        end
    else
        local door = instance:getEntity(bit.band(indexID, 0xFFF), tpz.objType.NPC)
        door:untargetable(true)
    end
end

function salvageUtil.sealDoors(entity, indexID)
    local instance = entity:getInstance()

    if type(indexID) == "table" then
        for i,v in pairs(indexID) do
            local door = instance:getEntity(bit.band(v, 0xFFF), tpz.objType.NPC)
            door:setLocalVar("unSealed", 0)
        end
    else
        local door = instance:getEntity(bit.band(indexID, 0xFFF), tpz.objType.NPC)
        door:setLocalVar("unSealed", 0)
    end
end

function salvageUtil.unsealDoors(entity, indexID)
    local instance = entity:getInstance()

    if type(indexID) == "table" then
        for i,v in pairs(indexID) do
            local door = instance:getEntity(bit.band(v, 0xFFF), tpz.objType.NPC)
            door:setLocalVar("unSealed", 1)
        end
    else
        local door = instance:getEntity(bit.band(indexID, 0xFFF), tpz.objType.NPC)
        door:setLocalVar("unSealed", 1)
    end
end

------------------------------------------------------------------------------------------
-- Temp item Armoury Crate functions and tables
------------------------------------------------------------------------------------------
local tempItems = {
    4146, -- Revitalizer (available in chests in addition to all the buyable temps)
    4147, -- Body Boost
    4200, -- Mana Boost
    5385, -- Barbarian
    5386, -- Fighter
    5387, -- Oracle
    5388, -- Assasin
    5389, -- Spy
    5390, -- Braver
    5391, -- Soldier
    5392, -- Champion
    5393, -- Monarch
    5394, -- Gnostic
    5395, -- Cleric
    5396, -- Shepard
    5397, -- Sprinter
    5431, -- Dusty Poition
    5432, -- Dusty Ether
    5433, -- Dusty Elixir
    5434, -- Fanatics
    5435, -- Fools 
    5436, -- Dusty Reraise
    5437, -- Strange Milk
    5438, -- Strange Juice
    5439, -- Vicars
    5440, -- Dusty Wing
}

------------------------------------------------------------------------------------------
-- Finds an available Armoury Crate NPC
-- returns the available crate NPC or nil if one is not available
------------------------------------------------------------------------------------------
local function getAvailableCrateNPC(mob)
    local instance = mob:getInstance()
    local ID = zones[mob:getZoneID()]
    local crateNPC = nil
    local possibleCrates = {}

    possibleCrates = ID.armoury_crates

    for _,v in pairs(possibleCrates) do
        local npc = GetNPCByID(v, instance)
        if (npc ~= nil and npc:getStatus() ~= tpz.status.NORMAL) then
            
            crateNPC = npc
            break
        end
    end
    return crateNPC
end

function salvageUtil.spawnArmouryCrateOnMobDeath(mob, x, y, z, r)
    local npc = getAvailableCrateNPC(mob)

    if npc == nil then
        return
    end

    npc:resetLocalVars()
    npc:setAnimation(0)
    npc:AnimationSub(12)
    npc:setPos(x, y, z, r)
    npc:setStatus(tpz.status.NORMAL)
    npc:setLocalVar("Salvage_CrateItem1", tempItems[math.random(#tempItems)]) -- TODO Multiple items
    npc:setLocalVar("Salvage_Quantity1", math.random(1, 3)) -- TODO: Customizable amount of quantity
    npc:entityAnimationPacket("deru")
end

----------------------------------------------------------------------------------
-- Despawn the Crate and reset Local Vars
----------------------------------------------------------------------------------
function salvageUtil.despawnArmouryCrate(npc)
    npc:resetLocalVars()
    npc:timer(1000, function(npc) npc:entityAnimationPacket("kesu") end)
    npc:timer(2000, function(npc) npc:setStatus(tpz.status.DISAPPEAR) end)
end

----------------------------------------------------------------------------------
--  Will return the item from the crate by index - or 0
----------------------------------------------------------------------------------
local function getTempItemFromCrate(npc, index)
    local tempItems = {}
    local crateItemVarName
    local itemID = 0
    
    for i=1,8 do
        crateItemVarName = string.format("Salvage_CrateItem" ..i.. "")
        itemID = npc:getLocalVar(crateItemVarName)
        if (itemID > 0) then
            table.insert(tempItems, itemID)
        end
    end

    if (#tempItems == 0 or index > #tempItems) then
        return 0
    end

    return tempItems[index]
end

----------------------------------------------------------------------------------
--  Will remove the item crate
----------------------------------------------------------------------------------
local function removeTempItemFromCrate(npc, itemIDToRemove)
    local tempItems = {}
    local crateItemVarName
    local itemID = 0
    local quantity1 = npc:getLocalVar("Salvage_Quantity1") -- TODO: multiple items

    for i=1,8 do
        crateItemVarName = string.format("Salvage_CrateItem" ..i.. "")
        itemID = npc:getLocalVar(crateItemVarName)
        if (itemID == itemIDToRemove) and (quantity1 == 0) then -- TODO: multiple items
            npc:setLocalVar(crateItemVarName, 0)
            break
        end
    end
end

----------------------------------------------------------------------------------
-- Checks if a temp item crate is empty and despawns if it is
----------------------------------------------------------------------------------
local function checkTempItemChestIsEmpty(npc)
    local item1 = npc:getLocalVar("Salvage_CrateItem1")
    local item2 = npc:getLocalVar("Salvage_CrateItem2")
    local item3 = npc:getLocalVar("Salvage_CrateItem3")
    local item4 = npc:getLocalVar("Salvage_CrateItem4")
    local item5 = npc:getLocalVar("Salvage_CrateItem5")
    local item6 = npc:getLocalVar("Salvage_CrateItem6")
    local item7 = npc:getLocalVar("Salvage_CrateItem7")
    local item8 = npc:getLocalVar("Salvage_CrateItem8")
    local quantity1 = npc:getLocalVar("Salvage_Quantity1")
    local quantity2 = npc:getLocalVar("Salvage_Quantity2")
    local quantity3 = npc:getLocalVar("Salvage_Quantity3")
    local quantity4 = npc:getLocalVar("Salvage_Quantity4")
    local quantity5 = npc:getLocalVar("Salvage_Quantity5")
    local quantity6 = npc:getLocalVar("Salvage_Quantity6")
    local quantity7 = npc:getLocalVar("Salvage_Quantity7")
    local quantity8 = npc:getLocalVar("Salvage_Quantity8")

    if (item1 == 0 and item2 == 0 and item3 == 0 and item4 == 0 and
        item5 == 0 and item6 == 0 and item7 == 0 and item8 == 0 and
        quantity1 == 0 and quantity2 == 0 and quantity3 == 0 and quantity4 == 0 and
        quantity5 == 0 and quantity6 == 0 and quantity7 == 0 and quantity8 == 0) then
        salvageUtil.despawnArmouryCrate(npc)
    end
end

-- Called when an armoury crate is triggered
------------------------------------------------------------------------------------------
function salvageUtil.ArmouryCrateonTrigger(player, npc)
    local nmCrateID = npc:getLocalVar("Salvage_CrateNmId")
    if(npc:AnimationSub() ~= 13) then
        npc:AnimationSub(13)
    end

    if(nmCrateID > 0) then -- TODO: Uneeded?
        local chars = player:getInstance():getChars()
        if (npc:getLocalVar("Salvage_CrateNmId") > 0 and player:addItem(appraisalMappings[nmCrateID])) then
            for _, v in pairs(chars) do
                v:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, appraisalMappings[nmCrateID].id)
            end
            salvageUtil.despawnArmouryCrate(npc)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, appraisalMappings[nmCrateID].id)
        end
    else
        local locked = npc:getLocalVar("Salvage_ArmouryCrateLock")
        if (locked > 0) then
            player:PrintToPlayer("Armoury Crates are locked while players are using the Rune Of Transfer.", 0x1F)
            return
        end

        local item1 = getTempItemFromCrate(npc, 1)
        local item2 = 0
        if (item1 > 0) then item2 = getTempItemFromCrate(npc, 2) end
        local item3 = 0
        if (item2 > 0) then item3 = getTempItemFromCrate(npc, 3) end
        local item4 = 0
        if (item3 > 0) then item4 = getTempItemFromCrate(npc, 4) end
        local item5 = 0
        if (item4 > 0) then item5 = getTempItemFromCrate(npc, 5) end
        local item6 = 0
        if (item5 > 0) then item6 = getTempItemFromCrate(npc, 6) end
        local item7 = 0
        if (item6 > 0) then item7 = getTempItemFromCrate(npc, 7) end
        local item8 = 0
        if (item7 > 0) then item8 = getTempItemFromCrate(npc, 8) end
        local bitshiftedQuantity1 = bit.lshift(npc:getLocalVar("Salvage_Quantity1"), 16) -- message params are split between hi and lo words. The top 16 bits are npc:getLocalVar("Salvage_QuantityItem1").  The bottom 16 bits are the item id
        local bitshiftedQuantity2 = bit.lshift(npc:getLocalVar("Salvage_Quantity2"), 16)
        local bitshiftedQuantity3 = bit.lshift(npc:getLocalVar("Salvage_Quantity3"), 16)
        local bitshiftedQuantity4 = bit.lshift(npc:getLocalVar("Salvage_Quantity4"), 16)
        local bitshiftedQuantity5 = bit.lshift(npc:getLocalVar("Salvage_Quantity5"), 16)
        local bitshiftedQuantity6 = bit.lshift(npc:getLocalVar("Salvage_Quantity6"), 16)
        local bitshiftedQuantity7 = bit.lshift(npc:getLocalVar("Salvage_Quantity7"), 16)
        local bitshiftedQuantity8 = bit.lshift(npc:getLocalVar("Salvage_Quantity8"), 16)

        local param1 = 0
        local param2 = 0
        local param3 = 0
        local param4 = 0
        local param5 = 0
        local param6 = 0
        local param7 = 0
        local param8 = 0

        if(item1 > 0) then param1 = bitshiftedQuantity1 + item1 end
        if(item2 > 0) then param2 = bitshiftedQuantity2 + item2 end
        if(item3 > 0) then param3 = bitshiftedQuantity3 + item3 end
        if(item4 > 0) then param4 = bitshiftedQuantity4 + item4 end
        if(item5 > 0) then param5 = bitshiftedQuantity5 + item5 end
        if(item6 > 0) then param6 = bitshiftedQuantity6 + item6 end
        if(item7 > 0) then param7 = bitshiftedQuantity7 + item7 end
        if(item8 > 0) then param8 = bitshiftedQuantity0 + item8 end

        player:startEvent(2, param1, param2, param3, param4, param5, param6, param7, param8)
        --giveTempItem
    end
end

------------------------------------------------------------------------------------------
-- Called when an armoury event is updated (which is never)
------------------------------------------------------------------------------------------
function salvageUtil.ArmouryCrateonEventUpdate(player, csid, option)
end

------------------------------------------------------------------------------------------
-- Called when an armoury event is finished
------------------------------------------------------------------------------------------
function salvageUtil.ArmouryCrateonEventFinish(player, csid, option)
    local npc = player:getEventTarget()
    local ID = zones[player:getZoneID()]
    
    if (csid == 2 and option >= 1 and option <= 8) then
        local tempItemID = getTempItemFromCrate(npc, option)

        if tempItemID == 0 then
            return -- possibly multiple players trying to get the same item
        end

        if player:hasItem(tempItemID, 3) then
            player:messageSpecial(ID.text.ALREADY_HAVE_TEMP)
            return 
        elseif (player:addTempItem(tempItemID)) then
            npc:setLocalVar("Salvage_Quantity1", npc:getLocalVar("Salvage_Quantity1") - 1) -- TODO Multiple items
            removeTempItemFromCrate(npc, tempItemID)
            checkTempItemChestIsEmpty(npc)
            local chars = player:getInstance():getChars()
            for _, v in pairs(chars) do
                v:messageName(ID.text.OBTAINED_TEMP_ITEM, player, tempItemID)
            end
        end
    end
end

function salvageUtil.handleSocketCells(mob, player)
    local amount = mob:getLocalVar("Qnt") * 2

    while amount > 0 do
        player:addTreasure(mob:getLocalVar("Cell"), mob)
        amount = amount - 1
    end
end

function salvageUtil.spawnStage(entity)
    local ID = require("scripts/zones/"..entity:getZoneName().."/IDs")
    local instance = entity:getInstance()
    local mobs = ID.mob[instance:getStage()][instance:getProgress()].STAGE_START

    for _, enemies in pairs(mobs) do
        if type(enemies) == "table" then
            for _, groups in pairs(enemies) do
                SpawnMob(groups, instance)
                instance:getEntity(bit.band(groups, 0xFFF), tpz.objType.MOB):setLocalVar("spawned", 1)
            end
        else
            SpawnMob(enemies, instance)
            instance:getEntity(bit.band(enemies, 0xFFF), tpz.objType.MOB):setLocalVar("spawned", 1)
        end
    end
end

function salvageUtil.spawnGroup(entity, groupID)
    local instance = entity:getInstance()

    for _, enemies in pairs(groupID) do
        if type(enemies) == "table" then
            for _, groups in pairs(enemies) do
                SpawnMob(groups, instance)
                instance:getEntity(bit.band(groups, 0xFFF), tpz.objType.MOB):setLocalVar("spawned", 1)
            end
        else
            SpawnMob(enemies, instance)
            instance:getEntity(bit.band(enemies, 0xFFF), tpz.objType.MOB):setLocalVar("spawned", 1)
        end
    end
end

function salvageUtil.deSpawnStage(entity)
    local instance = entity:getInstance()
    local mobs = instance:getMobs()

    for _,enemy in pairs(mobs) do
        local mobID = enemy:getID()
        DespawnMob(mobID, instance)
    end
end

function salvageUtil.groupKilled(entity, indexID)
    local ID = require("scripts/zones/"..entity:getZoneName().."/IDs")
    local instance = entity:getInstance()

    for _, mobID in pairs(indexID) do
        local mobs = instance:getEntity(bit.band(mobID, 0xFFF), tpz.objType.MOB)
        if mobs:getLocalVar("spawned") == 0 then
            return false
        elseif mobs:isAlive() then
            return false
        end
    end
    return true
end

function salvageUtil.removedPathos(entity)
    local count = 0
    local instance = entity:getInstance()
    local Chars = instance:getChars()

    for i, players in pairs(Chars) do
        if not players:hasStatusEffect(tpz.effect.ENCUMBRANCE_I) and not players:hasStatusEffect(tpz.effect.OBLIVISCENCE) and
            not players:hasStatusEffect(tpz.effect.OMERTA) and not players:hasStatusEffect(tpz.effect.IMPAIRMENT) and
            not players:hasStatusEffect(tpz.effect.DEBILITATION) then
                count = count + 1
        end
    end

    return count
end

function salvageUtil.teleportGroup(entity, posx, posy, posz, posrot, self, cs, recover)
    local instance = entity:getInstance()
    local chars = instance:getChars()

    for _, players in pairs(chars) do
        if self then
            if cs then -- TODO maybe need timer with it
                players:startEvent(4)
                players:timer(4000, function(entity)
                    players:setPos(posx + math.random(1, 5), posy, posz +math.random(1, 5), posrot)
                end)
            else
                players:addStatusEffect(tpz.effect.STUN, 1, 0, 5)
                players:setPos(posx + math.random(1, 5), posy, posz +math.random(1, 5), posrot)
            end
        else
            if players:getID() ~= entity:getID() then
                if cs then -- TODO maybe need timer with it
                    players:startEvent(4)
                    players:timer(4000, function(entity)
                        players:setPos(posx + math.random(1, 5), posy, posz +math.random(1, 5), posrot)
                    end)
                else
                    players:addStatusEffect(tpz.effect.STUN, 1, 0, 5)
                    players:setPos(posx + math.random(1, 5), posy, posz +math.random(1, 5), posrot)
                end
            end
        end
        if recover then
            players:setHP(players:getMaxHP())
            players:setMP(players:getMaxMP())
            if players:getPet() then
                local pet = players:getPet()
                pet:setHP(pet:getMaxHP())
                pet:setMP(pet:getMaxMP())
            end
        end
    end
end

function salvageUtil.setGroupVar(entity, var, arg)
    local instance = entity:getInstance()
    local chars = instance:getChars()
    for _, players in pairs(chars) do
        players:setLocalVar(var, arg)
    end
end

function salvageUtil.msgGroup(entity, msg, textcolor, sender)
    if entity == nil then
        return
    end

    local instance = entity:getInstance()
    local chars = instance:getChars()

    --Text color: gold - 0x1F, green - 0x1C, blue - 0xF, white(no sender name) - 0xD
    for _, players in pairs(chars) do
        players:PrintToPlayer(msg, textcolor, sender)
    end
end

function salvageUtil.raiseGroup(instance, posx, posy, posz, posrot, raisetype)
    local chars = instance:getChars()
    local dead = true
    for i, v in pairs(chars) do
        if v:getHP() ~= 0 then
            dead = false
            break
        end
    end
    if dead then
        for i, v in pairs(chars) do
            if v:getLocalVar("GMRaise") == 0 then
                v:setPos(posx + math.random(1, 6), posy, posz + math.random(1, 6), posrot)
                v:sendRaise(raisetype)
                v:delStatusEffect(1)
                v:setMP(3000)
                v:setLocalVar("GMRaise", 1)
                v:PrintToPlayer("You see pink feathers scatter around you...", 0xD, none)
                return true
            end
        end
    else
        return false
    end
end

function salvageUtil.spawnMob(instance, mobId)
    if not GetMobByID(mobId, instance):isSpawned() then
        SpawnMob(mobId, instance)
    end
end

function salvageUtil.spawnMobGroup(instance, mobIdStart, mobIdEnd)
    for i = mobIdStart, mobIdEnd do
        if not GetMobByID(i, instance):isSpawned() then
            SpawnMob(i, instance)
        end
    end
end

-- TODO Add more to this
function salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, chance, mobIdStart, mobIdEnd)
    local ID = zones[player:getZoneID()]
    local instance = mob:getInstance()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    local mobR = mob:getRotPos()
    local selectedEvent = 0
    local event =
    {
        [1] = 'trash',
        [2] = 'boss',
        [3] = 'chest',
        [4] = 'mimic',
        [5] = 'pixie',
        --[6] = 'weather', -- TODO: Instanced cannot get weather...
        --[7] = 216,
        --[8] = 260,
        --[9] = 230,
        --[10] = 254,
    }

    if math.random(100) <= chance then
        selectedEvent = event[math.random(#event)]
    end

    if isKiller or nokiller then
        if (selectedEvent == 'trash') then
            for v = mobIdStart, mobIdEnd do
                SpawnInstancedMob(mob, player, v, true)
                GetMobByID(v, instance):stun(5000)
            end
            salvageUtil.msgGroup(player, "A pack of enemies have appeared!", 0xD, none)
        elseif (selectedEvent == 'boss') then 
            local boss = salvageUtil.getAvailableMob(mob, ID.mob.random_bosses)

            if boss == nil then
                return
            end
            SpawnInstancedMob(mob, player, boss, true)
            GetMobByID(boss, instance):stun(5000)
            salvageUtil.msgGroup(player, MobName(GetMobByID(boss, instance)) .. " has appeared!", 0xD, none)
        elseif (selectedEvent == 'chest') then
            salvageUtil.spawnArmouryCrateOnMobDeath(mob, mobX, mobY, mobZ, mobR)
            salvageUtil.msgGroup(player, "The " .. MobName(mob) .. " dropped a chest!", 0xD, none)
        elseif (selectedEvent == 'mimic') then
            local mimic = salvageUtil.getAvailableMob(mob, ID.mob.mimics)

            if mimic == nil then
                return
            end
            SpawnInstancedMob(mob, player, mimic, false)
            GetMobByID(mimic, instance):stun(10000)
            salvageUtil.msgGroup(player, "The " .. MobName(mob) .. " dropped a chest!", 0xD, none)
        elseif (selectedEvent == 'pixie') then
            salvageUtil.msgGroup(player, "A Pixie has appeared!", 0xD, none)
            SpawnInstancedMob(mob, player, 17081246, true)
        --elseif (selectedEvent == 'weather') then
            --player:setWeather(salvageUtil.getRandomWeather(), instance)
        end
    end
end

function salvageUtil.getAvailableMob(mob, table)
    local instance = mob:getInstance()
    local ID = zones[mob:getZoneID()]
    local selectedMob = nil
    local possibleBosses = {}

    possibleBosses = table

    for _,v in pairs(possibleBosses) do
        local mob = possibleBosses[math.random(#possibleBosses)]
        if (GetMobByID(mob, instance) ~= nil and not GetMobByID(mob, instance):isSpawned()) then
            
            selectedMob = mob
            break
        end
    end
    return selectedMob
end

function salvageUtil.getRandomWeather()
    local weather =
    {
        tpz.weather.HEAT_WAVE, tpz.weather.SQUALL, tpz.weather.SAND_STORM, tpz.weather.GALES, tpz.weather.BLIZZARDS,
        tpz.weather.THUNDERSTORMS, tpz.weather.STELLAR_GLARE, tpz.weather.DARKNESS
    }
    return weather[math.random(#weather)]
end



------------------------------------------------------------------------------------------
-- Below functions are not used and can probably be deleted
------------------------------------------------------------------------------------------

function salvageUtil.onTriggerCrate(player, npc)
    if npc:getLocalVar("open") == 0 then
        local instance = npc:getInstance()
        local FIRST = {tpz.items.CUMULUS_CELL, tpz.items.UNDULATUS_CELL, tpz.items.HUMILUS_CELL, tpz.items.SPISSATUS_CELL}
        local SECOND =
        {
            tpz.items.CASTELLANUS_CELL, tpz.items.RADIATUS_CELL, tpz.items.STRATUS_CELL, tpz.items.CIRROCUMULUS_CELL,
            tpz.items.VIRGA_CELL, tpz.items.PANNUS_CELL, tpz.items.FRACTUS_CELL, tpz.items.CONGESTUS_CELL, tpz.items.NIMBUS_CELL,
            tpz.items.VELUM_CELL, tpz.items.PILEUS_CELL, tpz.items.MEDIOCRIS_CELL
        }

        player:addTreasure(tpz.items.INCUS_CELL, npc)
        player:addTreasure(tpz.items.INCUS_CELL, npc)
        player:addTreasure(tpz.items.DUPLICATUS_CELL, npc)
        player:addTreasure(tpz.items.PRAECIPITATIO_CELL, npc)
        player:addTreasure(tpz.items.OPACUS_CELL, npc)
        player:addTreasure(FIRST[math.random(#FIRST)], npc)
        player:addTreasure(FIRST[math.random(#FIRST)], npc)
        player:addTreasure(SECOND[math.random(#SECOND)], npc)
        player:addTreasure(SECOND[math.random(#SECOND)], npc)

        if math.random(1,2) == 1 then
            player:addTreasure(tpz.items.PRAECIPITATIO_CELL, npc)
        else
            player:addTreasure(tpz.items.OPACUS_CELL, npc)
        end

        npc:entityAnimationPacket("open")
        npc:setLocalVar("open", 1)
        npc:timer(15000, function(npc) npc:entityAnimationPacket("kesu") end)
        npc:timer(16000, function(npc) npc:setStatus(tpz.status.DISAPPEAR) end)
    end
end

function salvageUtil.spawnTempChest(mob, params)
    local ID = require("scripts/zones/"..mob:getZoneName().."/IDs")
    local instance = mob:getInstance()

    for _, casketID in ipairs(ID.npc[0].TEMP_ITEMS_BOX) do
        local casket = instance:getEntity(bit.band(casketID, 0xFFF), tpz.objType.NPC)
        if casket:getStatus() == tpz.status.DISAPPEAR then
            local pos = mob:getPos()
            casket:setPos(pos.x, pos.y, pos.z, pos.rot)
            casket:resetLocalVars()
            casket:setStatus(tpz.status.NORMAL)
            if params.itemID_1 ~= nil then
                casket:setLocalVar("itemID_1", params.itemID_1)
                casket:setLocalVar("itemAmount_1", params.itemAmount_1)
            end
            break
        end
    end
end

function salvageUtil.tempBoxTrigger(player, npc)
    if npc:getLocalVar("itemsPicked") == 0 then
        npc:setLocalVar("itemsPicked", 1)
        npc:entityAnimationPacket("open")
        npc:AnimationSub(13)
        salvageUtil.tempBoxPickItems(npc)
    end

    player:startEvent(2, {[0] = (npc:getLocalVar("itemID_1") + (npc:getLocalVar("itemAmount_1") * 65536)),
    [1] = (npc:getLocalVar("itemID_2") + (npc:getLocalVar("itemAmount_2") * 65536)),
    [2] = (npc:getLocalVar("itemID_3") + (npc:getLocalVar("itemAmount_3") * 65536))})
end

function salvageUtil.tempBoxPickItems(npc)
    local tempBoxItems =
    {
        [1] = {itemID = tpz.items.BOTTLE_OF_BARBARIANS_DRINK, amount = math.random(1,3)},
        [2] = {itemID = tpz.items.BOTTLE_OF_FIGHTERS_DRINK,   amount = math.random(1,3)},
        [3] = {itemID = tpz.items.BOTTLE_OF_ORACLES_DRINK,    amount = math.random(1,3)},
        [4] = {itemID = tpz.items.BOTTLE_OF_ASSASSINS_DRINK,  amount = math.random(1,3)},
        [5] = {itemID = tpz.items.BOTTLE_OF_SPYS_DRINK,       amount = math.random(1,3)},
        [6] = {itemID = tpz.items.BOTTLE_OF_BRAVERS_DRINK,    amount = math.random(1,3)},
        [7] = {itemID = tpz.items.BOTTLE_OF_SOLDIERS_DRINK,   amount = math.random(1,3)},
        [8] = {itemID = tpz.items.BOTTLE_OF_CHAMPIONS_DRINK,  amount = math.random(1,3)},
        [9] = {itemID = tpz.items.BOTTLE_OF_MONARCHS_DRINK,   amount = math.random(1,3)},
        [10] = {itemID = tpz.items.BOTTLE_OF_GNOSTICS_DRINK,  amount = math.random(1,3)},
        [11] = {itemID = tpz.items.BOTTLE_OF_CLERICS_DRINK,   amount = math.random(1,3)},
        [12] = {itemID = tpz.items.BOTTLE_OF_SHEPHERDS_DRINK, amount = math.random(1,3)},
        [13] = {itemID = tpz.items.BOTTLE_OF_SPRINTERS_DRINK, amount = math.random(1,3)},
        [14] = {itemID = tpz.items.FLASK_OF_STRANGE_MILK,     amount = math.random(1,5)},
        [15] = {itemID = tpz.itemsBOTTLE_OF_STRANGE_JUICE,    amount = math.random(1,5)},
        [16] = {itemID = tpz.items.BOTTLE_OF_FANATICS_DRINK,  amount = 1},
        [17] = {itemID = tpz.items.BOTTLE_OF_FOOLS_DRINK,     amount = 1},
        [18] = {itemID = tpz.items.DUSTY_WING,                amount = 1},
        [19] = {itemID = tpz.items.BOTTLE_OF_VICARS_DRINK,    amount = math.random(1,3)},
        [20] = {itemID = tpz.items.DUSTY_POTION,              amount = math.random(1,10)},
        [21] = {itemID = tpz.items.DUSTY_ETHER,               amount= math.random(1,10)},
        [22] = {itemID = tpz.items.DUSTY_ELIXIR,              amount = 1}
    }
    local random = math.random(1,#tempBoxItems)
    local item = tempBoxItems[random]
    local item2_random = math.random(1,10) > 4
    local item3_random = math.random(1,10) > 8

    if npc:getLocalVar("itemID_1") == 0 then
        npc:setLocalVar("itemID_1", item.itemID)
        npc:setLocalVar("itemAmount_1", item.amount)
        table.remove(tempBoxItems, random)
    end

    if item2_random then
        random = math.random(1,#tempBoxItems)
        local item = tempBoxItems[random]

        npc:setLocalVar("itemID_2", item.itemID)
        npc:setLocalVar("itemAmount_2", item.amount)
        table.remove(tempBoxItems, random)
    end
    if item2_random and item3_random then
        random = math.random(1,#tempBoxItems)
        local item = tempBoxItems[random]

        npc:setLocalVar("itemID_3", item.itemID)
        npc:setLocalVar("itemAmount_3", item.amount)
        table.remove(tempBoxItems, random)
    end
end

function salvageUtil.tempBoxFinish(player, csid, option, npc)
    local ID = require("scripts/zones/"..player:getZoneName().."/IDs")

    if csid == 2 then
        local item_1 = npc:getLocalVar("itemID_1")
        local item_2 = npc:getLocalVar("itemID_2")
        local item_3 = npc:getLocalVar("itemID_3")
        if option == 1 and item_1 > 0 then
            if not player:hasItem(item_1, tpz.inventoryLocation.TEMPITEMS) then
                player:addTempItem(item_1)
                player:messageSpecial(ID.text.OBTAINED_TEMP_ITEM, item_1)
                npc:setLocalVar("itemAmount_1", npc:getLocalVar("itemAmount_1") - 1)
            else
                player:messageSpecial(ID.text.ALREADY_HAVE_TEMP)
            end
        elseif option == 2 and item_2 > 0 then
            if not player:hasItem(item_2, tpz.inventoryLocation.TEMPITEMS) then
                player:addTempItem(item_2)
                player:messageSpecial(ID.text.OBTAINED_TEMP_ITEM, item_2)
                npc:setLocalVar("itemAmount_2", npc:getLocalVar("itemAmount_2") - 1)
            else
                player:messageSpecial(ID.text.ALREADY_HAVE_TEMP)
            end
        elseif option == 3 and item_3 > 0 then
            if not player:hasItem(item_3, tpz.inventoryLocation.TEMPITEMS) then
                player:addTempItem(item_3)
                player:messageSpecial(ID.text.OBTAINED_TEMP_ITEM, item_3)
                npc:setLocalVar("itemAmount_3", npc:getLocalVar("itemAmount_3") - 1)
            else
                player:messageSpecial(ID.text.ALREADY_HAVE_TEMP)
            end
        end
        if npc:getLocalVar("itemAmount_1") == 0 and npc:getLocalVar("itemAmount_2") == 0 and npc:getLocalVar("itemAmount_3") == 0 then
            npc:queue(10000, function(npc) npc:entityAnimationPacket("kesu") end)
            npc:queue(12000, function(npc) npc:setStatus(tpz.status.DISAPPEAR) npc:AnimationSub(8) end)
        end
    end
end

function salvageUtil.resetTempBoxes(entity)
    local ID = require("scripts/zones/"..entity:getZoneName().."/IDs")
    local instance = entity:getInstance()

    for _, casketID in ipairs(ID.npc[0].TEMP_ITEMS_BOX) do
        local casket = instance:getEntity(bit.band(casketID, 0xFFF), tpz.objType.NPC)
        if casket:getStatus() == tpz.status.NORMAL then
            casket:setStatus(tpz.status.DISAPPEAR)
            casket:resetLocalVars()
            casket:AnimationSub(8)
        end
    end
end

function salvageUtil.setElementalMods(entity)
    entity:setMod(tpz.mod.UDMGMAGIC, 100)
    entity:setMod(tpz.mod.DMGMB, 100)
end

function salvageUtil.saveFloorProgress(entity)
    local instance = entity:getInstance()
    local zone = entity:getZoneName()
    local floor = instance:getStage()
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:setCharVar(zone, floor)
    end
    salvageUtil.msgGroup(entity, "You are now saved to Floor: " .. "[" .. floor .. "]", 0xD, none)
    --printf("Zone: %s Floor: %s", zone, floor)
end

function salvageUtil.teleportLamponTrigger(entity)
    local zone = entity:getZoneName()
    local floor = entity:getCharVar(zone)

    if (floor > 0) then
        entity:PrintToPlayer("Please trade me 1 gil to teleport to Floor " .. "[" .. floor .. "].",0xD, none)
    else
        entity:PrintToPlayer("A mysterious glowing lamp.",0xD, none)
    end
end

function salvageUtil.teleportToSavedFloor(entity, npc, trade)
    -- Runic lamp IDs
    -- Arrapago Remnants: 17080943
    local ID = zones[entity:getZoneID()]
    local instance = entity:getInstance()
    local zone = entity:getZoneName()
    local floor = entity:getCharVar(zone)

    floorTeleports =
    {
        [1] = {},
        [2] = { math.random(332, 348), -4, 86, 193 },
        [3] = { 339, -0, math.random(456, 464), 129 },
        [4] = { math.random(-342, -335), -0, -580 },
        [5] = { math.random(-303, -298), -0, -19 },
        [6] = { math.random(-343, -333), -0, 219 },
        [7] = { math.random(-343, -333), -0, 619 },
    }
    mobSpawns =
    {
        [1] = {},
        [2] = { ID.mob[2][1].mobs_start, ID.mob[2][1].mobs_end  },
        [3] = { ID.mob[3][1].mobs_start, ID.mob[3][1].mobs_end },
        [4] = { ID.mob[4][1].mobs_start, ID.mob[4][1].mobs_end },
        [5] = { ID.mob[5][1][1].mobs_start, ID.mob[5][1][1].mobs_end },
        [6] = { ID.mob[6][1].mobs_start, ID.mob[6][1].mobs_end },
        [7] = { ID.mob[7][1].chariot, ID.mob[7][1].chariot }, -- TODO: Test
    }

    local posx = floorTeleports[floor][1]
    local posy = floorTeleports[floor][2]
    local posz = floorTeleports[floor][3]
    local rot = floorTeleports[floor][4]

    if npcUtil.tradeHas(trade, tpz.items.GIL) and (floor > 0) then
        salvageUtil.spawnMobGroup(instance, mobSpawns[floor][1], mobSpawns[floor][2])
        instance:setStage(floor)
        instance:setProgress(0)
        entity:PrintToPlayer("The device has been activatd!",0xD, none)
        entity:tradeComplete()
        salvageUtil.teleportGroup(entity, posx, posy, posz, rot, true, false, false)
    else
        entity:PrintToPlayer("*Error* Invalid.",0xD, none)
    end
end

function salvageUtil.onInstanceComplete(instance)
    local floor = instance:getStage()
    local chars = instance:getChars()

    -- Reset floor teleport var to 0 for the zone
    for i, v in pairs(chars) do
        local zone = v:getZoneName()
        v:setCharVar(zone, 0)
        if v:getLocalVar("SalvageCompletedMessage") ~= 1 then
            v:PrintToPlayer("You have completed the zone!",0xD, none)
            v:setLocalVar("SalvageCompletedMessage", 1)
        end
    end
end