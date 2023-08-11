-----------------------------------------
-- ID: 6061
-- Item: Virus Schema
-- Teaches the black magic Virus
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(256)
end

function onItemUse(target)
    target:addSpell(256)
end
