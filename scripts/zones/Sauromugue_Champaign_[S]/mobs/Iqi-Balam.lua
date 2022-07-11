-----------------------------------
-- Area: Sauromugue Champaign [S]
--   ANNM
--   NM: Iqi-Balam
--  !addkeyitem GREEN_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("chargedWhisker", 0)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    local chargedWhisker = mob:getLocalVar("chargedWhisker")
    if (chargedWhisker == 1) then
        mob:useMobAbility(483) -- Charged Whisker
        mob:setLocalVar("chargedWhisker", 0)
    end
    -- If successfully casts a spell, heals itself and will immediately Charged Whisker afterwards
    mob:addListener("MAGIC_STATE_EXIT", "IQI_MAGIC_STATE_EXIT", function(mob, spell)
        mob:setLocalVar("chargedWhisker", 1)
        mob:addHP(1250)
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("Iqi-Balam recovers 1250 HP.",0,"Iqi-Balam")
        end
    end)
    tpz.annm.PetShield(mob, 17178906, 17178911)
end

function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
