-----------------------------------
-- Area: The Eldieme Necropolis [S] (175)
--   ANNM
--   NM: Ellylldan
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MOVE, 0)
    mob:setLocalVar("patrolPath", 1)
    mob:setLocalVar("damageTick", 0)
    tpz.annm.NMMods(mob) 
end

function onPath(mob)
    tpz.path.patrol(mob, pathNodes)
end


function onMobRoam(mob)
    -- move to start position if not moving
    if not mob:isFollowingPath() then
        mob:pathThrough(tpz.path.first(pathNodes))
    end

    local drawInTime = mob:getLocalVar("drawInTime")

    -- Damage nearby players and drain their MP while patorlling around
    if os.time() >= damageTick then
        mob:setLocalVar("damageTick", os.time() + 3)
        local nearbyPlayers = mob:getPlayersInRange(12)
        if nearbyPlayers == nil then return end
        if os.time() >= TrampleDelay then
            for _,v in ipairs(nearbyPlayers) do
                local mp = math.floor((v:getMaxMP() * math.random(1, 3)) / 10)
                local dmg = 500
                dmg = v:physicalDmgTaken(dmg, tpz.damageType.SLASHING)
                v:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
                v:delMP(mp)
                mob:setLocalVar("TrampleDelay", os.time() + 3)
            end
        end
    end
 end

function onMobFight(mob, target)
	local patrolPath = mob:getLocalVar("patrolPath")
    local hp = mob:getHPP()

    -- Movement speed decereases as HP lowers
    if (hp < 75) then
        mob:setMod(tpz.mod.MOVE, 5)
    elseif (hp < 50) then
        mob:setMod(tpz.mod.MOVE, 15)
    elseif (hp < 25) then
        mob:setMod(tpz.mod.MOVE, 20)
    end

    if mob:getTPP() > 1000 then
        mob:setLocalVar("patrolPath", 0)
    end

    -- Patrol around the area and never auto-attack
	if (patrolPath == 1) then
		mob:pathTo( -26, -3, -5) -- Position needs to be added
		mob:setLocalVar("patrolPath", 2)
	end
	
	if (patrolPath == 2) then
		mob:pathTo(-262, -20, 20) -- Position needs to be added
		mob:setLocalVar("patrolPath", 1)
	end
    tpz.annm.PetShield(mob, 17494280, 17494285)
end

function onMobWeaponSkill(target, mob, skill)
    -- After using a TP move, continue on a random patrol path
    if skill:getID() > 0 then
        mob:setLocalVar("patrolPath", math.random(1, 2))
    end
end


function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
