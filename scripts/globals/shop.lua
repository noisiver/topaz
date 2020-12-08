-----------------------------------
--
--    Functions for Shop system
--
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/keyitems")
-----------------------------------

-----------------------------------
-- IDs for Curio Vendor Moogle
-----------------------------------

curio =
{
    ["medicine"]        = 1,
    ["ammunition"]      = 2,
    ["ninjutsuTools"]   = 3,
    ["foodStuffs"]      = 4,
    ["scrolls"]         = 5,
    ["keys"]            = 6,
    -- keyitems not implemented yet
}

tpz = tpz or {}

tpz.shop =
{
    --[[ *******************************************************************************
        send general shop dialog to player
        stock cuts off after 16 items. if you add more, extras will not display
        stock is of form {itemId1, price1, itemId2, price2, ...}
        log is a log ID from scripts/globals/log_ids.lua
    ******************************************************************************* --]]
    general = function(player, stock, log)
        local priceMultiplier = 1

        if log then
            priceMultiplier = (1 + (0.122 * (9 - player:getFameLevel(log)) / 8)) * SHOP_PRICE   -- changed from 0.2
        else
            log = -1
        end

        player:createShop(#stock / 2, log)

        for i = 1, #stock, 2 do
            player:addShopItem(stock[i], stock[i+1] * priceMultiplier)
        end

        player:sendMenu(2)
    end,

    --[[ *******************************************************************************
        send general guild shop dialog to player (Added on June 2014 QoL)
        stock is of form {itemId1, price1, guildID, guildRank, ...}
        log is default set to -1 as it's needed as part of createShop()
    ******************************************************************************* --]]
    generalGuild = function(player, stock, guildSkillId)
        local log = 1.5      -- changed from -1

        player:createShop(#stock / 1, log)      -- changed from / 1

        for i = 1, #stock, 3 do
            player:addShopItem(stock[i], stock[i+1], guildSkillId, stock[i+2])
        end

        player:sendMenu(2)
    end,

    --[[ *******************************************************************************
        send curio vendor moogle shop shop dialog to player
        stock is of form {itemId1, price1, keyItemRequired, ...}
        log is default set to -1 as it's needed as part of createShop()
    ******************************************************************************* --]]
    curioVendorMoogle = function(player, stock)
        local log = -1

        player:createShop(#stock / 3, log)

        for i = 1, #stock, 3 do
            if player:hasKeyItem(stock[i+2]) then
                player:addShopItem(stock[i], stock[i+1])
            end
        end

        player:sendMenu(2)
    end,

    --[[ *******************************************************************************
        send nation shop dialog to player
        stock cuts off after 16 items. if you add more, extras will not display
        stock is of form {itemId1, price1, place1, itemId2, price2, place2, ...}
            where place is what place the nation must be in for item to be stocked
        nation is a tpz.nation ID from scripts/globals/zone.lua
    ******************************************************************************* --]]
    nation = function(player, stock, nation)
        local rank = getNationRank(nation)
        local newStock = {}
        for i = 1, #stock, 3 do
            if
                (stock[i+2] == 1 and player:getNation() == nation and rank == 1) or
                (stock[i+2] == 2 and rank <= 2) or
                (stock[i+2] == 3)
            then
                table.insert(newStock, stock[i])
                table.insert(newStock, stock[i+1])
            end
        end
        tpz.shop.general(player, newStock, nation)
    end,

    --[[ *******************************************************************************
        send outpost shop dialog to player
    ******************************************************************************* --]]
    outpost = function(player)
        local stock =
        {
            4148,  316, -- Antidote
            4151,  800, -- Echo Drops
            4128, 4832, -- Ether
            4150, 2595, -- Eye Drops
            4112,  910, -- Potion
        }
        tpz.shop.general(player, stock)
    end,

    --[[ *******************************************************************************
        send celebratory chest shop dialog to player
    ******************************************************************************* --]]
    celebratory = function(player)
        local stock =
        {
            4167,   30, -- Cracker
            4168,   30, -- Twinkle Shower
            4215,   60, -- Popstar
            4216,   60, -- Brilliant Snow
            4256,   30, -- Ouka Ranman
            4169,   30, -- Little Comet
            5769,  650, -- Popper
            4170, 1000, -- Wedding Bell
            5424, 6000, -- Serene Serinette
            5425, 6000, -- Joyous Serinette
            4441, 1116, -- Grape Juice
            4238, 3000, -- Inferno Crystal
            4240, 3000, -- Cyclone Crystal
            4241, 3000, -- Terra Crystal
        }
        tpz.shop.general(player, stock)
    end,

    --[[ *******************************************************************************
        stock for guild vendors that are open 24/8
    ******************************************************************************* --]]
    generalGuildStock =
    {
        [tpz.skill.COOKING] =
        {
                 936,      16,      tpz.craftRank.AMATEUR,      -- Rock Salt
                4509,      12,      tpz.craftRank.AMATEUR,      -- Distilled Water


        },
        [tpz.skill.CLOTHCRAFT] =
        {
                2128,      75,      tpz.craftRank.AMATEUR,      -- Spindle
                2145,      75,      tpz.craftRank.AMATEUR,      -- Zephyr Thread
                 833,      20,      tpz.craftRank.AMATEUR,      -- Moko Grass


        },
        [tpz.skill.GOLDSMITHING] =
        {
                2144,      75,      tpz.craftRank.AMATEUR,      -- Workshop Anvil
                2143,      75,      tpz.craftRank.AMATEUR,      -- Mandrel


        },
        [tpz.skill.WOODWORKING] =
        {
                1657,     100,      tpz.craftRank.AMATEUR,      -- Bundling Twine

        },
        [tpz.skill.ALCHEMY] =
        {
                2131,      75,      tpz.craftRank.AMATEUR,      -- Triturator


        },
        [tpz.skill.BONECRAFT] =
        {
                2130,      75,      tpz.craftRank.AMATEUR,      -- Shagreen File


        },
        [tpz.skill.LEATHERCRAFT] =
        {
                2129,      75,      tpz.craftRank.AMATEUR,      -- Tanning Vat

        },
        [tpz.skill.SMITHING] =
        {
                2144,      75,      tpz.craftRank.AMATEUR,      -- Workshop Anvil
                2143,      75,      tpz.craftRank.AMATEUR,      -- Mandrel


        }
    },

    curioVendorMoogleStock =
    {
        [curio.medicine] =
        {
                4112,     300,      tpz.ki.RHAPSODY_IN_WHITE,   -- Potion
                4116,     600,      tpz.ki.RHAPSODY_IN_UMBER,   -- Hi-Potion
                4120,    1200,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- X-Potion
                4128,     650,      tpz.ki.RHAPSODY_IN_WHITE,   -- Ether
                4132,    1300,      tpz.ki.RHAPSODY_IN_UMBER,   -- Hi-Ether
                4136,    3000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Super Ether
                4145,   15000,      tpz.ki.RHAPSODY_IN_AZURE,   -- Elixir
                4148,     300,      tpz.ki.RHAPSODY_IN_WHITE,   -- Antidote
                4150,    1000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Eye Drops
                4151,     700,      tpz.ki.RHAPSODY_IN_UMBER,   -- Echo Drops
                4156,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Mulsum
                4164,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Prism Powder
                4165,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Silent Oil
                4166,     250,      tpz.ki.RHAPSODY_IN_WHITE,   -- Deodorizer
                4172,    1000,      tpz.ki.RHAPSODY_IN_AZURE,   -- Reraiser
        },
        [curio.ammunition] =
        {
                4219,     400,      tpz.ki.RHAPSODY_IN_WHITE,   -- Stone Quiver
                4220,     680,      tpz.ki.RHAPSODY_IN_WHITE,   -- Bone Quiver
                4225,    1200,      tpz.ki.RHAPSODY_IN_WHITE,   -- Iron Quiver
                4221,    1350,      tpz.ki.RHAPSODY_IN_WHITE,   -- Beetle Quiver
                4226,    2040,      tpz.ki.RHAPSODY_IN_WHITE,   -- Silver Quiver
                4222,    2340,      tpz.ki.RHAPSODY_IN_WHITE,   -- Horn Quiver
                5333,    3150,      tpz.ki.RHAPSODY_IN_UMBER,   -- Sleep Quiver
                4223,    3500,      tpz.ki.RHAPSODY_IN_UMBER,   -- Scorpion Quiver
                4224,    7000,      tpz.ki.RHAPSODY_IN_AZURE,   -- Demon Quiver
                5332,    8800,      tpz.ki.RHAPSODY_IN_AZURE,   -- Kabura Quiver
                5819,    9900,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Antlion Quiver
                4227,     400,      tpz.ki.RHAPSODY_IN_WHITE,   -- Bronze Bolt Quiver
                5334,     800,      tpz.ki.RHAPSODY_IN_WHITE,   -- Blind Bolt Quiver
                5335,    1250,      tpz.ki.RHAPSODY_IN_WHITE,   -- Acid Bolt Quiver
                5337,    1500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Sleep Bolt Quiver
                5339,    2100,      tpz.ki.RHAPSODY_IN_WHITE,   -- Bloody Bolt Quiver
                5338,    2100,      tpz.ki.RHAPSODY_IN_WHITE,   -- Venom Bolt Quiver
                5336,    2400,      tpz.ki.RHAPSODY_IN_WHITE,   -- Holy Bolt Quiver
                4228,    3500,      tpz.ki.RHAPSODY_IN_UMBER,   -- Mythril Bolt Quiver
                4229,    5580,      tpz.ki.RHAPSODY_IN_AZURE,   -- Darksteel Bolt Quiver
                5820,    9460,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Darkling Bolt Quiver
                5821,    9790,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Fusion Bolt Quiver
                5359,     400,      tpz.ki.RHAPSODY_IN_WHITE,   -- Bronze Bullet Pouch
                5363,    1920,      tpz.ki.RHAPSODY_IN_WHITE,   -- Bullet Pouch
                5341,    2400,      tpz.ki.RHAPSODY_IN_WHITE,   -- Spartan Bullet Pouch
                5353,    4800,      tpz.ki.RHAPSODY_IN_UMBER,   -- Iron Bullet Pouch
                5340,    4800,      tpz.ki.RHAPSODY_IN_UMBER,   -- Silver Bullet Pouch
                5342,    7100,      tpz.ki.RHAPSODY_IN_AZURE,   -- Corsair Bullet Pouch
                5416,    7600,      tpz.ki.RHAPSODY_IN_AZURE,   -- Steel Bullet Pouch
                5822,    9680,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Dweomer Bullet Pouch
                5823,    9900,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Oberon Bullet Pouch
                6299,    1400,      tpz.ki.RHAPSODY_IN_WHITE,   -- Shuriken Pouch
                6297,    2280,      tpz.ki.RHAPSODY_IN_WHITE,   -- Juji Shuriken Pouch
                6298,    4640,      tpz.ki.RHAPSODY_IN_UMBER,   -- Manji Shuriken Pouch
                6302,    7000,      tpz.ki.RHAPSODY_IN_AZURE,   -- Fuma Shuriken Pouch
                6303,    9900,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Iga Shuriken Pouch
        },
        [curio.ninjutsuTools] =
        {
                5308,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Uchi)
                5309,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Tsurara)
                5310,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kawahori-Ogi)
                5311,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Makibishi)
                5312,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Hiraishin)
                5313,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Mizu-Deppo)
                5314,    5000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Shihei)
                5315,    5000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Jusatsu)
                5316,    5000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kaginawa)
                5317,    5000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Sairui-Ran)
                5318,    5000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Kodoku)
                5319,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Shinobi-Tabi)
                5417,    3000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Toolbag (Sanjaku-Tenugui)
                5734,    5000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Toolbag (Soshi)
        },
        [curio.foodStuffs] =
        {
                4378,      60,      tpz.ki.RHAPSODY_IN_WHITE,   -- Selbina Milk
                4299,     100,      tpz.ki.RHAPSODY_IN_WHITE,   -- Orange au Lait
                5703,     100,      tpz.ki.RHAPSODY_IN_WHITE,   -- Uleguerand Milk
                4300,     300,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Apple au Lait
                4301,     600,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Pear au Lait
                4422,     200,      tpz.ki.RHAPSODY_IN_WHITE,   -- Orange Juice
                4424,    1100,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Melon Juice
                4558,    2000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Yagudo Drink
                4405,     160,      tpz.ki.RHAPSODY_IN_WHITE,   -- Rice Ball
                4376,     120,      tpz.ki.RHAPSODY_IN_WHITE,   -- Meat Jerky
                4371,     184,      tpz.ki.RHAPSODY_IN_WHITE,   -- Grilled Hare
                4381,     720,      tpz.ki.RHAPSODY_IN_UMBER,   -- Meat Mithkabob
                4456,     550,      tpz.ki.RHAPSODY_IN_WHITE,   -- Boiled Crab
                4398,    1080,      tpz.ki.RHAPSODY_IN_UMBER,   -- Fish Mithkabob
                5166,    1500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Coeurl Sub
                4538,     900,      tpz.ki.RHAPSODY_IN_WHITE,   -- Roast Pipira
                6217,     500,      tpz.ki.RHAPSODY_IN_AZURE,   -- Anchovy Slice
                6215,     400,      tpz.ki.RHAPSODY_IN_UMBER,   -- Pepperoni Slice
                5752,    3500,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Pot-auf-feu
                4488,    1000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Jack-o'-Lantern
                5176,    5000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Bream Sushi
                5178,    4000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Dorado Sushi
                5721,    1500,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Crab Sushi
                5775,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Chocolate Crepe
                5766,    1000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Butter Crepe
                4413,     320,      tpz.ki.RHAPSODY_IN_WHITE,   -- Apple Pie
                4421,     800,      tpz.ki.RHAPSODY_IN_WHITE,   -- Melon Pie
                4446,    1200,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Pumpkin Pie
                4410,     344,      tpz.ki.RHAPSODY_IN_WHITE,   -- Roast Mushroom
                4510,      24,      tpz.ki.RHAPSODY_IN_WHITE,   -- Acorn Cookie
                4394,      12,      tpz.ki.RHAPSODY_IN_AZURE,   -- Ginger Cookie
                5782,    1000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Sugar Rusk
                5783,    2000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Chocolate Rusk
                5779,    1000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Cherry Macaron
                5780,    2000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Coffee Macaron
                5885,    1000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Saltena
                5886,    2000,      tpz.ki.RHAPSODY_IN_AZURE,   -- Elshena
                5887,    2500,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Montagna
                5889,    1000,      tpz.ki.RHAPSODY_IN_WHITE,   -- Stuffed Pitaru
                5890,    2000,      tpz.ki.RHAPSODY_IN_AZURE,   -- Poultry Pitaru
                5891,    2500,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Seafood Pitaru
                6258,    3000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Shiromochi
                6262,    3000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Kusamochi
                6260,    3000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Akamochi
                5547,   15000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Beef Stewpot
                5727,   15000,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Zaru Soba
                4466,     450,    tpz.ki.RHAPSODY_IN_CRIMSON,   -- Spicy Cracker
        },
        [curio.scrolls] =
        {
                4181,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Instant Warp
                4182,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Instant Reraise
                5428,     500,      tpz.ki.RHAPSODY_IN_AZURE,   -- Instant Retrace
                5988,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Instant Protect
                5989,     500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Instant Shell
                5990,     500,      tpz.ki.RHAPSODY_IN_UMBER,   -- Instant Stoneskin
        },
        [curio.keys] =
        {
                1024,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Ghelsba Chest Key
                1025,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Palborough Chest Key
                1026,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Giddeus Chest Key
                1027,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Ranperre Chest Key
                1028,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Dangruf Chest Key
                1029,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Horutoto Chest Key
                1030,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Ordelle Chest Key
                1031,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Gusgen Chest Key
                1032,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Shakhrami Chest Key
                1033,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Davoi Chest Key
                1034,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Beadeaux Chest Key
                1035,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Oztroja Chest Key
                1036,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Delkfutt Chest Key
                1037,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Fei'Yin Chest Key
                1038,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Zvahl Chest Key
                1039,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Eldieme Chest Key
                1040,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Nest Chest Key
                1041,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Garlaige Chest Key
                1043,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Beadeaux Coffer Key
                1042,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Davoi Coffer Key
                1044,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Oztroja Coffer Key
                1045,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Nest Coffer Key
                1046,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Eldieme Coffer Key
                1047,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Garlaige Coffer Key
                1048,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Zvhal Coffer Key
                1049,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Uggalepih Coffer Key
                1050,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Den Coffer Key
                1051,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Kuftal Coffer Key
                1052,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Boyahda Coffer Key
                1053,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Cauldron Coffer Key
                1054,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Quicksand Coffer Key
                1055,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Grotto Chest Key
                1056,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Onzozo Chest Key
                1057,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Toraimarai Coffer Key
                1058,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Ru'Aun Coffer Key
                1059,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Grotto Coffer Key
                1060,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Ve'Lugannon Coffer Key
                1061,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Sacrarium Chest Key
                1062,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Oldton Chest Key
                1063,    5000,      tpz.ki.RHAPSODY_IN_UMBER,   -- Newton Coffer Key
                1064,    2500,      tpz.ki.RHAPSODY_IN_WHITE,   -- Pso'Xja Chest Key
        }
    }
}
