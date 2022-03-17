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
    local effects = { } 
    if not target:hasStatusEffect(tpz.effect.BLINDNESS) then
        table.insert(effects, tpz.mob.ae.BLIND)
    end
    if not target:hasStatusEffect(tpz.effect.POISON) then
        table.insert(effects, tpz.mob.ae.POISON)
    end
    if not target:hasStatusEffect(tpz.effect.PARALYSIS) then
        table.insert(effects, tpz.mob.ae.PARALYZE)
    end
    if not target:hasStatusEffect(tpz.effect.SLOW) then
        table.insert(effects, tpz.mob.ae.SLOW)
    end
    if not target:hasStatusEffect(tpz.effect.PETRIFICATION) then
        table.insert(effects, tpz.mob.ae.PETRIFY)
    end
    if not target:hasStatusEffect(tpz.effect.SILENCE) then
        table.insert(effects, tpz.mob.ae.SILENCE)
    end
    if not target:hasStatusEffect(tpz.effect.CURSE) then
        table.insert(effects, tpz.mob.ae.CURSE)
    end
    if not target:hasStatusEffect(tpz.effect.PLAGUE) then
        table.insert(effects, tpz.mob.ae.PLAGUE)
    end

    if target:hasStatusEffect(tpz.effect.BLINDNESS) and target:hasStatusEffect(tpz.effect.POISON) and target:hasStatusEffect(tpz.effect.PARALYSIS)
    and target:hasStatusEffect(tpz.effect.SLOW) and target:hasStatusEffect(tpz.effect.PETRIFICATION) and target:hasStatusEffect(tpz.effect.SILENCE)
    and target:hasStatusEffect(tpz.effect.CURSE_I) and target:hasStatusEffect(tpz.effect.PLAGUE) then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = 80})
    end

    return tpz.mob.onAddEffect(mob, target, damage, effects[math.random(#effects)], {chance = 100, duration = 180})
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
