-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Chigre
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------
-- Todo: add enailments, Drain samba on target if all ailments on, very fast enmity decay, capture speed
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
	mob:setDamage(20)
    mob:setMod(tpz.mod.DEF, 450)
    mob:setMod(tpz.mod.ACC, 500)
    mob:setMod(tpz.mod.EVA, 400)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 450)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
    mob:addListener("ATTACK","CHIGRE_ATTACK", function(mob)
        local target = mob:getTarget()
        mob:resetEnmity(target)
    end)
end

function onAdditionalEffect(mob, target, damage)
    local missingEffects = { };
    local chigreEffects = { tpz.mob.ae.BLIND, tpz.mob.ae.POISON, tpz.mob.ae.PARALYZE, tpz.mob.ae.SLOW, tpz.mob.ae.PETRIFY, tpz.mob.ae.SILENCE, tpz.mob.ae.CURSE, tpz.mob.ae.PLAGUE };
    
    for _,effect in pairs(chigreEffects) do
        if not target:hasStatusEffect(effect) then
            table.insert(missingEffects, effect);
        end
    end

    if #missingEffects == 0 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = 80})
    end

    return tpz.mob.onAddEffect(mob, target, damage, missingEffects[math.random(#missingEffects)], {chance = 100, duration = 180})
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
