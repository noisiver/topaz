require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.empty = function(mob)

    mob:addListener("ITEM_DROPS", "EMPTY_ITEM_DROPS", function(mob)
        local element = mob:getLocalVar("element")
        if element == 1 then
            mob:addDrop(1613, tpz.drops.COMMON) -- Malevolent Memory (darkness skillchain)
        elseif element == 2 then
            mob:addDrop(1611, tpz.drops.COMMON) -- Somber Memory (water)
            mob:addDrop(1613, tpz.drops.UNCOMMON) -- Malevolent Memory (darkness skillchain)
        elseif element == 3 then
            mob:addDrop(1610, tpz.drops.COMMON) -- Startling Memory (lightning)
            mob:addDrop(1612, tpz.drops.UNCOMMON) -- Radiant Memory (light skillchain)
        elseif element == 4 then
            mob:addDrop(1609, tpz.drops.COMMON) -- Profane Memory (earth)
            mob:addDrop(1613, tpz.drops.UNCOMMON) -- Malevolent Memory (darkness skillchain)
        elseif element == 5 then
            mob:addDrop(1612, tpz.drops.COMMON) -- Radiant Memory (light skillchain)
        elseif element == 6 then
            mob:addDrop(1606, tpz.drops.COMMON) -- Burning Memory (fire)
            mob:addDrop(1612, tpz.drops.UNCOMMON) -- Radiant Memory (light skillchain)
        elseif element == 7 then
            mob:addDrop(1607, tpz.drops.COMMON) -- Bitter Memory (ice)
            mob:addDrop(1613, tpz.drops.UNCOMMON) -- Malevolent Memory (darkness skillchain)
        elseif element == 8 then
            mob:addDrop(1608, tpz.drops.COMMON) -- Fleeting Memory (wind)
            mob:addDrop(1612, tpz.drops.UNCOMMON) -- Radiant Memory (light skillchain)
        end

    end)

end

return g_mixins.families.empty
