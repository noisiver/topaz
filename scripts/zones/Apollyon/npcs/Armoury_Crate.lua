-----------------------------------
-- Area: Apollyon
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/limbus")
require("scripts/globals/zone")
local ID = require("scripts/zones/Apollyon/IDs")

local loot =
{
    [1293] =
    {
        --  SE_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 550}, -- Nothing
                {itemid = 1939, droprate =  50}, -- RDM
                {itemid = 1941, droprate =  50}, -- THF
                {itemid = 1959, droprate =  50}, -- SMN
                {itemid = 1949, droprate =  50}, -- BRD
                {itemid = 1945, droprate =  50}, -- DRK
                {itemid = 1951, droprate =  50}, -- RNG
                {itemid = 1955, droprate =  50}, -- NIN
                {itemid = 2659, droprate =  50}, -- COR
                {itemid = 2715, droprate =  50}, -- DNC
            },
            {
                {itemid =    0, droprate = 550}, -- Nothing
                {itemid = 1939, droprate =  50}, -- RDM
                {itemid = 1941, droprate =  50}, -- THF
                {itemid = 1959, droprate =  50}, -- SMN
                {itemid = 1949, droprate =  50}, -- BRD
                {itemid = 1945, droprate =  50}, -- DRK
                {itemid = 1951, droprate =  50}, -- RNG
                {itemid = 1955, droprate =  50}, -- NIN
                {itemid = 2659, droprate =  50}, -- COR
                {itemid = 2715, droprate =  50}, -- DNC
            },
        },
        -- SE_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1959, droprate = 100}, -- SMN
                {itemid = 1949, droprate = 100}, -- BRD
                {itemid = 1943, droprate = 100}, -- PLD
                {itemid = 1947, droprate = 100}, -- BST
                {itemid = 2661, droprate = 100}, -- PUP
                {itemid = 1951, droprate = 100}, -- RNG
                {itemid = 1955, droprate = 100}, -- NIN
                {itemid = 1945, droprate = 100}, -- DRK
                {itemid = 2659, droprate = 100}, -- COR
                {itemid = 2715, droprate = 100}, -- DNC
            },
            {
                {itemid =    0, droprate = 500}, -- Nothing
                {itemid = 1959, droprate = 50}, -- SMN
                {itemid = 1949, droprate = 50}, -- BRD
                {itemid = 1943, droprate = 50}, -- PLD
                {itemid = 1947, droprate = 50}, -- BST
                {itemid = 2661, droprate = 50}, -- PUP
                {itemid = 1951, droprate = 50}, -- RNG
                {itemid = 1955, droprate = 50}, -- NIN
                {itemid = 1945, droprate = 50}, -- DRK
                {itemid = 2659, droprate = 50}, -- COR
                {itemid = 2715, droprate = 50}, -- DNC
            },
        },
        -- SE_Apollyon floor 3
        [3] =
        {   
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1931, droprate = 50}, -- WAR
                {itemid = 1955, droprate = 50}, -- NIN
                {itemid = 1959, droprate = 50}, -- SMN
                {itemid = 1949, droprate = 50}, -- BRD
                {itemid = 1933, droprate = 50}, -- MNK
                {itemid = 1945, droprate = 50}, -- DRK
                {itemid = 1951, droprate = 50}, -- RNG
                {itemid = 2659, droprate = 50}, -- COR
                {itemid = 1681, droprate = 50}, -- Light Steel
                {itemid =  645, droprate = 50}, -- Darksteel Ore
                {itemid =  664, droprate = 50}, -- Darksteel Sheet
                {itemid =  646, droprate = 50}, -- Adaman Ore

            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1931, droprate = 50}, -- WAR
                {itemid = 1955, droprate = 50}, -- NIN
                {itemid = 1959, droprate = 50}, -- SMN
                {itemid = 1949, droprate = 50}, -- BRD
                {itemid = 1933, droprate = 50}, -- MNK
                {itemid = 1945, droprate = 50}, -- DRK
                {itemid = 1951, droprate = 50}, -- RNG
                {itemid = 2659, droprate = 50}, -- COR
                {itemid = 1681, droprate = 50}, -- Light Steel
                {itemid =  645, droprate = 50}, -- Darksteel Ore
                {itemid =  664, droprate = 50}, -- Darksteel Sheet
                {itemid =  646, droprate = 50}, -- Adaman Ore
            },
        },
        -- SE_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1935, droprate = 125}, -- WHM
                {itemid = 1937, droprate = 125}, -- BLM
                {itemid = 1957, droprate = 125}, -- DRG
                {itemid = 1953, droprate = 125}, -- SAM
                {itemid = 2657, droprate = 125}, -- BLU
                {itemid = 2717, droprate = 125}, -- SCH
                {itemid = 1931, droprate = 125}, -- WAR
                {itemid = 1939, droprate = 125}, -- RDM
            },
            {
                {itemid = 1935, droprate = 125}, -- WHM
                {itemid = 1937, droprate = 125}, -- BLM
                {itemid = 1957, droprate = 125}, -- DRG
                {itemid = 1953, droprate = 125}, -- SAM
                {itemid = 2657, droprate = 125}, -- BLU
                {itemid = 2717, droprate = 125}, -- SCH
                {itemid = 1931, droprate = 125}, -- WAR
                {itemid = 1939, droprate = 125}, -- RDM
            },
            {
                {itemid = 1909, droprate = 1000}, -- Smalt Chip
            },
            {
                {itemid =    0, droprate = 950}, -- Nothing
                {itemid = 2127, droprate =  50}, -- Metal Chip
            },
        },
    },
    [1292] =
    {
        -- NE_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1953, droprate = 100}, -- SAM
                {itemid = 1943, droprate = 100}, -- PLD
                {itemid = 1941, droprate = 100}, -- THF
                {itemid = 2715, droprate = 100}, -- DNC
                {itemid = 2661, droprate = 100}, -- PUP
                {itemid = 1933, droprate = 100}, -- MNK
                {itemid = 1939, droprate = 100}, -- RDM
                {itemid = 1935, droprate = 100}, -- WHM
                {itemid = 2717, droprate = 100}, -- SCH
                {itemid = 1947, droprate = 100}, -- BST
            },
            {
                {itemid =    0, droprate = 500}, -- Nothing
                {itemid = 1953, droprate =  50}, -- SAM
                {itemid = 1943, droprate =  50}, -- PLD
                {itemid = 1941, droprate =  50}, -- THF
                {itemid = 2715, droprate =  50}, -- DNC
                {itemid = 2661, droprate =  50}, -- PUP
                {itemid = 1933, droprate =  50}, -- MNK
                {itemid = 1939, droprate =  50}, -- RDM
                {itemid = 1935, droprate =  50}, -- WHM
                {itemid = 2717, droprate =  50}, -- SCH
                {itemid = 1947, droprate =  50}, -- BST
            },
        },
        -- NE_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1947, droprate = 100}, -- BST
                {itemid = 1933, droprate = 100}, -- MNK
                {itemid = 1943, droprate = 100}, -- PLD
                {itemid = 2661, droprate = 100}, -- PUP
                {itemid = 1937, droprate = 100}, -- BLM
                {itemid = 1957, droprate = 100}, -- DRG
                {itemid = 1941, droprate = 100}, -- THF
                {itemid = 1939, droprate = 100}, -- RDM
                {itemid = 2657, droprate = 100}, -- BLU
                {itemid = 1951, droprate = 100}, -- RNG
            },
            {
                {itemid =    0, droprate = 500}, -- Nothing
                {itemid = 1947, droprate = 50}, -- BST
                {itemid = 1933, droprate = 50}, -- MNK
                {itemid = 1943, droprate = 50}, -- PLD
                {itemid = 2661, droprate = 50}, -- PUP
                {itemid = 1937, droprate = 50}, -- BLM
                {itemid = 1957, droprate = 50}, -- DRG
                {itemid = 1941, droprate = 50}, -- THF
                {itemid = 1939, droprate = 50}, -- RDM
                {itemid = 2657, droprate = 50}, -- BLU
                {itemid = 1951, droprate = 50}, -- RNG
            },
        },
        -- NE_Apollyon floor 3
        [3] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 500}, -- Nothing
                {itemid = 1931, droprate =  50}, -- WAR
                {itemid = 1939, droprate =  50}, -- RDM
                {itemid = 1953, droprate =  50}, -- SAM
                {itemid = 1957, droprate =  50}, -- DRG
                {itemid = 1947, droprate =  50}, -- BST
                {itemid = 1933, droprate =  50}, -- MNK
                {itemid = 1941, droprate =  50}, -- THF
                {itemid = 2661, droprate =  50}, -- PUP
                {itemid = 2715, droprate =  50}, -- DNC
                {itemid = 1943, droprate =  50}, -- PLD
            },
            {
                {itemid =    0, droprate = 500}, -- Nothing
                {itemid = 1931, droprate =  50}, -- WAR
                {itemid = 1939, droprate =  50}, -- RDM
                {itemid = 1953, droprate =  50}, -- SAM
                {itemid = 1957, droprate =  50}, -- DRG
                {itemid = 1947, droprate =  50}, -- BST
                {itemid = 1933, droprate =  50}, -- MNK
                {itemid = 1941, droprate =  50}, -- THF
                {itemid = 2661, droprate =  50}, -- PUP
                {itemid = 2715, droprate =  50}, -- DNC
                {itemid = 1943, droprate =  50}, -- PLD
            },
            {
                {itemid =    0, droprate =  300}, -- Nothing
                {itemid =  646, droprate =  100}, -- Adaman Ore
                {itemid =  664, droprate =  100}, -- Darksteel Sheet
                {itemid =  645, droprate =  100}, -- Darksteel Ore
                {itemid = 1311, droprate =  100}, -- Oxblood
                {itemid = 1681, droprate =  100}, -- Light Steel
                {itemid =  821, droprate =  100}, -- Rainbow Thread
                {itemid = 1883, droprate =  100}, -- Shell Powder
            },
            {
                {itemid =    0, droprate =  300}, -- Nothing
                {itemid =  646, droprate =  100}, -- Adaman Ore
                {itemid =  664, droprate =  100}, -- Darksteel Sheet
                {itemid =  645, droprate =  100}, -- Darksteel Ore
                {itemid = 1311, droprate =  100}, -- Oxblood
                {itemid = 1681, droprate =  100}, -- Light Steel
                {itemid =  821, droprate =  100}, -- Rainbow Thread
                {itemid = 1883, droprate =  100}, -- Shell Powder
            },
        },
        -- NE_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },  
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1931, droprate = 125}, -- WAR
                {itemid = 1949, droprate = 125}, -- BRD
                {itemid = 1945, droprate = 125}, -- DRK
                {itemid = 1951, droprate = 125}, -- RNG
                {itemid = 1959, droprate = 125}, -- SMN
                {itemid = 1955, droprate = 125}, -- NIN
                {itemid = 2659, droprate = 125}, -- COR
                {itemid = 2717, droprate = 125}, -- SCH
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1931, droprate =  75}, -- WAR
                {itemid = 1949, droprate =  75}, -- BRD
                {itemid = 1945, droprate =  75}, -- DRK
                {itemid = 1951, droprate =  75}, -- RNG
                {itemid = 1959, droprate =  75}, -- SMN
                {itemid = 1955, droprate =  75}, -- NIN
                {itemid = 2659, droprate =  75}, -- COR
                {itemid = 2717, droprate =  75}, -- SCH
            },
        },
        -- NE_Apollyon floor 5
        [5] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },  
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1910, droprate = 1000}, -- Smoky Chip
            },
            {
                {itemid =    0, droprate = 950}, -- Nothing
                {itemid = 2127, droprate =  50}, -- Metal Chip
            },
        },
    },
    [1291] =
    {
        -- SW_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1949, droprate = 125}, -- BRD
                {itemid = 1945, droprate = 125}, -- DRK
                {itemid = 1953, droprate = 125}, -- SAM
                {itemid = 1937, droprate = 125}, -- BLM
                {itemid = 1931, droprate = 125}, -- WAR
                {itemid = 1957, droprate = 125}, -- DRG
                {itemid = 2717, droprate = 125}, -- SCH
                {itemid = 1935, droprate = 125}, -- WHM
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1949, droprate =  75}, -- BRD
                {itemid = 1945, droprate =  75}, -- DRK
                {itemid = 1953, droprate =  75}, -- SAM
                {itemid = 1937, droprate =  75}, -- BLM
                {itemid = 1931, droprate =  75}, -- WAR
                {itemid = 1957, droprate =  75}, -- DRG
                {itemid = 2717, droprate =  75}, -- SCH
                {itemid = 1935, droprate =  75}, -- WHM
            },
        },
        -- SW_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1951, droprate = 125}, -- RNG
                {itemid = 1959, droprate = 125}, -- SMN
                {itemid = 1937, droprate = 125}, -- BLM
                {itemid = 1931, droprate = 125}, -- WAR
                {itemid = 2659, droprate = 125}, -- COR
                {itemid = 1953, droprate = 125}, -- SAM
                {itemid = 2657, droprate = 125}, -- BLU
                {itemid = 1955, droprate = 125}, -- NIN
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1951, droprate = 75}, -- RNG
                {itemid = 1959, droprate = 75}, -- SMN
                {itemid = 1937, droprate = 75}, -- BLM
                {itemid = 1931, droprate = 75}, -- WAR
                {itemid = 2659, droprate = 75}, -- COR
                {itemid = 1953, droprate = 75}, -- SAM
                {itemid = 2657, droprate = 75}, -- BLU
                {itemid = 1955, droprate = 75}, -- NIN
            },
        },
        -- SW_Apollyon floor 3
        [3] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1931, droprate = 75}, -- WAR
                {itemid = 1937, droprate = 75}, -- BLM
                {itemid = 1953, droprate = 75}, -- SAM
                {itemid = 1935, droprate = 75}, -- WHM
                {itemid = 2657, droprate = 75}, -- BLU
                {itemid = 2717, droprate = 75}, -- SCH
                {itemid = 1947, droprate = 75}, -- BST
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1931, droprate = 75}, -- WAR
                {itemid = 1955, droprate = 75}, -- NIN
                {itemid = 1937, droprate = 75}, -- BLM
                {itemid = 1953, droprate = 75}, -- SAM
                {itemid = 1935, droprate = 75}, -- WHM
                {itemid = 2657, droprate = 75}, -- BLU
                {itemid = 2717, droprate = 75}, -- SCH
                {itemid = 1947, droprate = 75}, -- BST
            }, 
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1311, droprate =  75}, -- Oxblood
                {itemid = 1883, droprate =  75}, -- Shell Powder
                {itemid = 1681, droprate =  75}, -- Light Steel
                {itemid = 1633, droprate =  75}, -- Clot Plasma
                {itemid =  645, droprate =  75}, -- Darksteel Ore
                {itemid =  664, droprate =  75}, -- Darksteel Sheet
                {itemid =  646, droprate =  75}, -- Adaman Ore
                {itemid =  821, droprate =  75}, -- Rainbow Thread
            },
        },
        -- SW_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 300}, -- Nothing
                {itemid = 1941, droprate = 100}, -- THF
                {itemid = 1947, droprate = 100}, -- BST
                {itemid = 1933, droprate = 100}, -- MNK
                {itemid = 1939, droprate = 100}, -- RDM
                {itemid = 1943, droprate = 100}, -- PLD
                {itemid = 2661, droprate = 100}, -- PUP
                {itemid = 2715, droprate = 100}, -- DNC
            },
            {
                {itemid =    0, droprate = 300}, -- Nothing
                {itemid = 1941, droprate = 100}, -- THF
                {itemid = 1947, droprate = 100}, -- BST
                {itemid = 1933, droprate = 100}, -- MNK
                {itemid = 1939, droprate = 100}, -- RDM
                {itemid = 1943, droprate = 100}, -- PLD
                {itemid = 2661, droprate = 100}, -- PUP
                {itemid = 2715, droprate = 100}, -- DNC
                --MNK RDM PUP BST DNC THF PLD
            },
            {
                {itemid = 1987, droprate = 1000}, -- Charcoal Chip
            },
            {
                {itemid =    0, droprate = 950}, -- Nothing
                {itemid = 2127, droprate =  50}, -- Metal Chip
            },
        },
    },
    [1290] =
    {
        -- NW_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 100}, -- Nothing
                {itemid = 1937, droprate = 100}, -- BLM
                {itemid = 2657, droprate = 100}, -- BLU
                {itemid = 1957, droprate = 100}, -- DRG
                {itemid = 1943, droprate = 100}, -- PLD
                {itemid = 1953, droprate = 100}, -- SAM
                {itemid = 2717, droprate = 100}, -- SCH
                {itemid = 1931, droprate = 100}, -- WAR
                {itemid = 1935, droprate = 100}, -- WHM
                {itemid = 2715, droprate = 100}, -- DNC
            },
        },
        -- NW_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 125}, -- Nothing
                {itemid = 2659, droprate = 125}, -- COR
                {itemid = 1945, droprate = 125}, -- DRK
                {itemid = 1955, droprate = 125}, -- NIN
                {itemid = 1951, droprate = 125}, -- RNG
                {itemid = 1959, droprate = 125}, -- SMN
                {itemid = 1949, droprate = 125}, -- BRD
                {itemid = 2715, droprate = 125}, -- DNC
            },
        },
        -- NW_Apollyon floor 3
        [3] =
        {
            {
                {itemid = 1875, droprate = 500}, -- Ancient Beastcoin
                {itemid =    0, droprate = 500}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 500}, -- Ancient Beastcoin
                {itemid =    0, droprate = 500}, -- Nothing
            },
            {   
                {itemid = 1875, droprate = 500}, -- Ancient Beastcoin
                {itemid =    0, droprate = 500}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 500}, -- Ancient Beastcoin
                {itemid =    0, droprate = 500}, -- Nothing
            },  
            {
                {itemid = 1875, droprate = 500}, -- Ancient Beastcoin
                {itemid =    0, droprate = 500}, -- Nothing
            },
            {
                {itemid =    0, droprate = 125}, -- Nothing
                {itemid = 1947, droprate = 125}, -- BST
                {itemid = 1933, droprate = 125}, -- MNK
                {itemid = 1943, droprate = 125}, -- PLD
                {itemid = 2661, droprate = 125}, -- PUP
                {itemid = 1939, droprate = 125}, -- RDM
                {itemid = 1941, droprate = 125}, -- THF
                {itemid = 2715, droprate = 125}, -- DNC
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1311, droprate =  75}, -- Oxblood
                {itemid = 1883, droprate =  75}, -- Shell Powder
                {itemid = 1681, droprate =  75}, -- Light Steel
                {itemid = 1633, droprate =  75}, -- Clot Plasma
                {itemid =  645, droprate =  75}, -- Darksteel Ore
                {itemid =  664, droprate =  75}, -- Darksteel Sheet
                {itemid =  646, droprate =  75}, -- Adaman Ore
                {itemid =  821, droprate =  75}, -- Rainbow Thread
            },
            {
                {itemid =    0, droprate = 400}, -- Nothing
                {itemid = 1311, droprate =  75}, -- Oxblood
                {itemid = 1883, droprate =  75}, -- Shell Powder
                {itemid = 1681, droprate =  75}, -- Light Steel
                {itemid = 1633, droprate =  75}, -- Clot Plasma
                {itemid =  645, droprate =  75}, -- Darksteel Ore
                {itemid =  664, droprate =  75}, -- Darksteel Sheet
                {itemid =  646, droprate =  75}, -- Adaman Ore
                {itemid =  821, droprate =  75}, -- Rainbow Thread
            },
        },
        -- NW_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },  
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 500}, -- Ancient Beastcoin
                {itemid =    0, droprate = 500}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 500}, -- Ancient Beastcoin
                {itemid =    0, droprate = 500}, -- Nothing
            },
            {
                {itemid = 1949, droprate =  100}, -- BRD
                {itemid = 1947, droprate =  100}, -- BST
                {itemid = 1931, droprate =  100}, -- WAR
                {itemid = 1945, droprate =  100}, -- DRK
                {itemid = 1933, droprate =  100}, -- MNK
                {itemid = 2661, droprate =  100}, -- PUP
                {itemid = 1939, droprate =  100}, -- RDM
                {itemid = 1959, droprate =  100}, -- SMN
                {itemid = 1935, droprate =  100}, -- WHM
                {itemid = 1941, droprate =  100}, -- THF
            },
        },
        -- NW_Apollyon floor 5
        [5] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1937, droprate = 50}, -- BLM
                {itemid = 2657, droprate = 50}, -- BLU
                {itemid = 1949, droprate = 50}, -- BRD
                {itemid = 1947, droprate = 50}, -- BST
                {itemid = 2659, droprate = 50}, -- COR
                {itemid = 2715, droprate = 50}, -- DNC
                {itemid = 1957, droprate = 50}, -- DRG
                {itemid = 1945, droprate = 50}, -- DRK
                {itemid = 1933, droprate = 50}, -- MNK
                {itemid = 1955, droprate = 50}, -- NIN
                {itemid = 1943, droprate = 50}, -- PLD
                {itemid = 2661, droprate = 50}, -- PUP
                {itemid = 1939, droprate = 50}, -- RDM
                {itemid = 1951, droprate = 50}, -- RNG
                {itemid = 1953, droprate = 50}, -- SAM
                {itemid = 2717, droprate = 50}, -- SCH
                {itemid = 1959, droprate = 50}, -- SMN
                {itemid = 1941, droprate = 50}, -- THF
                {itemid = 1931, droprate = 50}, -- WAR
                {itemid = 1935, droprate = 50}, -- WHM
            },
            {
                {itemid = 1937, droprate = 50}, -- BLM
                {itemid = 2657, droprate = 50}, -- BLU
                {itemid = 1949, droprate = 50}, -- BRD
                {itemid = 1947, droprate = 50}, -- BST
                {itemid = 2659, droprate = 50}, -- COR
                {itemid = 2715, droprate = 50}, -- DNC
                {itemid = 1957, droprate = 50}, -- DRG
                {itemid = 1945, droprate = 50}, -- DRK
                {itemid = 1933, droprate = 50}, -- MNK
                {itemid = 1955, droprate = 50}, -- NIN
                {itemid = 1943, droprate = 50}, -- PLD
                {itemid = 2661, droprate = 50}, -- PUP
                {itemid = 1939, droprate = 50}, -- RDM
                {itemid = 1951, droprate = 50}, -- RNG
                {itemid = 1953, droprate = 50}, -- SAM
                {itemid = 2717, droprate = 50}, -- SCH
                {itemid = 1959, droprate = 50}, -- SMN
                {itemid = 1941, droprate = 50}, -- THF
                {itemid = 1931, droprate = 50}, -- WAR
                {itemid = 1935, droprate = 50}, -- WHM
            },
            {
                {itemid =    0, droprate = 500}, -- Nothing
                {itemid = 1937, droprate = 25}, -- BLM
                {itemid = 2657, droprate = 25}, -- BLU
                {itemid = 1949, droprate = 25}, -- BRD
                {itemid = 1947, droprate = 25}, -- BST
                {itemid = 2659, droprate = 25}, -- COR
                {itemid = 2715, droprate = 25}, -- DNC
                {itemid = 1957, droprate = 25}, -- DRG
                {itemid = 1945, droprate = 25}, -- DRK
                {itemid = 1933, droprate = 25}, -- MNK
                {itemid = 1955, droprate = 25}, -- NIN
                {itemid = 1943, droprate = 25}, -- PLD
                {itemid = 2661, droprate = 25}, -- PUP
                {itemid = 1939, droprate = 25}, -- RDM
                {itemid = 1951, droprate = 25}, -- RNG
                {itemid = 1953, droprate = 25}, -- SAM
                {itemid = 2717, droprate = 25}, -- SCH
                {itemid = 1959, droprate = 25}, -- SMN
                {itemid = 1941, droprate = 25}, -- THF
                {itemid = 1931, droprate = 25}, -- WAR
                {itemid = 1935, droprate = 25}, -- WHM
            },
            {
                {itemid = 1988, droprate = 1000}, -- Magenta Chip
            },
            {
                {itemid =    0, droprate = 950}, -- Nothing
                {itemid = 2127, droprate =  50}, -- Metal Chip
            },
        },
    },
    [1294] =
    {
        -- CS_Apollyon
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 950}, -- Nothing
                {itemid = 2127, droprate =  50}, -- Metal Chip
            },
        },
    },
    [1296] =
    {
        -- omega
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1925, droprate = 250}, -- Omega's Eye
                {itemid = 1927, droprate = 250}, -- Omega's Foreleg
                {itemid = 1928, droprate = 250}, -- Omega's Hinf Leg
                {itemid = 1929, droprate = 250}, -- Omega's Tail
            },
            {
                {itemid = 1928, droprate = 250}, -- Omega's Hind Leg
                {itemid = 1929, droprate = 250}, -- Omega's Tail
                {itemid = 1925, droprate = 250}, -- Omega's Eye
                {itemid = 1927, droprate = 250}, -- Omega's Foreleg
            },
            {
                {itemid =    0, droprate = 750}, -- Nothing
                {itemid = 1926, droprate = 250}, -- Omega's Heart
            },
        },
    },
}

function onTrade(player,npc,trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if not battlefield then
        return
    end
    local crateID = npc:getID()
    local model = npc:getModelId()
    local X = npc:getXPos()
    local Y = npc:getYPos()
    local Z = npc:getZPos()
    local bfid = battlefield:getID()
    local hold = false
    if npc:getLocalVar("open") == 0 then
        switch (bfid): caseof 
        {
            [1290] = function() -- NW Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_NW_CRATE[5] then
                    for i = 1, 4 do
                        for j = 1, 5 do
                            if crateID == ID.npc.APOLLYON_NW_CRATE[i][j] then
                                if model == 960 then
                                    tpz.battlefield.HealPlayers(battlefield)
                                elseif model == 961 then
                                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                elseif model == 962 then
                                    tpz.limbus.extendTimeLimit(battlefield, 5, tpz.zone.APOLLYON)
                                end
                            end
                        end
                    end
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][5], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1291] = function() -- SW Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_SW_CRATE[4] then
                    for i = 1, 3 do
                        if i == 3 then
                            local mimicSpawned = battlefield:getLocalVar("mimicSpawned")
                            if mimicSpawned ~= 7 then
                                local timePH = battlefield:getLocalVar("timePH")
                                local restorePH = battlefield:getLocalVar("restorePH")
                                local itemPH = battlefield:getLocalVar("itemPH")
                                for j = 0, 9 do
                                    if crateID == ID.npc.APOLLYON_SW_CRATE[i]+j then
                                        if crateID == restorePH then
                                            tpz.battlefield.HealPlayers(battlefield)
                                        elseif crateID == itemPH then
                                            tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                        elseif crateID == timePH then
                                            tpz.limbus.extendTimeLimit(battlefield, 10, tpz.zone.APOLLYON)
                                        else
                                            if mimicSpawned == 0 or mimicSpawned == 2 or mimicSpawned == 4 or mimicSpawned == 6 then
                                                npc:setStatus(tpz.status.DISAPPEAR)
                                                battlefield:setLocalVar("mimicSpawned", mimicSpawned+1)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]):setSpawn(X, Y, Z)
                                                SpawnMob(ID.mob.APOLLYON_SW_MOB[3]):setPos(X, Y, Z)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]):updateClaim(player)
                                            elseif mimicSpawned == 1 or mimicSpawned == 5 then
                                                npc:setStatus(tpz.status.DISAPPEAR)
                                                battlefield:setLocalVar("mimicSpawned", mimicSpawned+2)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+1):setSpawn(X, Y, Z)
                                                SpawnMob(ID.mob.APOLLYON_SW_MOB[3]+1):setPos(X, Y, Z)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+1):updateClaim(player)
                                            elseif mimicSpawned == 3 then
                                                npc:setStatus(tpz.status.DISAPPEAR)
                                                battlefield:setLocalVar("mimicSpawned", mimicSpawned+4)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+2):setSpawn(X, Y, Z)
                                                SpawnMob(ID.mob.APOLLYON_SW_MOB[3]+2):setPos(X, Y, Z)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+2):updateClaim(player)
                                            end
                                        end
                                    end
                                end
                            else
                                hold = true
                            end
                        else
                            for j = 0, 2 do
                                if crateID == ID.npc.APOLLYON_SW_CRATE[i]+j then
                                    if j ~= 0 then GetNPCByID(ID.npc.APOLLYON_SW_CRATE[i]):setStatus(tpz.status.DISAPPEAR) end
                                    if j ~= 1 then GetNPCByID(ID.npc.APOLLYON_SW_CRATE[i]+1):setStatus(tpz.status.DISAPPEAR) end
                                    if j ~= 2 then GetNPCByID(ID.npc.APOLLYON_SW_CRATE[i]+2):setStatus(tpz.status.DISAPPEAR) end
                                    if model == 960 then
                                        tpz.battlefield.HealPlayers(battlefield)
                                    elseif model == 961 then
                                        tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                    elseif model == 962 then
                                        tpz.limbus.extendTimeLimit(battlefield, 10, tpz.zone.APOLLYON)
                                    end
                                end
                            end
                        end
                    end
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][4], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1292] = function() -- NE Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_NE_CRATE[5] then
                    for i = 1, 4 do
                        for j = 1, 5 do
                            if crateID == ID.npc.APOLLYON_NE_CRATE[i][j] then
                                if model == 960 then
                                    tpz.battlefield.HealPlayers(battlefield)
                                elseif model == 961 then
                                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                elseif model == 962 then
                                    tpz.limbus.extendTimeLimit(battlefield, 5, tpz.zone.APOLLYON)
                                end
                            end
                        end
                    end
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][5], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1293] = function() -- SE Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_SE_CRATE[4] then
                    for i = 1, 3 do
                        for j = 0, 2 do
                            if crateID == ID.npc.APOLLYON_SE_CRATE[i]+j then
                                if model == 960 then
                                    tpz.battlefield.HealPlayers(battlefield)
                                elseif model == 961 then
                                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                elseif model == 962 then
                                    tpz.limbus.extendTimeLimit(battlefield, 10, tpz.zone.APOLLYON)
                                end
                            end
                        end
                    end
                else
                    for i = 1, 8 do
                        GetMobByID(ID.mob.APOLLYON_SE_MOB[4]+i):setStatus(tpz.status.DISAPPEAR)
                    end
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][4], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1294] = function() -- CS Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_CS_CRATE then
                    tpz.limbus.extendTimeLimit(battlefield, 15, tpz.zone.APOLLYON)
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][1], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1296] = function() -- Central Apollyon Crate Handling
                tpz.limbus.handleLootRolls(battlefield, loot[bfid][1], nil, npc)
                battlefield:setLocalVar("cutsceneTimer", 10)
                battlefield:setLocalVar("lootSeen", 1)
            end,
        }
        if not hold then
            npc:entityAnimationPacket("open")
            npc:setLocalVar("open", 1)
            npc:timer(15000, function(npc)
                npc:entityAnimationPacket("kesu")
            end)
            npc:timer(16000, function(npc)
                npc:setStatus(tpz.status.DISAPPEAR)
                npc:timer(500, function(mob)
                    npc:setLocalVar("open", 0)
                end)
            end)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
