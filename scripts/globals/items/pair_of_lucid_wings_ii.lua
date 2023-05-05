-----------------------------------------
-- ID: 6475
-- Lucid Wings II
-- Increases TP of the user and nearby allies by 1000
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
	local tp = (1000 * (100 + target:getMod(tpz.mod.STORETP))) / 100
    target:addTP(tp)
end
