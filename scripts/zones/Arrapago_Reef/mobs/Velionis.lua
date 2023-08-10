-----------------------------------
-- Area: Arrapago Reef
--  ZNM: Velionis
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setMod(tpz.mod.DEF, 400)
    mob:setMod(tpz.mod.EVA, 320)
    mob:setMod(tpz.mod.REGAIN, 50)
    mob:setMod(tpz.mod.UFASTCAST, 10)
    mob:setLocalVar("HPP", 90)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 7)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 3000) -- 5k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 5000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
    local FastCast = mob:getLocalVar("HPP")
    if mob:getHPP() <= FastCast then
        if mob:getHPP() > 10 then
            mob:addMod(tpz.mod.UFASTCAST, 5)
            mob:setLocalVar("HPP", mob:getHPP() - 10)
        end
    end
    mob:addListener("MAGIC_START", "VELIONIS_MAGIC_START", function(mob, spell)
        mob:delStatusEffectSilent(tpz.effect.BLAZE_SPIKES)
    end)
    mob:addListener("MAGIC_STATE_EXIT", "VELIONIS_MAGIC_STATE_EXIT", function(mob, spell)
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 250, 0, 0)
        mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
    end)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 100)
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
