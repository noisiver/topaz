-----------------------------------
--
--     tpz.effect.PALISADE
--     +100% defense for 1 minute
--  Removes movement from user and all enemy targets in range
-----------------------------------
function onEffectGain(target, effect)
	target:addMod(tpz.mod.DEFP, 100)
    target:addMod(tpz.mod.ENMITY_LOSS_REDUCTION, 100)
    effect:setPower(target:speed())
    target:speed(0)
    local entities = target:getNearbyMobs(12)
    local mobNearby = false;
    for i, entity in pairs(entities) do
        if target:getID() ~= entity:getID() and entity:isSpawned() then
            mobNearby = true;
            entity:setMobMod(tpz.mobMod.NO_MOVE, 1)
		end
	end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.DEFP, 100)
    target:delMod(tpz.mod.ENMITY_LOSS_REDUCTION, 100)
    target:speed(effect:getPower())
    local entities = target:getNearbyMobs(12)
    local mobNearby = false;
    for i, entity in pairs(entities) do
        if target:getID() ~= entity:getID() and entity:isSpawned() then
            mobNearby = true;
            entity:setMobMod(tpz.mobMod.NO_MOVE, 0)
		end
	end
end
