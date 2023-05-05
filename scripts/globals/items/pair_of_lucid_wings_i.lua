-----------------------------------------
-- ID: 5834
-- Lucid Wings I
-- Increases TP of the user and nearby allies by 500
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
	local tp = (500 * (100 + target:getMod(tpz.mod.STORETP))) / 100
    target:addTP(tp)
end
