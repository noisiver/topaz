---------------------------------------------------------------------------------------------------
-- func: open
-- desc: Opens and Closes doors
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")
---------------------------------------------------------------------------------------------------


cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!open")
end

function onTrigger(player)
    
    local targ = player:getCursorTarget()
    
    if targ == nil or targ:isNPC() == false then
        error(player, "you must select a target door with the cursor first")
    end
    if  targ:getAnimation() == 9 then
        targ:setAnimation(tpz.anim.OPEN_DOOR)
        player:PrintToPlayer(string.format("%s is now open!", targ:getName()))
    elseif targ:getAnimation() == 8 then
        targ:setAnimation(tpz.anim.CLOSE_DOOR)
        player:PrintToPlayer(string.format("%s is now closed!", targ:getName()))
    end
 end
