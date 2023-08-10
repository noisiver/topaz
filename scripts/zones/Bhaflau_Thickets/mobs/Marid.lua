-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Marid
-- Note: Place holder Mahishasura and Grand Marids
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/marid")}
-----------------------------------
function onMobFight(mob, target)
	local TrySummonChigoe = mob:getLocalVar("TrySummonChigoe")
    -- Try to summon a Chigoe
    if TrySummonChigoe == 1 then
        local spawns = { 16990289, 16990290, 16990291, 16990292, 16990293}
        local Chigoe = GetMobByID(spawns[math.random(#spawns)])
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        if Chigoe:isSpawned() then -- Keep trying to summon a Chigoe until not rolling the same Chigoe
            return
        end
        Chigoe:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
	    Chigoe:spawn()
	    Chigoe:updateEnmity(target)
        mob:setLocalVar("TrySummonChigoe", 0)
    end
end


function onMobWeaponSkill(target, mob, skill)
    if skill:getID() > 0 then -- Spawns a Chigoe after using any TP move
        mob:setLocalVar("TrySummonChigoe", 1)
    end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.MAHISHASURA_PH, 20, 10800) -- 3 hours
    tpz.mob.phOnDespawn(mob, ID.mob.GRAND_MARID1_PH, 20, 1800)
    tpz.mob.phOnDespawn(mob, ID.mob.GRAND_MARID2_PH, 20, 1800)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 10)
    if isKiller then
	    if mob:AnimationSub() >= 1 then
		    if math.random(1,100) <= 5 then 
			    player:addTreasure(2147, mob) --Marid Tusk
		    end
		    if mob:AnimationSub() == 2 then
			    if math.random(1,100) <= 5 then 
				    player:addTreasure(2147, mob) --Marid Tusk
			    end
		    end
	    end
    end

	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	 end
end


