---------------------------------------------------------------------------------------------------
-- func: addbuffs
-- desc: Adds buffs to player for testing
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

local function AddBuffs(player)
    player:addStatusEffect(tpz.effect.PROTECT, 55, 0, 0)        -- Protect IV
    player:addStatusEffect(tpz.effect.SHELL, 22, 0, 0)          -- Shell IV
    player:addStatusEffect(tpz.effect.HASTE, 2998, 0, 0)        -- Haste II
    player:addStatusEffect(tpz.effect.MULTI_STRIKES, 50, 0, 0)
end

function onTrigger(player, target)
    if (target == nil) or not target:isPC() then
        AddBuffs(player)
    else
        local targ = GetPlayerByName(target)
        if (targ == nil) then
            player:PrintToPlayer(string.format( "Player named '%s' not found!", target ))
        else
            AddBuffs(targ)
            player:PrintToPlayer(string.format( "Testing buffs were successfully added to %s", target ))
        end
    end
end