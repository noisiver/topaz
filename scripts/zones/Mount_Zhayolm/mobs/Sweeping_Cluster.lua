-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Sweeping Cluster
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
	mob:AnimationSub(0)
end

function onMobFight(mob, target)
	if mob:AnimationSub() > 2 then
		mob:AnimationSub(0)
		mob:AnimationSub(2)
	end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 571 then --3 Clusters Self-Destruct
		mob:AnimationSub(1)
	elseif skill:getID() == 572 then --2 Clusters Self-Destruct
		mob:AnimationSub(2)
	end
end

function onMobDeath(mob)
end