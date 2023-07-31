-----------------------------------
-- Area: Crawler's Nest [S]
--   ANNM
--   NM: Goldcap
--  !addkeyitem BLUE_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 35)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    tpz.annm.PetShield(mob, 17477730, 17477735)
end

function onAdditionalEffect(mob, target, damage)
    local possibleEffects = { };
    local ellylldanEffects = {
        [tpz.effect.BLINDNESS] = tpz.mob.ae.BLIND,
        [tpz.effect.POISON] = tpz.mob.ae.POISON,
        [tpz.effect.PARALYSIS] = tpz.mob.ae.PARALYZE,
        [tpz.effect.SLOW] = tpz.mob.ae.SLOW,
        [tpz.effect.PETRIFICATION] = tpz.mob.ae.PETRIFY,
        [tpz.effect.SILENCE] = tpz.mob.ae.SILENCE,
        [tpz.effect.DOOM] = tpz.mob.ae.DOOM,
        [tpz.effect.PLAGUE] = tpz.mob.ae.PLAGUE,
        [tpz.effect.STUN] = tpz.mob.ae.STUN,
        [tpz.effect.BIND] = tpz.mob.ae.BIND
    };

    for debuff,effect in pairs(ellylldanEffects) do
        if not target:hasStatusEffect(debuff) then
            table.insert(possibleEffects,effect);
        end
    end

    if math.random(100) <= 10 and not target:hasStatusEffect(tpz.effect.CURSE_I) then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.CURSE, {chance = 100, power = 90})
    else
        return tpz.mob.onAddEffect(mob, target, damage, possibleEffects[math.random(#possibleEffects)])
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
