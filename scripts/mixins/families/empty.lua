require("scripts/globals/mixins")
require("scripts/globals/status")
require("scripts/globals/dynamis")
require("scripts/globals/utils")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

local function GetDropRate(mob)
    local TH = mob:getTHlevel()
    local dropRate = 24

    if (TH == 1) then
        dropRate = 48
    elseif (TH == 2) then
        dropRate = 56
    elseif (TH == 3) then
        dropRate = 60
    elseif (TH == 4) then
        dropRate = 64
    elseif (TH == 5) then
        dropRate = 66
    elseif (TH == 6) then
        dropRate = 68
    elseif (TH == 7) then
        dropRate = 69
    elseif (TH == 8) then
        dropRate = 70
    elseif (TH == 9) then
        dropRate = 72
    elseif (TH == 10) then
        dropRate = 73
    elseif (TH == 11) then
        dropRate = 74
    elseif (TH == 12) then
        dropRate = 76
    elseif (TH == 13) then
        dropRate = 78
    elseif (TH == 14) then
        dropRate = 80
    end

    return dropRate
end

g_mixins.families.empty = function(mob)

    mob:addListener("DEATH", "DYNAMIS_ITEM_DISTRIBUTION", function(mob, killer)
        local element = mob:getLocalVar("element")
        local dropRate = GetDropRate(mob)

        printf("Drop Rate: %s", dropRate)
        if element == 8  then
		if math.random(1,100) <= dropRate then 
            killer:addTreasure(1613, mob) -- Malevolent Memory (darkness)
		end
        elseif element == 6 then
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1611, mob) -- Somber Memory (water)
			end
            if math.random(1,100) <= dropRate then
                killer:addTreasure(1613) -- Malevolent Memory (darkness)
            end
        elseif element == 5 then
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1610, mob) -- Startling Memory (lightning)
			end
            if math.random(1,100) <= dropRate then 
                killer:addTreasure(1612, mob) -- Radiant Memory (light)
            end
        elseif element == 4  then
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1609, mob) -- Profane Memory (earth)
			end
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1613, mob) -- Malevolent Memory (darkness)
			end
        elseif element == 7 then
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1612, mob) -- Radiant Memory (light)
			end
        elseif element == 1  then
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1606, mob) -- Burning Memory (fire)
			end
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1612, mob) -- Radiant Memory (light)
			end
        elseif element == 2 then
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1607, mob) -- Bitter Memory (ice)
			end
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1613, mob) -- Malevolent Memory (darkness)
			end
        elseif element == 3 then
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1608, mob) -- Fleeting Memory (wind)
			end
			if math.random(1,100) <= dropRate then 
				killer:addTreasure(1612, mob) -- Radiant Memory (light)
			end
        end
        if math.random(1,100) <= utils.getDropRate(mob, 15) then
            killer:addTreasure(math.random(1687, 1689), mob) -- Recolection of x(Anima items)
        end
    end)
end

return g_mixins.families.empty
