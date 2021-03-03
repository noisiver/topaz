require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.empty = function(mob)

    mob:addListener("DEATH", "DYNAMIS_ITEM_DISTRIBUTION", function(mob, killer)
        local element = mob:getLocalVar("element")
        if element == 1  then
            printf("Dark");
            killer:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 2 then
            printf("Water");
            killer:addItem(1611) -- Somber Memory (water)
            killer:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 3 then
            printf("Thunder");
            killer:addItem(1610) -- Startling Memory (lightning)
            killer:addItem(1612) -- Radiant Memory (light skillchain)
        elseif element == 4  then
            printf("Earth");
            killer:addItem(1609) -- Profane Memory (earth)
            killer:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 5 then
            printf("Light");
            killer:addItem(1612) -- Radiant Memory (light skillchain)
        elseif element == 6  then
            printf("Fire");
            killer:addItem(1606) -- Burning Memory (fire)
            killer:addItem(1612) -- Radiant Memory (light skillchain)
        elseif element == 7 then
            printf("Ice");
            killer:addItem(1607) -- Bitter Memory (ice)
            killer:addItem(1613) -- Malevolent Memory (darkness skillchain)
        elseif element == 8 then
            printf("Wind");
            killer:addItem(1608) -- Fleeting Memory (wind)
            killer:addItem(1612) -- Radiant Memory (light skillchain)
        end
    end)
end

return g_mixins.families.empty
