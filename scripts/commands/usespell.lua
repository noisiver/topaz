---------------------------------------------------------------------------------------------------
-- func: useSpell
-- desc: Tells the target mob to cast specificed spell.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!nocast")
end

function onTrigger(player, spell)
    
    local targ = player:getCursorTarget()
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    else
        targ:castSpell(spell)
    end
end
