-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Batteilant Bhoot
-- DRG
-----------------------------------
function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
end

function onMobEngaged(mob, target)
	if mob:getMainJob() == tpz.job.DRG then
		mob:spawnPet()
	end
end

function onMobWeaponSkillPrepare(mob, target)
    return 1795 -- Only uses Malediction
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1795 then -- Malediction
         mob:useMobAbility(478) -- Hell Slash
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
