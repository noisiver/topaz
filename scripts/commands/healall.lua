-----------------------------------------------------------------------
-- func: Fully heals all players and removes status effects.
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player)
    local zonePlayers = player:getZone():getPlayers()
    for _, zonePlayer in pairs(zonePlayers) do
        -- delete status effect
        for v = 1,31,1 do
            zonePlayer:delStatusEffectSilent(v)
        end
        for v = 128,142,1 do
            zonePlayer:delStatusEffectSilent(v)
        end
        for v = 144,149,1 do
            zonePlayer:delStatusEffectSilent(v)
        end
        for v = 167,168,1 do
            zonePlayer:delStatusEffectSilent(v)
        end
        for v = 192,194,1 do
            zonePlayer:delStatusEffectSilent(v)
        end
        zonePlayer:setHP(3000)
        zonePlayer:setMP(3000)
        zonePlayer:PrintToPlayer( string.format( "Successfully healed everyone's HP and MP to full and removed all negative status effects.") )
    end
end
