-----------------------------------
-- Area: Castle Oztroja [S]
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- SCNM: A Malcious Manifest
    [1310] =
    {
        {
            {itemid = 65535, droprate = 1000, amount = 18000},  -- gil
        },
        {
            {itemid =  16160, droprate =  500}, -- ree_habalos_headgear
            {itemid =  16006, droprate =  500}, -- brilliant_earring
        },
        {
            {itemid =  11392, droprate =  500}, -- koschei_crackows
            {itemid =  18598, droprate =  500}, -- prester
            {itemid =  15833, droprate =  500}, -- diverters_ring
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
    },
    -- SCNM: Plucking Wings
    [1313] =
    {
        {
            {itemid = 65535, droprate = 1000, amount = 18000},  -- gil
        },
        {
            {itemid =  16159, droprate =  500}, -- zhagos_barbut
            {itemid =  16005, droprate =  500}, -- paramount_earring
        },
        {
            {itemid =  15034, droprate =  500}, -- stone_mufflers
            {itemid =  18501, droprate =  500}, -- seismic_axe
            {itemid =  15832, droprate =  500}, -- headsmans_ring
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
        {
            {itemid = 654, droprate = 25},   -- Darksteel Ingot
            {itemid = 797, droprate = 25},   -- Painite
            {itemid = 745, droprate = 25},   -- Gold Ingot
            {itemid = 791, droprate = 25},    -- Aquamarine
            {itemid = 4175, droprate = 25},   -- Vile Elixir +1
            {itemid = 653, droprate = 25},   -- Mythril Ingot
            {itemid = 801, droprate = 25},    -- Chrysoberyl
            {itemid = 802, droprate = 25},    -- Moonstone
            {itemid = 803, droprate = 25},    -- Sunstone
            {itemid = 805, droprate = 25},    -- Zircon
            {itemid = 702, droprate = 25},    -- Ebony Log
            {itemid = 700, droprate = 25},    -- Mahogany Log
            {itemid = 942, droprate = 25},    -- Philosophers Stone
            {itemid = 652, droprate = 25},   -- Steel Ingot
            {itemid = 4173, droprate = 25},  -- Hi-reraiser
            {itemid = 784, droprate = 25},   -- Jadeite
            {itemid = 769, droprate = 25},    -- Red Rock
            {itemid = 770, droprate = 25},    -- Blue Rock
            {itemid = 771, droprate = 25},    -- Yellow Rock
            {itemid = 772, droprate = 25},    -- Green Rock
            {itemid = 773, droprate = 25},    -- Translucent Rock
            {itemid = 774, droprate = 25},    -- Purple Rock
            {itemid = 775, droprate = 25},    -- Black Rock
            {itemid = 776, droprate = 25},    -- White Rock
            {itemid = 810, droprate = 25},    -- Fluorite
            {itemid = 837, droprate = 25},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 25},   -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 25},    -- square_of_damascene_cloth
            {itemid = 658, droprate = 25},    -- damascus_ingot
            {itemid = 655, droprate = 25},    -- Adaman Ingot
            {itemid = 646, droprate = 25},    -- Adaman Ore
            {itemid = 739, droprate = 25},    -- chunk_of_orichalcum_ore
            {itemid = 4199, droprate = 25},    -- strength_potion
            {itemid = 4201, droprate = 25},    -- dexterity_potion
            {itemid = 4203, droprate = 25},    -- vitality_potion
            {itemid = 4205, droprate = 25},    -- agility_potion
            {itemid = 4207, droprate = 25},    -- intelligence_potion
            {itemid = 4209, droprate = 25},    -- mind_potion
            {itemid = 4211, droprate = 25},    -- charisma_potion
            {itemid = 4213, droprate = 25},    -- icarus_wing
        },
    },
}
function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        tpz.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
