-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Plague Chigoe
-----------------------------------
require("scripts/globals/utils")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
	mob:setDamage(25)
    mob:setMod(tpz.mod.ATTP, 50)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 75)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 0) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    mob:hideName(false)
    mob:untargetable(false)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (player:getCharVar("ThePrankster") == 3) then
        player:setCharVar("ThePrankster", 4)
    end
end

function onAdditionalEffect(mob, target, damage)
        local amount = 0
        -- Drains 1% MP per hit
        amount = target:getMaxMP() * 0.01
        if amount > target:getMP() then
            amount = target:getMP()
        end
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.MP_DRAIN, {chance = 100, power = amount})
end
