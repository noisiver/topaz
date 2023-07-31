-----------------------------------
-- Area: La Vaule [S]
--   NM: Bhogbigg''s Vial
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.REGAIN, 1500)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
