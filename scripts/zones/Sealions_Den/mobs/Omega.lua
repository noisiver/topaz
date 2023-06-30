-----------------------------------
-- Area: Sealions Den
--  Mob: Omega
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/msg");
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(80)
	mob:addMod(tpz.mod.ATTP, 50)
	mob:addMod(tpz.mod.DEFP, 20) 
	mob:addMod(tpz.mod.ACC, 15) 
	mob:addMod(tpz.mod.EVA, 15)
	mob:setMod(tpz.mod.MDEF, 14) 
	mob:setMod(tpz.mod.COUNTER, 10)
	mob:setMod(tpz.mod.REGEN, 1)
	mob:setMod(tpz.mod.REGAIN, 100) -- Should use TP move every ~10 seconds
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25) 
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 10)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
	mob:addTP(3000)
	mob:setLocalVar("speed", 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobFight(mob,target)
    -- Gains attack speed at 60% and 25% HP
    local speed = mob:getLocalVar("speed")
    local hpp = mob:getHPP()
    if hpp <= 60 and speed < 1 then
        mob:setLocalVar("speed", 1)
		mob:setMod(tpz.mod.HASTE_MAGIC, 1500)
        mob:setMod(tpz.mod.REGAIN, 150)
    elseif hpp <= 25 and speed < 2 then
        mob:setLocalVar("speed", 2)
        mob:setMod(tpz.mod.ATTP, 100)
		mob:setMod(tpz.mod.HASTE_MAGIC, 2500)
        mob:setMod(tpz.mod.REGAIN, 200)
    elseif hpp <= 10 and speed < 3 then
        mob:setLocalVar("speed", 3)
		mob:setMod(tpz.mod.HASTE_MAGIC, 5000)
        mob:setMod(tpz.mod.REGAIN, 500)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.OMEGA_OSTRACIZER)
    player:startEvent(11)
end

function onEventFinish(player, csid, option)
    if csid == 11 then
        local inst = player:getBattlefield():getArea()

        if inst >= 1 and inst <= 3 then
            -- players are healed in between fights, but their TP is set to 0
            player:setHP(player:getMaxHP())
            player:setMP(player:getMaxMP())
            player:setTP(0)
            player:setLocalVar("[OTBF]cs", 2)

            -- move player to instance
            if inst == 1 then
                player:setPos(-779, -103, -80)
            elseif inst == 2 then
                player:setPos(-140, -23, -440)
            elseif inst == 3 then
                player:setPos(499, 56, -802)
            end
        end
    end
end