require("scripts/globals/mixins")
require("scripts/globals/status")
require("scripts/globals/dynamis")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.empty = function(mob)

    mob:addListener("DEATH", "DYNAMIS_ITEM_DISTRIBUTION", function(mob, killer)
        local element = mob:getLocalVar("element")
        if element == 1  then
            killer:addTreasure(1613, mob) -- Malevolent Memory (darkness skillchain)
        elseif element == 2 then
            killer:addTreasure(1611, mob) -- Somber Memory (water)
            killer:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 3 then
            killer:addTreasure(1610, mob) -- Startling Memory (lightning)
            killer:addTreasure(1612, mob) -- Radiant Memory (light skillchain)
        elseif element == 4  then
            killer:addTreasure(1609, mob) -- Profane Memory (earth)
            killer:addTreasure(1613, mob) -- Malevolent Memory (darkness skillchain)
        elseif element == 5 then
            killer:addTreasure(1612, mob) -- Radiant Memory (light skillchain)
        elseif element == 6  then
            killer:addTreasure(1606, mob) -- Burning Memory (fire)
            killer:addTreasure(1612, mob) -- Radiant Memory (light skillchain)
        elseif element == 7 then
            killer:addTreasure(1607, mob) -- Bitter Memory (ice)
            killer:addTreasure(1613, mob) -- Malevolent Memory (darkness skillchain)
        elseif element == 8 then
            killer:addTreasure(1608, mob) -- Fleeting Memory (wind)
            killer:addTreasure(1612, mob) -- Radiant Memory (light skillchain)
        end
    end)
end

return g_mixins.families.empty
