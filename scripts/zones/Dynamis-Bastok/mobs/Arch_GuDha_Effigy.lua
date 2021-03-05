-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: ARch Gu'dha Effigy
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 30) 
     mob:addMod(tpz.mod.ATTP, 20)
     mob:addMod(tpz.mod.ACC, 50) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, cooldown = 60, hpp = 90},
        },
    })
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1112 then
        local tailroll = mob:getLocalVar("tailroll")

        tailroll = tailroll +1
        mob:setLocalVar("tailroll", tailroll)

        if tailroll > 1 then
            mob:setLocalVar("tailroll", 0)
        else
            mob:useMobAbility(1112)
        end
    end
end

function onMobDeath(mob, player, isKiller)
end
