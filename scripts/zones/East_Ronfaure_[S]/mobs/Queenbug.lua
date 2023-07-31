-----------------------------------
-- Area: East Ronfaure [S]
--   ANNM
--   NM: Queenbug
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    -- Once adds are dead, gains access to Searing Effulgence every 45s
    for i = 17109369, 17109374 do
        if not GetMobByID(i):isDead() then
            return
        end
    end
	local SearingTime = mob:getLocalVar("SearingTime")
	local BattleTime = mob:getBattleTime()
    if SearingTime == 0 then
		mob:setLocalVar("SearingTime", BattleTime + 0)
	elseif BattleTime >= SearingTime then
		mob:useMobAbility(2933) -- Searing Effulgence 
		mob:setLocalVar("SearingTime", BattleTime + 45)
	end
    tpz.annm.PetShield(mob, 17109369, 17109374)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
