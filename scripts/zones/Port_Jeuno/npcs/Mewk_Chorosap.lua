-----------------------------------
-- Area: Port Jeuno
--  NPC: Mewk Chorosap
-- Escutcheons NPC
-- !gotoid 17784999
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/items")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Port_Jeuno/IDs")
-----------------------------------
local questData =
{
    [tpz.skill.WOODWORKING] =
    {
        Shields = { tpz.items.JOINERS_ECU, tpz.items.JOINERS_SCUTUM, tpz.items.JOINERS_SHIELD, tpz.items.JOINERS_ESCUTCHEON },
        [1] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.PIECE_OF_JACARANDA_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_TEAK_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_SANCTIFIED_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_ETHEREAL_OAK_LUMBER, Quantity = 100 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.COUSE_HQ, Quantity = 10 },
                { Id = tpz.items.ROUND_SHIELD_HQ, Quantity = 10 },
                { Id = tpz.items.EBONY_HARP_HQ2, Quantity = 10 },
                { Id = tpz.items.VELOCITY_BOW, Quantity = 20 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.BATTLE_FORK, Quantity = 20 },
                { Id = tpz.items.NYMPH_SHIELD, Quantity = 20 },
                { Id = tpz.items.OBELISK_LANCE, Quantity = 50 },
                { Id = tpz.items.EREMITES_WAND, Quantity = 20 },
            },
        },
        [4] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.MYTHIC_POLE, Quantity = 20 },
                { Id = tpz.items.MITHRAN_FISHING_ROD, Quantity = 20 },
                { Id = tpz.items.CERMET_LANCE, Quantity = 20 },
                { Id = tpz.items.ARMOIRE, Quantity = 20 },
            },
        },
    },
    [tpz.skill.SMITHING] =
    {
        Shields = { tpz.items.SMYTHES_ECU, tpz.items.SMYTHES_SCUTUM, tpz.items.SMYTHES_SHIELD, tpz.items.SMYTHES_ESCUTCHEON },
        [1] = {
            RequestNumber = 5,
            Items = {
                { Id = tpz.items.DWEOMER_STEEL_INGOT, Quantity = 100 },
                { Id = tpz.items.INFERNO_CORE, Quantity = 25 },
                { Id = tpz.items.LUMINOUS_CORE, Quantity = 25 },
                { Id = tpz.items.SPIRIT_CORE, Quantity = 25 },
                { Id = tpz.items.FRIGID_CORE, Quantity = 25 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.DARKSTEEL_KUKRI_HQ, Quantity = 10 },
                { Id = tpz.items.HIEN_HQ, Quantity = 20 },
                { Id = tpz.items.GUST_TONGUE_HQ, Quantity = 10 },
                { Id = tpz.items.NODOWA_HQ, Quantity = 20 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.COLOSSAL_AXE, Quantity = 20 },
                { Id = tpz.items.SAI, Quantity = 20 },
                { Id = tpz.items.TEWHATEWHA, Quantity = 50 },
                { Id = tpz.items.SEVERUS_CLAWS, Quantity = 20 },
            },
        },
        [4] = {
            RequestNumber = 3,
            Items = {
                { Id = tpz.items.RISING_SUN, Quantity = 50 },
                { Id = tpz.items.JADAGNA, Quantity = 50 },
                { Id = tpz.items.KANESADA_HQ, Quantity = 50 },
            },
        },
    },
    [tpz.skill.GOLDSMITHING] =
    {
        Shields = { tpz.items.TOREUTIC_ECU, tpz.items.TOREUTIC_SCUTUM, tpz.items.TOREUTIC_SHIELD, tpz.items.TOREUTIC_ESCUTCHEON },
        [1] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.ROGUES_SILVER_INGOT, Quantity = 100 },
                { Id = tpz.items.NEUTRALIZING_SILVER_INGOT, Quantity = 100 },
                { Id = tpz.items.BEWITCHED_GOLD_INGOT, Quantity = 100 },
                { Id = tpz.items.INDURATED_GOLD_INGOT, Quantity = 100 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.GOLD_SWORD_HQ, Quantity = 10 },
                { Id = tpz.items.MOONRING_BLADE_HQ, Quantity = 10 },
                { Id = tpz.items.MYTHRIL_GAUNTLETS_HQ, Quantity = 10 },
                { Id = tpz.items.PLATINUM_GRIP_HQ, Quantity = 10 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.KROUSIS_RING, Quantity = 20 },
                { Id = tpz.items.VELDT_AXE, Quantity = 20 },
                { Id = tpz.items.REAVER_GRIP, Quantity = 20 },
                { Id = tpz.items.PIGEON_EARRING, Quantity = 20 },
            },
        },
        [4] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.TOJAKU, Quantity = 20 },
                { Id = tpz.items.BLIZZARD_SCYTHE, Quantity = 20 },
                { Id = tpz.items.JEWELED_COLLAR, Quantity = 20 },
                { Id = tpz.items.DIAMOND_SHIELD, Quantity = 20 },
            },
        },
    },
    [tpz.skill.CLOTHCRAFT] =
    {
        Shields = { tpz.items.PLAITERS_ECU, tpz.items.PLAITERS_SCUTUM, tpz.items.PLAITERS_SHIELD, tpz.items.PLAITERS_ESCUTCHEON },
        [1] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.SQUARE_OF_HUMIDIFIED_VELVET, Quantity = 50 },
                { Id = tpz.items.SQUARE_OF_SMOOTH_VELVET_CLOTH, Quantity = 50 },
                { Id = tpz.items.SQUARE_OF_MOHBWA_CLOTH, Quantity = 100 },
                { Id = tpz.items.SQUARE_OF_KARAKUL_CLOTH, Quantity = 100 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.GOLD_OBI_HQ, Quantity = 20 },
                { Id = tpz.items.LINEN_DOUBLET_HQ, Quantity = 20 },
                { Id = tpz.items.WOOL_DOUBLET_HQ, Quantity = 20 },
                { Id = tpz.items.JESTERS_CAPE_HQ, Quantity = 20 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.ARACHNE_OBI, Quantity = 10 },
                { Id = tpz.items.CORSAIRS_HAT, Quantity = 10 },
                { Id = tpz.items.MASTERS_GI, Quantity = 10 },
                { Id = tpz.items.TAFFETA_CAPE, Quantity = 10 },
            },
        },
        [4] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.WAR_AKETON, Quantity = 20 },
                { Id = tpz.items.WAR_BRAIS, Quantity = 20 },
                { Id = tpz.items.WAR_SHINOBI_GI, Quantity = 20 },
                { Id = tpz.items.ELITE_BERET, Quantity = 20 },
            },
        },
    },
    [tpz.skill.LEATHERCRAFT] =
    {
        Shields = { tpz.items.BEVELERS_ECU, tpz.items.BEVELERS_SCUTUM, tpz.items.BEVELERS_SHIELD, tpz.items.BEVELERS_ESCUTCHEON },
        [1] = {
            RequestNumber = 5,
            Items = {
                { Id = tpz.items.CALIGINOUS_WOLF_HIDE, Quantity = 100 },
                { Id = tpz.items.FRAGRANT_RAM_SKIN, Quantity = 100 },
                { Id = tpz.items.SQUARE_OF_SMILODON_LEATHER, Quantity = 50 },
                { Id = tpz.items.SQUARE_OF_CATOBLEPAS_LEATHER, Quantity = 50 },
                { Id = tpz.items.SQUARE_OF_MOBLIN_SHEEP_LEATHER, Quantity = 50 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.TORAMA_CESTI, Quantity = 40 },
                { Id = tpz.items.DINO_JERKIN, Quantity = 40 },
                { Id = tpz.items.BATTLE_BOOTS_HQ, Quantity = 20 },
                { Id = tpz.items.BEAK_JERKIN_HQ, Quantity = 40 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.NOMADS_MANTLE, Quantity = 10 },
                { Id = tpz.items.AIR_SOLEA, Quantity = 10 },
                { Id = tpz.items.FOWLERS_MANTLE, Quantity = 10 },
                { Id = tpz.items.CAVALIERS_MANTLE, Quantity = 10 },
            },
        },
        [4] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.KOENIGS_BELT, Quantity = 50 },
                { Id = tpz.items.PEISTE_MANTLE, Quantity = 50 },
                { Id = tpz.items.WIVRE_MASK, Quantity = 50 },
                { Id = tpz.items.COEURL_MASK, Quantity = 50 },
            },
        },
    },
    [tpz.skill.BONECRAFT] =
    {
        Shields = { tpz.items.OSSIFIERS_ECU, tpz.items.OSSIFIERS_SCUTUM, tpz.items.OSSIFIERS_SHIELD, tpz.items.OSSIFIERS_ESCUTCHEON },
        [1] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.PIECE_OF_JACARANDA_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_KAPOR_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_TEAK_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_LACQUER_TREE_LUMBER, Quantity = 100 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.COUSE_HQ, Quantity = 10 },
                { Id = tpz.items.ROUND_SHIELD_HQ, Quantity = 10 },
                { Id = tpz.items.EBONY_HARP_HQ2, Quantity = 10 },
                { Id = tpz.items.VELOCITY_BOW, Quantity = 20 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.BATTLE_FORK_HQ, Quantity = 20 },
                { Id = tpz.items.NYMPH_SHIELD, Quantity = 20 },
                { Id = tpz.items.OBELISK_LANCE, Quantity = 50 },
                { Id = tpz.items.EREMITES_WAND, Quantity = 20 },
            },
        },
        [4] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.MYTHIC_POLE, Quantity = 50 },
                { Id = tpz.items.ROSENBOGEN, Quantity = 20 },
                { Id = tpz.items.WHALE_STAFF, Quantity = 20 },
                { Id = tpz.items.LEO_CROSSBOW, Quantity = 20 },
            },
        },
    },
    [tpz.skill.ALCHEMY] =
    {
        Shields = { tpz.items.BREWERS_ECU, tpz.items.BREWERS_SCUTUM, tpz.items.BREWERS_SHIELD, tpz.items.BREWERS_ESCUTCHEON },
        [1] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.PIECE_OF_JACARANDA_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_KAPOR_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_TEAK_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_LACQUER_TREE_LUMBER, Quantity = 100 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.COUSE_HQ, Quantity = 10 },
                { Id = tpz.items.ROUND_SHIELD_HQ, Quantity = 10 },
                { Id = tpz.items.EBONY_HARP_HQ2, Quantity = 10 },
                { Id = tpz.items.VELOCITY_BOW, Quantity = 20 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.BATTLE_FORK_HQ, Quantity = 20 },
                { Id = tpz.items.NYMPH_SHIELD, Quantity = 20 },
                { Id = tpz.items.OBELISK_LANCE, Quantity = 50 },
                { Id = tpz.items.EREMITES_WAND, Quantity = 20 },
            },
        },
        [4] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.MYTHIC_POLE, Quantity = 50 },
                { Id = tpz.items.ROSENBOGEN, Quantity = 20 },
                { Id = tpz.items.WHALE_STAFF, Quantity = 20 },
                { Id = tpz.items.LEO_CROSSBOW, Quantity = 20 },
            },
        },
    },
    [tpz.skill.COOKING] =
    {
        Shields = { tpz.items.CHEFS_ECU, tpz.items.CHEFS_SCUTUM, tpz.items.CHEFS_SHIELD, tpz.items.CHEFS_ESCUTCHEON },
        [1] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.PIECE_OF_JACARANDA_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_KAPOR_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_TEAK_LUMBER, Quantity = 100 },
                { Id = tpz.items.PIECE_OF_LACQUER_TREE_LUMBER, Quantity = 100 },
            },
        },
        [2] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.COUSE_HQ, Quantity = 10 },
                { Id = tpz.items.ROUND_SHIELD_HQ, Quantity = 10 },
                { Id = tpz.items.EBONY_HARP_HQ2, Quantity = 10 },
                { Id = tpz.items.VELOCITY_BOW, Quantity = 20 },
            },
        },
        [3] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.BATTLE_FORK_HQ, Quantity = 20 },
                { Id = tpz.items.NYMPH_SHIELD, Quantity = 20 },
                { Id = tpz.items.OBELISK_LANCE, Quantity = 50 },
                { Id = tpz.items.EREMITES_WAND, Quantity = 20 },
            },
        },
        [4] = {
            RequestNumber = 4,
            Items = {
                { Id = tpz.items.MYTHIC_POLE, Quantity = 50 },
                { Id = tpz.items.ROSENBOGEN, Quantity = 20 },
                { Id = tpz.items.WHALE_STAFF, Quantity = 20 },
                { Id = tpz.items.LEO_CROSSBOW, Quantity = 20 },
            },
        },
    }
}

local function AdvanceRequest(player)
    local currentShield = player:GetCharVar('ShieldCurrentSkillType');
    local shieldData = questData[currentShield];
    local currentStage = player:getCharVar('ShieldCurrentStage');
    if (currentStage == nil) then
        --Set up first request for first stage if no stage set.
        player:setCharVar('ShieldCurrentStage', 1);
        player:setCharVar('ShieldRequestsCompleted', 0);
        currentStage = 1;
    else
        --Increase number of requests completed if not..
        local requestsCompleted = player:getCharVar('ShieldRequestsCompleted') + 1;

        --If requests completed matches number of requests in stage, then advance to next stage..
        if (requestsCompleted >= shieldData[currentStage].RequestNumber) then
            currentStage = currentStage + 1;
            if currentStage > #shieldData then
                --All stages complete... do whatever.
                if npcUtil.giveItem(player, shieldData.Shields[4]) then
                    player:tradeComplete()
                    local itemName = shieldData.Shields[4]:getName()
                    player:PrintToPlayer("Please enjoy your new " .. itemName .. "!",0, "Mewek")
                    player:setCharVar("ShieldCurrentSkillType", 0)
                end
                return
            else
                --Go to next stage..
                currentStage = currentStage + 1;
                if npcUtil.giveItem(player, shieldData.Shields[currentStage]) then
                    player:tradeComplete()
                    local itemName = shieldData.Shields[currentStage]:getName()
                    player:PrintToPlayer("Please enjoy your new " .. itemName .. "!",0, "Mewek")
                else
                    -- Don't set variables if the players inventory is full
                    return
                end
                player:setCharVar('ShieldCurrentStage', currentStage);
                player:setCharVar('ShieldRequestsCompleted', 0);
            end
        else
            --Update number of requests completed..
            player:setCharVar('ShieldRequestsCompleted', requestsCompleted);
        end

    end

    local stageData = shieldData[currentStage];

    local selectedItem;
    while (selectedItem == nil) do
        local randomItem = stageData.Items[math.random(#stageData.Items)];

        --Find an item that has not yet been used and reset shield progress variables for it..
        if player:getCharVar('ShieldItemUsed_' .. tostring(randomItem.Id)) ~= 1 then
            player:setCharVar('ShieldStageItem', randomItem.Id);
            player:setCharVar('ShieldStageProgress', 0);
            player:setCharVar('ShieldStageMaximum', randomItem.Quantity);
            player:setCharVar('ShieldItemUsed_' .. tostring(randomItem.Id), 1);
            selectedItem = randomItem;
        end
    end

    local itemName = selectedItem.Id:getName()
    player:PrintToPlayer('My next request.. I will need you to bring me ' .. tostring(selectedItem.Quantity) .. ' ' .. itemName .. '.', 0, "Mewk");
end

local function checkTradeProgress(player, npc, trade)
    local requestedItem = player:getCharVar('ShieldStageItem');
    if npcUtil.tradeHas(trade, requestedItem) then


        local itemName = requestedItem:getName()
        local requestedQuantity = player:getCharVar('ShieldStageMaximum');
        local progress = player:getCharVar('ShieldStageProgress');
        local tradedAmount = trade:getItemQty(requestedItem);
        progress = progress + tradedAmount;
        player:tradeComplete();

        if (progress >= requestedQuantity) then
            -- Stage complete..
            player:PrintToPlayer("You have delivered all " .. requestedQuantity .. ' of my requested ' .. itemName .. '.  Great job!', 0, "Mewk");
            AdvanceRequest(player);
        else
            player:PrintToPlayer("You have delivered " .. progress .. ' out of ' .. requestedQuantity .. ' ' .. itemName .. '.', 0, "Mewk");
            player:setCharVar('ShieldStageProgress', progress);
        end
    end
end


function onTrade(player, npc, trade)
    checkTradeProgress(player, npc, trade)
end

function onTrigger(player, npc)
    local currentStage = player:getCharVar('ShieldCurrentStage');
    if (currentStage == 0) then
        for skill, data in pairs(questData) do
            if (player:getSkillRank(skill) >= 10) then
                player:setCharVar("ShieldCurrentSkillType", skill);
                player:PrintToPlayer("Hey you, you're a skilled crafter! I can make you even more skilled." ,0, "Mewk")
                AdvanceRequest(player);
                return;
            end
        end
        player:PrintToPlayer("I don't have time for unskilled adventurers." ,0, "Mewk")
    else
        local requestedItem = player:getCharVar('ShieldStageItem');
        local itemName = requestedItem:getName();
        local requestedQuantity = player:getCharVar('ShieldStageMaximum');
        local progress = player:getCharVar('ShieldStageProgress');
        if (progress < requestedQuantity) then
            player:PrintToPlayer("You have delivered " .. progress .. ' out of ' .. requestedQuantity .. ' ' .. itemName, tpz.msg.textColor.HIDDEN, 0);
        else
            -- TODO: Stage is complete but not turned in, idk?
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
