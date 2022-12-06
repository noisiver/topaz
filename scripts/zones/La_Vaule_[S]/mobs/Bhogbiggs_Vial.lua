-----------------------------------
-- Area: La Vaule [S]
--   NM: Bhogbigg''s Vial
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.REGAIN, 1500)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
end

function onMobFight(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
end
