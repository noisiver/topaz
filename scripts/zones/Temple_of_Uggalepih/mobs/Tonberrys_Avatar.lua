-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Tonberry's Avatar
-----------------------------------
mixins = {require("scripts/mixins/families/avatar")}
-----------------------------------

function onMobSpawn(mob)
    mob:hideName(false)
    mob:untargetable(true)
    mob:setUnkillable(true)
    mob:SetAutoAttackEnabled(false)
    mob:SetMagicCastingEnabled(false)
end

function onMobEngaged(mob, target)
    mob:useMobAbility(919) -- Searing Light
end

function onMobFight(mob, target)
    mob:addListener("WEAPONSKILL_STATE_EXIT", "AVATAR_MOBSKILL_FINISHED", function(mob)
        mob:setUnkillable(false)
        mob:setHP(0)
    end)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
