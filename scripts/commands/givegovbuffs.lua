---------------------------------------------------------------------------------------------------
-- func: gives the player gov buffs
-- desc: Logs the target player off by force.
require("scripts/globals/regimes")
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!givegovbuffs <number of buffs>")
end

function onTrigger(player, arg1)
    -- validate target
    local targ
    if (target == nil) then
        targ = player:getCursorTarget()
    else
        targ = GetPlayerByName( target )
        if (targ == nil) then
            error(player, string.format( "Invalid player '%s' given.", target ) )
            return
        end
    end
     
    -- give GOV buffs
    local buffsToGive = arg1
    local buffsGiven = 0
    while buffsGiven < buffsToGive do
        targ:addStatusEffectSilent(tpz.effect.PROWESS, arg1, 0, 0)
        addGovProwessBonusEffect(targ)
        buffsGiven = buffsGiven +1
    end

    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer(string.format("%s has been given a random GOV effect", targ:getName()))
    end 
end
