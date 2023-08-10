-----------------------------------
-- Area: Pashhow Marshlands [S]
--   ANNM
--   NM: Groot Slang
--  !addkeyitem BLUE_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/peiste")}
-----------------------------------
function onMobSpawn(mob)
    mob:SetMobSkillAttack(6131) -- Knockback on auto-attacks
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    tpz.annm.PetShield(mob, 17146152, 17146157)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
