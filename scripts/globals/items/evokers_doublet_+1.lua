-----------------------------------------
-- ID: 14487
-- Equip: Evoker's Doublet +1
-- +25 resist to element of avatar if equipped while avatar is out.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/summon")
-----------------------------------------

function onItemCheck(target)
    local pets = {
        { tpz.pet.id.FIRESPIRIT, tpz.mod.FIRERES },       
        { tpz.pet.id.ICESPIRIT, tpz.mod.ICERES },        
        { tpz.pet.id.AIRSPIRIT, tpz.mod.WINDRES },          
        { tpz.pet.id.EARTHSPIRIT, tpz.mod.EARTHRES },        
        { tpz.pet.id.THUNDERSPIRIT, tpz.mod.THUNDERRES },      
        { tpz.pet.id.WATERSPIRIT, tpz.mod.WATERRES },        
        { tpz.pet.id.LIGHTSPIRIT, tpz.mod.LIGHTRES },        
        { tpz.pet.id.DARKSPIRIT, tpz.mod.DARKRES },         
        { tpz.pet.id.CARBUNCLE, tpz.mod.LIGHTRES },          
        { tpz.pet.id.FENRIR, tpz.mod.DARKRES },           
        { tpz.pet.id.IFRIT, tpz.mod.FIRERES },            
        { tpz.pet.id.TITAN, tpz.mod.EARTHRES },       
        { tpz.pet.id.LEVIATHAN, tpz.mod.WATERRES },          
        { tpz.pet.id.GARUDA, tpz.mod.WINDRES },            
        { tpz.pet.id.SHIVA, tpz.mod.ICERES },           
        { tpz.pet.id.RAMUH, tpz.mod.THUNDERRES },         
        { tpz.pet.id.DIABOLOS, tpz.mod.DARKRES },           
        { tpz.pet.id.ATOMOS, tpz.mod.DARKRES },      
        { tpz.pet.id.CAIT_SITH, tpz.mod.LIGHTRES },         
    }
    for v = tpz.mod.FIRERES, tpz.mod.DARKRES, 1 do
        if target:getLocalVar("Element" .. v) > 0 then
            target:addMod(v, -25)
            target:setLocalVar("Element" .. v, 0)

            return 0 -- So it's reset to +0 resist after unequipping the body
        end
    end
    -- Check if Evoker's Doublet is equipped, if it is then add the correct resist for avatar currently out
    local body = target:getEquipID(tpz.slot.BODY)
    local resist = 0
    for i, element in pairs(pets) do
        if target:getPetID() == element[1] and target:getPetID() ~= nil then
            resist = element[2]
            if body == 14487 then -- Evoker's Doublet
                target:addMod(resist, 25)
                target:setLocalVar("Element" .. resist, 25)
            end
        end
    end
end
