-- wamoura family mixin

require("scripts/globals/mixins")
require("scripts/globals/utils")
require("scripts/globals/zone")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.wamoura = function(mob)
    mob:addListener("DESPAWN", "WAMOURA_DESPAWN", function(mob)
        local ID = zones[mob:getZoneID()]
        if evolvedFromPrince(mob) then
            local princeID = mob:getID() - 1
            DisallowRespawn(princeID, false)
        end
    end)
end

function evolvedFromPrince(mob)
    local evolved = false
    local ID = zones[mob:getZoneID()]
    local mobId = mob:getID()

    for i,v in pairs(ID.mob.EVOLVING_WAMOURA_PRINCES) do
        if mobId == v+1 then
            evolved = true
        end
    end

    return evolved    
end

return g_mixins.families.wamoura
