-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--   ANNM
--   NM: Amaranth
--  !addkeyitem GREEN_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("CharmTime", 45)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
	local CharmTime = mob:getLocalVar("CharmTime")
	local BattleTime = mob:getBattleTime()
    -- If a honey fly is in range, will attempt to charm every 2 minutes
    for i = 17170651, 17170656 do
        local fly = GetMobByID(i)
        if fly:checkDistance(mob) <= 30 and fly:isAlive() then
            if BattleTime >= CharmTime then
			    mob:useMobAbility(2169) -- Soothing Aroma
			    mob:setLocalVar("CharmTime", BattleTime + 120)
                break
		    end
        end
    end
    tpz.annm.PetShield(mob, 17170651, 17170656)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
