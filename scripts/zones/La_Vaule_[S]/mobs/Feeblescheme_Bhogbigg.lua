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
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
