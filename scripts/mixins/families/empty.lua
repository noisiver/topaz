require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.empty = function(mob)

    mob:addListener("ITEM_DROPS", "EMPTY_ITEM_DROPS", function(mob, player)
        local element = mob:getLocalVar("element")
        if element == 1  then
            printf("Dark");
            player:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 2 then
            printf("Water");
            player:addItem(1611) -- Somber Memory (water)
            player:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 3 then
            printf("Thunder");
            player:addItem(1610) -- Startling Memory (lightning)
            player:addItem(1612) -- Radiant Memory (light skillchain)
        elseif element == 4  then
            printf("Earth");
            player:addItem(1609) -- Profane Memory (earth)
            player:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 5 then
            printf("Light");
            player:addItem(1612) -- Radiant Memory (light skillchain)
        elseif element == 6  then
            printf("Fire");
            player:addItem(1606) -- Burning Memory (fire)
            player:addItem(1612) -- Radiant Memory (light skillchain)
        elseif element == 7 then
            printf("Ice");
            player:addItem(1607) -- Bitter Memory (ice)
            player:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 8 then
            printf("Wind");
            player:addItem(1608) -- Fleeting Memory (wind)
            player:addItem(1612) -- Radiant Memory (light skillchain)
        end
    end)
end

return g_mixins.families.empty
