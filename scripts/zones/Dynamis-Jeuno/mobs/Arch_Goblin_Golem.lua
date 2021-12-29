-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Arch GObin Golem
-----------------------------------
require("scripts/globals/status")
mixins =
{
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MIGHTY_STRIKES, cooldown = 60, hpp = 90},
        },
    })
     mob:addMod(tpz.mod.DEFP, 30) 
     mob:addMod(tpz.mod.ATTP, 20)
     mob:addMod(tpz.mod.ACC, 50) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
    if (mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES) == true) then
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 30)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 1156)
    else
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 92)
    end
end

function onMobDeath(mob, player, isKiller)
end
