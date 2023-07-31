-----------------------------------
-- Area: Halvung
--  ZNM: Achamoth
-----------------------------------
mixins =
{
    require("scripts/mixins/rage")
}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
-----------------------------------
function spawnPetInBattle(mob, pet)
    mob:entityAnimationPacket("casm")
    mob:SetAutoAttackEnabled(false)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:timer(3000, function(mob)
        mob:entityAnimationPacket("shsm")
        mob:SetAutoAttackEnabled(true)
        mob:SetMagicCastingEnabled(true)
        mob:SetMobAbilityEnabled(true)
        pet:spawn()
        pet:updateEnmity(mob:getTarget())
    end)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 290)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 8000) -- 9k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 9000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    mob:setMobMod(tpz.mobMod.BUFF_CHANCE, 50)
    mob:setMobMod(tpz.mobMod.HP_HEAL_CHANCE, 75) -- Starts casting cures below 25%
    mob:setMobMod(tpz.mobMod.HEAL_CHANCE, 50) 
    mob:AnimationSub(0)
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
	local SummonTime = mob:getLocalVar("SummonTime")
    local SyngerismUses = mob:getLocalVar("SyngerismUses")
	local PathToPudding = mob:getLocalVar("PathToPudding")
	local Pudding = mob:getLocalVar("Pudding")
	local LastPudding = mob:getLocalVar("LastPudding")
	local Retaliated = mob:getLocalVar("Retaliated")
	local BattleTime = mob:getBattleTime()
    -- Spawns an Achamoth campa every 60 seconds
	if SummonTime == 0 then
		mob:setLocalVar("SummonTime", BattleTime + 60)
	elseif BattleTime >= SummonTime and mob:actionQueueEmpty() then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local pet = GetMobByID(mob:getID() +1)
        local FirstWamoura = GetMobByID(mob:getID() +3)
        local SecondWamoura = GetMobByID(mob:getID() +4)
        -- Don't spawn Wamouracamp if both Wamoura are spawned
        if FirstWamoura:isSpawned() and SecondWamoura:isSpawned() then
            mob:setLocalVar("SummonTime", 0) -- Ensure it won't instantly try to resummon after both adds are dead
            return
        end 
        if not pet:isSpawned() and not FirstWamoura:isSpawned() then
            pet:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
            spawnPetInBattle(mob, pet)
            mob:setLocalVar("SummonTime", BattleTime + 60)
        else
            pet = GetMobByID(mob:getID() +2)
            pet:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
            spawnPetInBattle(mob, pet)
            mob:setLocalVar("SummonTime", BattleTime + 60)
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onAdditionalEffect(mob, target, damage)
    -- Restores 30 MP per hit. Additional effect: Achamoth recovers 30 MP.
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.RECOVER_MP, {power = 30})
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 300)
    for v = 17031601, 17031604, 1 do
        DespawnMob(v)
    end
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
