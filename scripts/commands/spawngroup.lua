---------------------------------------------------------------------------------------------------
-- func: spawnmob
-- desc: Spawns a mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!spawnmob <mob ID start> <mob ID end>")
end

function onTrigger(player, mobIdstart, mobIdEnd)
    local zone = player:getZone()
    if zone:getType() == tpz.zoneType.INSTANCED then
        local instance = player:getInstance()
        -- validate mobIdstart
        if (mobIdstart == nil) or (mobIdEnd == nil) then
            error(player, "You must provide a mob ID.")
            return
        end
        for v = mobIdstart, mobIdEnd do
            SpawnMob(v, instance)
        end
        player:PrintToPlayer( string.format("Spawned mob ID %s to %s.", mobIdstart, mobIdEnd) )
    else
        -- validate mobIdstart
        if (mobIdstart == nil) or (mobIdEnd == nil) then
            error(player, "You must provide a mob ID.")
            return
        end
        for v = mobIdstart, mobIdEnd do
            SpawnMob(v)
        end
        player:PrintToPlayer( string.format("Spawned mob ID %s to %s.", mobIdstart, mobIdEnd) )
    end
end
