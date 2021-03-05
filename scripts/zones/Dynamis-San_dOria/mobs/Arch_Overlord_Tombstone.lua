-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Arch Overlord Tombstone
-----------------------------------
mixins =
{
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
            {id = tpz.jsa.HUNDRED_FISTS, cooldown = 60, hpp = 90},
        },
    })
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1110 then
        mob:resetEnmity(target)        
    end
end

function onMobDeath(mob, player, isKiller)
end
