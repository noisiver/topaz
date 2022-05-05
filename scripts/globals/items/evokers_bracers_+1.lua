-----------------------------------------
-- ID: 14904
-- Equip: Evoker's Bracers +1
-- 30% chance to absorb dmg taken into MP of element of avatar currently out
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/summon")
-----------------------------------------

function onItemCheck(target)
    local pets = {
        { tpz.pet.id.FIRESPIRIT, tpz.mod.FIRE_ABSORB_TO_MP },       
        { tpz.pet.id.ICESPIRIT, tpz.mod.ICE_ABSORB_TO_MP },        
        { tpz.pet.id.AIRSPIRIT, tpz.mod.WIND_ABSORB_TO_MP },          
        { tpz.pet.id.EARTHSPIRIT, tpz.mod.EARTH_ABSORB_TO_MP },        
        { tpz.pet.id.THUNDERSPIRIT, tpz.mod.THUNDER_ABSORB_TO_MP },      
        { tpz.pet.id.WATERSPIRIT, tpz.mod.WATER_ABSORB_TO_MP },        
        { tpz.pet.id.LIGHTSPIRIT, tpz.mod.LIGHT_ABSORB_TO_MP },        
        { tpz.pet.id.DARKSPIRIT, tpz.mod.DARK_ABSORB_TO_MP },         
        { tpz.pet.id.CARBUNCLE, tpz.mod.LIGHT_ABSORB_TO_MP },          
        { tpz.pet.id.FENRIR, tpz.mod.DARK_ABSORB_TO_MP },           
        { tpz.pet.id.IFRIT, tpz.mod.FIRE_ABSORB_TO_MP },            
        { tpz.pet.id.TITAN, tpz.mod.EARTH_ABSORB_TO_MP },       
        { tpz.pet.id.LEVIATHAN, tpz.mod.WATER_ABSORB_TO_MP },          
        { tpz.pet.id.GARUDA, tpz.mod.WIND_ABSORB_TO_MP },            
        { tpz.pet.id.SHIVA, tpz.mod.ICE_ABSORB_TO_MP },           
        { tpz.pet.id.RAMUH, tpz.mod.THUNDER_ABSORB_TO_MP },         
        { tpz.pet.id.DIABOLOS, tpz.mod.DARK_ABSORB_TO_MP },           
        { tpz.pet.id.ATOMOS, tpz.mod.DARK_ABSORB_TO_MP },      
        { tpz.pet.id.CAIT_SITH, tpz.mod.LIGHT_ABSORB_TO_MP },         
    }

    for v = tpz.mod.FIRE_ABSORB_TO_MP, tpz.mod.DARK_ABSORB_TO_MP, 1 do
        if target:getLocalVar("Absorb" .. v) > 0 then
            target:addMod(v, -30)
            target:setLocalVar("Absorb" .. v, 0)

            return 0 -- So it's reset to +0 absorb after unequipping the body
        end
    end
    -- Check if Evoker's Bracers is equipped, if it is then add the correct absorb for avatar currently out
    local hands = target:getEquipID(tpz.slot.HANDS)
    local absorb = 0
    for i, element in pairs(pets) do
        if target:getPetID() == element[1] and target:getPetID() ~= nil then
            absorb = element[2]
            if hands == 14904 then -- Evoker's Bracers
                target:addMod(absorb, 30)
                target:setLocalVar("Absorb" .. absorb, 30)
            end
        end
    end
end