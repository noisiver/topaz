-----------------------------------------
-- ID: 5423
-- Bottled Fay
-- Aborts any event in Everbloom Hollow, Ghoyu's Reverie, and Ruhotz Silvermines.
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------------

function onItemCheck(target)
    if target:getZoneID() == tpz.zone.EVERBLOOM_HOLLOW then
        return 0
    elseif target:getZoneID() == tpz.zone.GHOYUS_REVERIE then
        return 0
    elseif target:getZoneID() == tpz.zone.RUHOTZ_SILVERMINES then
        return 0
    end

    return 56
end

function onItemUse(target)
    if target:getZoneID() == tpz.zone.EVERBLOOM_HOLLOW then
        target:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.EVERBLOOM_EXIT, 0, 1)
    elseif target:getZoneID() == tpz.zone.GHOYUS_REVERIE then
        target:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.GHOYUS_EXIT, 0, 1)
    elseif target:getZoneID() == tpz.zone.RUHOTZ_SILVERMINES then
        target:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.GHOYUS_EXIT, 0, 1) -- need capture for proper exit location in this zone
    end
end
