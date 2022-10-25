-----------------------------------
--
-- Magic Shield blocks magic, but NOT breath attacks
-- If power is 8, 50% MDT from BEHIND
-- If power is 7, 75% MDT from BEHIND
-- If power is 6, 50% MDT in FRONT
-- If power is 5, 75% MDT in FRONT
-- If power is 4, 100% MDT from BEHIND
-- If power is 3, 100% MDT in FRONT
-- If power is 2, 100% magic absorb
-- If power is < 2, 100% MDT
-- if power is > 100, adds a "Magic Stoneskin" effect.
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target, effect)
    if effect:getPower() < 2 then
        target:addMod(tpz.mod.UDMGMAGIC, -101)
        if target:isPC() and target:hasTrait(77) then -- Iron Will
            target:addMod(tpz.mod.SPELLINTERRUPT, target:getMerit(tpz.merit.IRON_WILL))
        end
    elseif effect:getPower() == 2 then
        target:addMod(tpz.mod.MAGIC_ABSORB, 100)
    elseif effect:getPower() > 100 then
        target:setMod(tpz.mod.RAMPART_STONESKIN, effect:getPower())
    end
end

function onEffectLose(target, effect)
    if effect:getPower() < 2 then
        target:delMod(tpz.mod.UDMGMAGIC, -101)
        if target:isPC() and target:hasTrait(77) then -- Iron Will
            target:delMod(tpz.mod.SPELLINTERRUPT, target:getMerit(tpz.merit.IRON_WILL))
        end
    elseif effect:getPower() == 2 then
        target:delMod(tpz.mod.MAGIC_ABSORB, 100)
    elseif effect:getPower() == 100 then
        target:setMod(tpz.mod.RAMPART_STONESKIN, 0)
    end
end
