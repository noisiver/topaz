require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}


g_mixins.families.mine_layer = function(mob)
    mob:addListener("SPAWN", "MINE_LAYER_SPAWN", function(mob)
        mob:setLocalVar("LayMine", os.time() + math.random(15, 45))
    end)

    mob:addListener("ROAM_TICK", "MINE_LAYER_RTICK", function(mob)
        if os.time() >= mob:getLocalVar("LayMine") then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            local mine = GetMobByID(mob:getID()+1)
            if not mine:isSpawned() then
                mine:setSpawn(mobX, mobY, mobZ)
                mine:spawn()
            end
        end
    end)
end

return g_mixins.families.mine_layer
