---------------------------------------------------------------------------------------------------
-- func: useSpell
-- desc: Tells the target mob to cast specificed spell on target or self.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!nocast")
end

function onTrigger(player, spell, self)
    
    local targ = player:getCursorTarget()
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    else
        if self == nil then
            targ:castSpell(spell)
        else
            targ:castSpell(spell, targ)
        end
    end
end
