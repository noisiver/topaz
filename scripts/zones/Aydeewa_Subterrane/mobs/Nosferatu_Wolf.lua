-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Nosferatu Wolf
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    -- TP move after Nosferatu uses Astral Flow
    if GetServerVariable("NosferatuAF") == 1 then
        mob:useMobAbility(470) --  Methane Breath
    end
    if GetServerVariable("NosferatuAF") == 0 or GetServerVariable("NosferatuAF") == 2 then
        mob:useMobAbility(468) -- Dirty Claw
    end
    mob:addTP(3000) -- Safety check to ensure mob still despawns
end

function onMobFight(mob, target)
    -- Safety check to ensure mob still despawns
    if GetServerVariable("NosferatuAF") == 1 then
        mob:useMobAbility(470) --  Methane Breath
    end
    if GetServerVariable("NosferatuAF") == 0 or GetServerVariable("NosferatuAF") == 2 then
        mob:useMobAbility(468) -- Dirty Claw
    end
end

function onMobWeaponSkill(target, mob, skill)
    -- Despawn immediately after using a TP Move
    if skill:getID() == 468 then  -- Dirty Claw
        DespawnMob(mob:getID())
    end
    if skill:getID() == 470 then -- Methane Breath
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob)
end
