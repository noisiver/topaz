-----------------------------------
-- Area: Mamook
--  Mob: Poroggo
-----------------------------------
mixins = {require("scripts/mixins/families/poroggo")}
-----------------------------------

function onMobWeaponSkillPrepare(mob, target)
    return 1957
end

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
