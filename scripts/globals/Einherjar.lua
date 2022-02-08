------------------------------------
-- Global Einherjar Definitions
------------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/status")
------------------------------------
einherjar = einherjar or {}
------------------------------------


-----------------------------------
-- Constants
-----------------------------------
einherjar.SMOULDERING_LAMP      = 5413
einherjar.GLOWING_LAMP          = 5414
einherjar.VALKYRIES_TEAR        = 3856
einherjar.VALKYRIES_WING        = 3867
einherjar.VALKYRIES_SOUL        = 3868
einherjar.MIN_LEVEL             = 60
einherjar.RESERVATION_CANCEL    = 10
einherjar.REENTRY_HOURS         = 72
einherjar.MAX_CHARS             = 36
einherjar.KO_TIMEOUT            = 3
einherjar.LAMP_COST             = 180000 -- 180k
einherjar.chamber =
{
    ROSSWEISSE                  = 30, -- 2
    GRIMGERDE                   = 31, -- 4
    SIEGRUNE                    = 32, -- 8
    HELMWIGE                    = 33, -- 16
    SCHWERTLEITE                = 34, -- 32
    WALTRAUTE                   = 35, -- 64
    ORTLINDE                    = 36, -- 128
    GERHILDE                    = 37, -- 256
    BRUNHILDE                   = 38, -- 512
    ODIN                        = 39, -- 1024
}
einherjar.REWARDS =
{
    { 17857,  15000 }, -- animator_+1
    { 16228,  15000 }, -- aslan_cape
    { 16229,  15000 }, -- gleemans_cape
    { 16267,  15000 }, -- ritter_gorget
    { 16268,  15000 }, -- kubira_bead_necklace
    { 16269,  15000 }, -- morganas_choker
    { 15911,  15000 }, -- buccaneers_belt
    { 15799,  15000 }, -- iota_ring
    { 15800,  15000 }, -- omega_ring
    { 15990,  15000 }, -- delta_earring
    {  2465,   5000 }, -- rubber_cap
    {  2466,   5000 }, -- rubber_harness
    {  2467,   5000 }, -- rubber_gloves
    {  2468,   5000 }, -- rubber_chausses
    {  2469,   5000 }, -- rubber_soles
    {  2470,   5000 }, -- nethereye_chain
    {  2471,   5000 }, -- netherfield_chain
    {  2472,   5000 }, -- netherspirit_chain
    {  2473,   5000 }, -- nethercant_chain
    {  2474,   5000 }, -- netherpact_chain
    {  2571, 100000 }, -- balrahns_eyepatch
    -- {  3856,   1000 }, -- valkyries_tear
    -- {  3867,   2000 }, -- valkyries_wing
    -- {  3868,   3000 }, -- valkyries_soul
}

einherjar.getAvailableChambers = function(player)
    local options = 4094 -- never show Odin's Chamber II
    local hasRossweisses    = player:hasKeyItem(tpz.ki.ROSSWEISSES_FEATHER)
    local hasGrimgerdes     = player:hasKeyItem(tpz.ki.GRIMGERDES_FEATHER)
    local hasSiegrunes      = player:hasKeyItem(tpz.ki.SIEGRUNES_FEATHER)
    local hasHelmwiges      = player:hasKeyItem(tpz.ki.HELMWIGES_FEATHER)
    local hasSchwertleites  = player:hasKeyItem(tpz.ki.SCHWERTLEITES_FEATHER)
    local hasWaltrautes     = player:hasKeyItem(tpz.ki.WALTRAUTES_FEATHER)
    local hasOrtlindes      = player:hasKeyItem(tpz.ki.ORTLINDES_FEATHER)
    local hasGerhildes      = player:hasKeyItem(tpz.ki.GERHILDES_FEATHER)
    local hasBrunhildes     = player:hasKeyItem(tpz.ki.BRUNHILDES_FEATHER)
    local hasTier1          = hasRossweisses and hasGrimgerdes and hasSiegrunes
    local hasTier2          = hasHelmwiges and hasSchwertleites and hasWaltrautes
    local hasTier3          = hasOrtlindes and hasGerhildes and hasBrunhildes
    if hasTier3 then -- only show odin
        options = 3070
    elseif hasTier2 then -- show unfinished t3's
        if not hasOrtlindes then options = options - 128; end
        if not hasGerhildes then options = options - 256; end
        if not hasBrunhildes then options = options - 512; end
    elseif hasTier1 then -- show unfinished t2's
        if not hasHelmwiges then options = options - 16; end
        if not hasSchwertleites then options = options - 32; end
        if not hasWaltrautes then options = options - 64; end
    else -- show unfinished t1's
        if not hasRossweisses then options = options - 2; end
        if not hasGrimgerdes then options = options - 4; end
        if not hasSiegrunes then options = options - 8; end
    end

    return options
end

einherjar.reserveSuccess = function(player, chamber)
    player:messageSpecial(8037, 5413)
    player:messageSpecial(8054, 5413, 3)
    local _, items = npcUtil.giveItem(player, 5414)
    if #items == 1 then
        local item = items[1] -- lamp
        item:setExtSection(player, chamber, 0, 2, false) -- chamber
        item:setExtSection(player, 1, 2, 2, false) -- active
        item:setExtSection(player, os.time() + 1800, 8, 4, true) -- timestamp
    end
end

einherjar.triggerEntrance = function(player, chamber)
    local options = 4080
    player:startEvent(3, chamber, 10, 3, 1, 0, options, 5413, 0)
end

-- TODO: more than 1 group can enter at a time and pick mobs from the pool that aren't already in use
local bosses =
{
    [1] = { 17096711, 17096717 },
    [2] = { 17096717, 17096723 },
    [3] = { 17096724, 17096729 },
}
local fodder =
{
    [1] =
    {
        { 17096730, 17096741 }, -- Dark_Elemental
        { 17096742, 17096753 }, -- Rotting_Huskarl (WAR)
        { 17096766, 17096777 }, -- Craven_Einherjar (Ghost)
        { 17096778, 17096789 }, -- Hyndla
        { 17096790, 17096795 }, -- Nickur
        { 17096796, 17096807 }, -- Hazhalm_Bat
        { 17096808, 17096819 }, -- Hazhalm_Bats
        { 17096754, 17096765 }, -- Rotting_Huskarl (BLM)
        { 17097078, 17097089 }, -- Chigoe
        { 17097102, 17097113 }, -- Logi
        { 17097126, 17097131 }, -- Infected_Wamoura
        { 17097132, 17097143 }, -- Sjokrakjen
        { 17097144, 17097155 }, -- Einherjar_Eater
        { 17097210, 17097215 }, -- Bugard-X
    },
    [2] =
    {
        { 17096916, 17096927 }, -- Battlemite
        { 17097054, 17097065 }, -- Corrupt_Einherjar
        { 17096880, 17096891 }, -- Craven_Einherjar (Bhoot)
        { 17096832, 17096843 }, -- Einherjar_Brei
        { 17097144, 17097155 }, -- Einherjar_Eater t1
        { 17097114, 17097125 }, -- Flames_of_Muspelheim
        { 17096820, 17096831 }, -- Gardsvor
        { 17096796, 17096807 }, -- Hazhalm_Bat t1
        { 17096808, 17096819 }, -- Hazhalm_Bats t1
        { 17096844, 17096855 }, -- Hazhalm_Leech
        { 17096904, 17096915 }, -- Odin\'s_Fool
        { 17096892, 17096903 }, -- Rotting_Huskarl (DRK)
        { 17097072, 17097077 }, -- Ormr
        { 17097132, 17097143 }, -- Sjokrakjen t1
        { 17096928, 17096939 }, -- Utgarth_Bat
        { 17096940, 17096951 }, -- Utgarth_Bats
        { 17096952, 17096963 }, -- Utgarth_Leech
        { 17096868, 17096879 }, -- Waldgeist
        { 17096856, 17096867 }, -- Winebibber
    },
    [3] =
    {
        { 17097000, 17097005 }, -- Audhumbla
        { 17097018, 17097029 }, -- Berserkr
        { 17097054, 17097065 }, -- Corrupt_Einherjar t2
        { 17097090, 17097101 }, -- Djigga
        { 17096964, 17096975 }, -- Experimental_Poroggo
        { 17097114, 17097125 }, -- Flames_of_Muspelheim t2
        { 17097156, 17097161 }, -- Hafgygr
        { 17097186, 17097197 }, -- Idun
        { 17097126, 17097131 }, -- Infected_Wamoura t1
        { 17096976, 17096987 }, -- Liquified_Einherjar
        { 17097102, 17097113 }, -- Logi t1
        { 17097066, 17097071 }, -- Manticore-X
        { 17097030, 17097041 }, -- Margygr
        { 17097006, 17097011 }, -- Marid-X
        { 17097042, 17097053 }, -- Odin\'s_Jester
        { 17096988, 17096999 }, -- Soulflayer
        { 17096928, 17096939 }, -- Utgarth_Bat t2
        { 17096940, 17096951 }, -- Utgarth_Bats t2
        { 17097198, 17097209 }, -- Vanquished_Einherjar
        { 17097012, 17097017 }, -- Wivre-X
    },
}

local mobPositions =
{
    [1] = {  400.432, -216.000,   36.746 },
    [2] = {  161.875, -196.000,  -37.132 },
    [3] = {   82.107, -176.000, -280.403 },
    [4] = { -236.687, -146.000, -441.203 },
    [5] = { -442.230, -126.000, -280.005 },
    [6] = { -677.290, -106.000, -121.726 },
    [7] = { -521.958,  -66.000,  165.089 },
    [8] = { -362.658,  -46.000,  396.170 },
    [9] = {  -81.992,   -6.000,  242.850 },
}

local getUniqueRands = function(count, min, max)
    if max - min < count then return nil; end

    -- fill table
    local rands = {}
    for i = min, max do
        table.insert(rands, i)
    end

    -- select from table count times
    local selection = {}
    for i = 1, count do
        local rand = math.random(1, #rands)
        table.insert(selection, rands[rand])
        table.remove(rands, rand)
    end

    return selection
end

local selectMobsFromTable = function(tier, chamber, waves)
    local list = {}
    for i = 1, #waves do
        local wave = waves[i]
        local groups = wave[1]
        local boss = wave[2]
        local mobs = fodder[tier]

        local rands = getUniqueRands(groups, 1, #mobs)
        for _, rand in ipairs(rands) do
            local range = mobs[rand]
            for mobid = range[1], range[2] do
                local mob = GetMobByID(mobid)
                local near = mobPositions[chamber]
                local pos = mob:pointNear({ near[1], near[2], near[3] })
                mob:setSpawn(pos.x, pos.y, pos.z)
                table.insert(list, { id = mobid, wave = i })
            end
        end

        if boss then
            local min = bosses[tier][1]
            local max = bosses[tier][2]
            local mobid = math.random(min, max)
            local pos = mobPositions[chamber]
            GetMobByID(mobid):setSpawn(pos[1], pos[2], pos[3])
            table.insert(list, { id = mobid, wave = i })
        end
    end

    return list
end

einherjar.buildBattlefield = function(chamber)
    local tier = 1
    if chamber > 6 then
        tier = 3
    elseif chamber > 3 then
        tier = 2
    end

    if tier == 1 then  -- one wave, two groups and boss
        return selectMobsFromTable(1, chamber, { { 2, true } })
    elseif tier == 2 then  -- first wave, two groups; second wave, one group and boss
        return selectMobsFromTable(2, chamber, { { 2, false }, { 1, true } })
    elseif tier == 3 then -- first wave, one group; second wave, one group; third wave, two groups and boss
        return selectMobsFromTable(3, chamber, { { 1, false }, { 1, false }, { 2, true } })
    end
end
