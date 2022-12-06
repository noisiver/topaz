-----------------------------------
-- Area: La Vaule [S]
--   NM: Feeblescheme Bhogbigg
-- Immune to Silence, Sleep, Bind, Gravity, Paralyze
-- Summon animation to summon "grenade / vials".
-- Grenade is summoned every 5-60s
-- Grenades run towards a random target and uses one of their TP moves then depop after.
-- Vials stay alive spamming Noxious Spray (Poison for 30/tick). Can only have 1 vial active max.
-- 9 dmg did 8% of a vials HP so ~110 HP
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
