-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Enhanced Soulflayer
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 75)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
	local RunAwayPath = mob:getLocalVar("RunAwayPath")
	if RunAwayPath == 1 then -- TODO: Needs proper pathing, gets stuck
	    mob:setPos(-339, -15, 205, tpz.path.flag.RUN)
    end
    if RunAwayPath == 2 then -- TODO: Needs proper pathing, gets stuck
	    mob:setPos( -380, -15, 51, tpz.path.flag.RUN) 
    end
    if RunAwayPath == 3 then -- TODO: Needs proper pathing, gets stuck
	    mob:setPos(-482,-10,-83, tpz.path.flag.RUN) 
    end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
	local StunTime = mob:getLocalVar("StunTime")
	local ImmortalShieldTime = mob:getLocalVar("ImmortalShieldTime")
	local DrainTime = mob:getLocalVar("DrainTime")
	local RunAwayPath = mob:getLocalVar("RunAwayPath")
    local RunAway = mob:getLocalVar("RunAway")
    local AnimationSub = mob:AnimationSub()
	local BattleTime = mob:getBattleTime()
	local Pos = mob:getPos()
	if Pos.x == -339 and Pos.y == -15 and Pos.z == 205  then
        mob:SetMagicCastingEnabled(true)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	    mob:setLocalVar("RunAway", 1)
    end
	if Pos.x == -380 and Pos.y == -15 and Pos.z == 51  then
        mob:SetMagicCastingEnabled(false)
        mob:SetMobAbilityEnabled(true)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	    mob:setLocalVar("RunAway", 2)
    end
	if Pos.x == -482 and Pos.y == -10 and Pos.z == -83  then
        mob:SetMagicCastingEnabled(true)
        mob:SetMobAbilityEnabled(true)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	    mob:setLocalVar("RunAway", 3)
    end

    if mob:getHPP() <= 90 and mob:getHPP() > 80 and RunAway == 0 then
		mob:setLocalVar("RunAwayPath", 1)
        mob:disengage()
    end
    if mob:getHPP() <= 80 and mob:getHPP() > 70 and RunAway == 1  then
		mob:setLocalVar("RunAwayPath", 2)
        mob:disengage()
    end
    if mob:getHPP() <= 70 and RunAway == 2  then
		mob:setLocalVar("RunAwayPath", 3)
        mob:disengage()
    end

	if mob:getHPP() <= 70 then
		if ImmortalShieldTime == 0 then
			mob:setLocalVar("ImmortalShieldTime", BattleTime + math.random(15, 45))
		elseif BattleTime >= ImmortalShieldTime then
		    mob:useMobAbility(1965) -- Immortal Shield
			mob:setLocalVar("ImmortalShieldTime", BattleTime + math.random(90, 120))
		end
	end

    if AnimationSub == 2 then
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGRANGE, -100)
    else
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
    end

    if (mob:getMod(tpz.mod.RAMPART_STONESKIN) == 0) then
        mob:AnimationSub(0) 
    else
        mob:AnimationSub(2) 
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 382 then
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
