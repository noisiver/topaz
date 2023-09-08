-----------------------------------
-- Area: West Sarutabaruta_{S}
--  VNM: Orcus
-----------------------------------
require("scripts/globals/voidwalker")
-----------------------------------

function onMobInitialize(mob)
    tpz.voidwalker.onMobInitialize(mob)
end

function onMobSpawn(mob)
    tpz.voidwalker.onMobSpawn(mob)
end

function onMobFight(mob, target)
    tpz.voidwalker.onMobFight(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 2516 then -- Gravitic Horn
        AddMobAura(mob, target, 10, tpz.effect.WEIGHT, 35, 30)
        AddMobAura(mob, target, 10, tpz.effect.DEFENSE_DOWN, 33, 30, 0, 2)
    end
end

function onMobDisengage(mob)
    tpz.voidwalker.onMobDisengage(mob)
end

function onMobDespawn(mob)
    tpz.voidwalker.onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.ORCUS_TROPHY_HUNTER)
    tpz.voidwalker.onMobDeath(mob, player, isKiller, tpz.keyItem.BLACK_ABYSSITE)
end