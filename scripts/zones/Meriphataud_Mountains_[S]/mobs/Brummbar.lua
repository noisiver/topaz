-----------------------------------
-- Area: Meriphataud Mountains [S]
--   ANNM
--   NM: Brummbar
--  !addkeyitem GREEN_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("DischargeTime", 45)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
	local DischargeTime = mob:getLocalVar("DischargeTime")
	local BattleTime = mob:getBattleTime()
    -- Applies status effects to itself and transfers to nearby targets every 45 seconds
    if BattleTime >= DischargeTime then
        mob:useMobAbility(626) -- 2 hr cloud (Light / White)
        for i = tpz.effect.POISON, tpz.effect.SILENCE do
            mob:addStatusEffect(i, 35, 3, 120)
        end
        mob:addStatusEffect(tpz.effect.WEIGHT, 33, 0, 120)
        mob:addStatusEffect(tpz.effect.SLOW, 2550, 0, 120)
        mob:addStatusEffect(tpz.effect.PLAGUE, 1, 3, 120)
		mob:useMobAbility(2162) -- Emetic Discharge
		mob:setLocalVar("DischargeTime", BattleTime + 45)
	end
    tpz.annm.PetShield(mob, 17174894, 17174899)
end

function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
