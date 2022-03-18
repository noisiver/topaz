-----------------------------------
-- Area: Halvung
--   NM: Dextrose (T2 ZNM)
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/rage")}
-----------------------------------
local PuddingList =
{
    [1] = 17031451,
    [2] = 17031453,
    [3] = 17031456,
    [4] = 17031460,
    [5] = 17031461,
}

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(125)
    mob:setMod(tpz.mod.DEF, 500)
    mob:setMod(tpz.mod.EVA, 340)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 900)
	mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:setLocalVar("FindPuddingTime", 0)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
	local FindPuddingTime = mob:getLocalVar("FindPuddingTime")
	local PathToPudding = mob:getLocalVar("PathToPudding")
	local Pudding = mob:getLocalVar("Pudding")
	local LastPudding = mob:getLocalVar("LastPudding")
	local Retaliated = mob:getLocalVar("Retaliated")
	local BattleTime = mob:getBattleTime()
    -- Retaliate weapon skills used on him with Amorphic Spikes
    mob:addListener("WEAPONSKILL_TAKE", "DEXTROSE_WEAPONSKILL_TAKE", function(target, user, wsid)
        if target:checkDistance(user) <= 7 and target:getLocalVar("Retaliated") == 0 and target:actionQueueEmpty() and wsid ~= 1826 then
            target:setLocalVar("Retaliated", 1)
            target:useMobAbility(1824, user) -- Amorphic Spike
            printf("retal on user")
        elseif target:checkDistance(user) > 7 and target:getLocalVar("Retaliated") == 0 and target:actionQueueEmpty() and wsid ~= 1826 then
            target:setLocalVar("Retaliated", 1)
            local user = target:getTarget()
            target:useMobAbility(1824, user) -- Amorphic Spike
            printf("retal on target")
        end
    end)
    -- Search for a Ebony Pudding to heal off of(Synergism TP Move)
	if FindPuddingTime == 0 then
		mob:setLocalVar("FindPuddingTime", BattleTime + 30)
	elseif BattleTime >= FindPuddingTime and PathToPudding == 0 then
        Pudding = 17031451
        -- If dead, go to next pudding in list
        if GetMobByID(Pudding):isDead() then
            Pudding = 17031453
        elseif GetMobByID(Pudding):isDead() then
            Pudding = 17031456
        elseif GetMobByID(Pudding):isDead() then
            Pudding = 17031460
        elseif GetMobByID(Pudding):isDead() then
            Pudding = 17031461
        end
        -- Never go to the same pudding twice in a row
        if LastPudding == Pudding then
            Pudding = PuddingList[math.random(#PuddingList)]
            mob:setLocalVar("RandomPudding", 1)
        end
        -- Don't go to dead Ebony Puddings
        if GetMobByID(Pudding):isDead() then
            return
        end
        --printf("Selecting Pudding")
        mob:setLocalVar("Pudding", Pudding)
        mob:setLocalVar("PathToPudding", 1)
    end
    -- Path to selected Ebony Pudding
	if PathToPudding == 1 then
        local mobX = GetMobByID(Pudding):getXPos()
        local mobY = GetMobByID(Pudding):getYPos()
        local mobZ = GetMobByID(Pudding):getZPos()
        mob:pathTo(mobX, mobY, mobZ)
        --printf("Pathing to Pudding")
        mob:setLocalVar("SelectPudding", 1)
		mob:SetAutoAttackEnabled(false)
        mob:SetMagicCastingEnabled(false)
        mob:SetMobAbilityEnabled(false)
        if mob:checkDistance(GetMobByID(Pudding)) <= 5 then
            mob:useMobAbility(1826) -- Synergism
            --printf("Using Synergism")
            mob:setLocalVar("LastPudding", Pudding)
            mob:setLocalVar("FindPuddingTime", BattleTime + 30)
            mob:setLocalVar("PathToPudding", 0)
            mob:setLocalVar("Retaliated", 0)
        end
    end
    -- Make sure being WSed mid casting doesn't break him being able to Retaliate
    mob:addListener("MAGIC_STATE_EXIT", "DEXTROSE_MAGIC_STATE_EXIT", function(mob, spell)
        mob:setLocalVar("Retaliated", 0)
    end)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1824 then -- Amorphic Spike
        mob:setLocalVar("Retaliated", 0)
    end
    if skill:getID() == 1826 then -- Synergism
	    mob:SetAutoAttackEnabled(true)
        mob:SetMagicCastingEnabled(true)
        mob:SetMobAbilityEnabled(true)
        mob:setLocalVar("Retaliated", 0)
    end
end

function onMobDeath(mob, player, isKiller)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
