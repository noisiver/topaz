-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Grand Marid
-- Note: 
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/marid")}
-----------------------------------
function onMobFight(mob, target)
	local TrySummonChigoe = mob:getLocalVar("TrySummonChigoe")
    -- Try to summon a Chigoe
    if TrySummonChigoe == 1 then
        local spawns = { 16986118, 16986119, 16986120, 16986121, 16986122}
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

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 50)
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

	if isKiller then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	 end
end


