require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.empty = function(mob)

    mob:addListener("ITEM_DROPS", "EMPTY_ITEM_DROPS", function(mob)
        local element = mob:getLocalVar("element")
        if element == 1 and math.random(1,100) <= 100 then
            mob:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 2 and math.random(1,100) <= 100 then
            mob:addTreasure(1611) -- Somber Memory (water)
            mob:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 3 and math.random(1,100) <= 100 then
            mob:addTreasure(1610) -- Startling Memory (lightning)
            mob:addTreasure(1612) -- Radiant Memory (light skillchain)
        elseif element == 4 and math.random(1,100) <= 100 then
            mob:addTreasure(1609) -- Profane Memory (earth)
            mob:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 5 and math.random(1,100) <= 100 then
            mob:addTreasure(1612) -- Radiant Memory (light skillchain)
        elseif element == 6 and math.random(1,100) <= 100 then
            mob:addTreasure(1606) -- Burning Memory (fire)
            mob:addTreasure(1612) -- Radiant Memory (light skillchain)
        elseif element == 7 and math.random(1,100) <= 100 then
            mob:addTreasure(1607) -- Bitter Memory (ice)
            mob:addTreasure(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 8 and math.random(1,100) <= 100 then
            mob:addTreasure(1608) -- Fleeting Memory (wind)
            mob:addTreasure(1612) -- Radiant Memory (light skillchain)
        end

    end)

end

return g_mixins.families.empty
