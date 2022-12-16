-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Vee Ladu the Titterer
-- NIN/NIN with dual wield(100% DA)
-- Immune to Silence, Paralyze, Sleep, Bind, Gravity, Break
-- Cannot miss Ninja enfeebles(capped MACC)
-- Double Attacks 100% of the time? Maybe triple too? Need to check..
-- Casts: Dokumori: Ni, Hojo: Ni, Kurayami: Ni, Jubaku: Ni, Utsusemi: Ni
-- Cast Timer: 10s
-- Ranged Attack Timer(In melee range also): 10s
-- Summons clones when using Utsusemi: Ni. 
-- 100-77%: 1 Clone
-- 77%-60%: 2 Clones
-- 60%-40%: 3 Clones
-- 40- ???: 4 Clones
-- Clones have exact same stats/immunities/spellcasting/ra AI etc as main boss except ~200 HP
-- Clones sit at 1 HP thend espawn after a few seconds
-- Used Mijin Gakure at 1%, died and dropped loot from it.
-- Uses: Double Kick, Sweep, Feathered Furore
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
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
