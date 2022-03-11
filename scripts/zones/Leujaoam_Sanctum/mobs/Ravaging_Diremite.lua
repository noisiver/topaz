-----------------------------------
-- Area: Leujaoam Sanctum (Leujaoam Cleansing)
--  Mob: Ravaging Diremite
-----------------------------------
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:hideName(true)
    mob:setMod(tpz.mod.MDEF, 40)
    mob:setMod(tpz.mod.UDMGMAGIC, 13)
    mob:setMobMod(tpz.mobMod.MOVE, 0)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 20)
    mob:SetMobAbilityEnabled(true)
    mob:setLocalVar("Message", 1)
    mob:setLocalVar("MessageWait", 0)
	mob:setLocalVar("SpinningTopTime", 0)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    mob:setMobMod(tpz.mobMod.MOVE, 0)
    mob:SetMobAbilityEnabled(true)
end

function onMobEngaged(mob)
    mob:hideName(false)
    mob:setMobMod(tpz.mobMod.MOVE, 0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:SetMobAbilityEnabled(true)
end

function onMobFight(mob, target)
	local SpinningTopTime = mob:getLocalVar("SpinningTopTime")
	local Message = mob:getLocalVar("Message")
	local MessageWait = mob:getLocalVar("MessageWait")
	local BattleTime = mob:getBattleTime()
    mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.GEO_SLOW, 3000, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)

	if mob:getHPP() <= 35 then
		if SpinningTopTime == 0 then
			mob:setLocalVar("SpinningTopTime", BattleTime)
		elseif BattleTime >= SpinningTopTime then
            mob:SetMobAbilityEnabled(true)
            mob:setMobMod(tpz.mobMod.MOVE, -25)
            mob:useMobAbility(365) -- Spinning Top
            mob:useMobAbility(365) -- Spinning Top
            mob:useMobAbility(365) -- Spinning Top
            mob:SetMobAbilityEnabled(false)
            mob:setLocalVar("MessageWait", BattleTime + 14)
            mob:setLocalVar("Message", 0)
			mob:setLocalVar("SpinningTopTime", BattleTime + 45)
		end
	end
    if Message == 0 and BattleTime >= MessageWait then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("The Ravaging Diremite is very exhausted.",0,"Ravaging Diremite")
        end
        mob:setLocalVar("Message", 1)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    SpawnMob(17060198, instance)
    local zonePlayers = mob:getZone():getPlayers()
    for _, zonePlayer in pairs(zonePlayers) do
        zonePlayer:PrintToPlayer("You hear a rumbling noise in the distance...",0,"???")
    end
end