-----------------------------------
-- Area: Sauromugue Champaign [S]
--   ANNM
--   NM: Iqi-Balam
--  !addkeyitem GREEN_LABELED_CRATE
-- L-8
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:SetMagicCastingEnabled(false)
    mob:setLocalVar("recover", 0)
    mob:setLocalVar("chargedWhisker", 0)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    local chargedWhisker = mob:getLocalVar("chargedWhisker")
    local recover = mob:getLocalVar("recover")
    local BattleTime = mob:getBattleTime()

    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 20)

    -- Enable casting after 45s so it won't open with a spell immediately
    if (BattleTime > 20) then
        mob:SetMagicCastingEnabled(true)
    end

    if (chargedWhisker == 1) then
        mob:addHP(1250)
        mob:useMobAbility(483) -- Charged Whisker
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("recovers 1250 HP.",0,"Iqi-Balam")
        end
        mob:setLocalVar("chargedWhisker", 0)
    end
    -- If successfully casts a spell, heals itself and will immediately Charged Whisker afterwards
    mob:addListener("MAGIC_USE", "IQI_MAGIC", function(mob, target, spell, action)
        mob:setLocalVar("chargedWhisker", 1)
    end)
    tpz.annm.PetShield(mob, 17178906, 17178911)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
