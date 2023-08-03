-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Nosferatu Bats
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    -- TP move after Nosferatu uses Astral Flow
    local NosferatusTarget = GetMobByID(17056157):getTarget()
    if GetServerVariable("NosferatuAF") == 1 then
        mob:useMobAbility(1158) -- Turbulence
    end
    if GetServerVariable("NosferatuAF") == 0 or GetServerVariable("NosferatuAF") == 2 then
        mob:useMobAbility(395) -- Jet Stream
    end
end

function onMobFight(mob, target)
    -- Safety check to ensure mob still despawns
    if GetServerVariable("NosferatuAF") == 1 then
        mob:useMobAbility(1158) -- Turbulence
    end
    if GetServerVariable("NosferatuAF") == 0 or GetServerVariable("NosferatuAF") == 2 then
        mob:useMobAbility(395) -- Jet Stream
    end
end

function onMobWeaponSkill(target, mob, skill)
    -- Despawn immediately after using a TP Move
    if skill:getID() == 395 then -- Jet Stream
        DespawnMob(mob:getID())
    end
    if skill:getID() == 1158 then -- Turbulence
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob)
end
