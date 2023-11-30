---------------------------------------------------------------------------------------------------
-- func: adddebuffs
-- desc: Adds debuffs to target for testing
---------------------------------------------------------------------------------------------------
require("scripts/globals/mobs")

cmdprops =
{
    permission = 1,
    parameters = "s"
}

local function AddDebuffs(player)
    player:addStatusEffect(tpz.effect.SLOW, 3000, 0, 0)         -- 30% Slow
    player:addStatusEffect(tpz.effect.PARALYSIS, 3000, 0, 0)    -- 20% Paralyze
    player:addStatusEffect(tpz.effect.BLINDNESS, 20, 0, 0)      -- -20 Blind
    player:addStatusEffect(tpz.effect.ADDLE, 15, 0, 0)      -- -15 Addle
end

function onTrigger(player, target)
    if (target == nil) or not target:isMob() then
        player:PrintToPlayer(string.format( "Target is not a mob or pet" ))
    else
        local mob = MobName(target)
        AddDebuffs(target)
        player:PrintToPlayer(string.format( "Testing debuffs were successfully added to %s", mob ))
    end
end