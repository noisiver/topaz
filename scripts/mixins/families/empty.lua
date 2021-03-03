require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.empty = function(mob)

    mob:addListener("ITEM_DROPS", "EMPTY_ITEM_DROPS", function(mob, killer)
        local element = mob:getLocalVar("element")
        if element == 1 and math.random(1,100) <= 99 then
            killer:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 2 and math.random(1,100) <= 99 then
            killer:addTreasure(1611) -- Somber Memory (water)
            killer:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 3 and math.random(1,100) <= 99 then
            killer:addTreasure(1610) -- Startling Memory (lightning)
            killer:addTreasure(1612) -- Radiant Memory (light skillchain)
        elseif element == 4 and math.random(1,100) <= 99 then
            killer:addTreasure(1609) -- Profane Memory (earth)
            killer:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 5 and math.random(1,100) <= 99 then
            killer:addTreasure(1612) -- Radiant Memory (light skillchain)
        elseif element == 6 and math.random(1,100) <= 99 then
            killer:addTreasure(1606) -- Burning Memory (fire)
            killer:addTreasure(1612) -- Radiant Memory (light skillchain)
        elseif element == 7 and math.random(1,100) <= 99 then
            killer:addTreasure(1607) -- Bitter Memory (ice)
            killer:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 8 and math.random(1,100) <= 99 then
            killer:addTreasure(1608) -- Fleeting Memory (wind)
            killer:addTreasure(1612) -- Radiant Memory (light skillchain)
        end

    end)

end

return g_mixins.families.empty
