-----------------------------------
-- Area: Den of Rancor
--   NM: Tawny-fingered Mugberry
-----------------------------------
require("scripts/globals/hunts")
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.PERFECT_DODGE, cooldown = 0, hpp = 100},
        },
    })
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end


function onMobFight(mob, target)
    if (mob:hasStatusEffect(tpz.effect.PERFECT_DODGE) == true) then
        mob:setMod(tpz.mod.UDMGMAGIC, 200)
        mob:setMod(tpz.mod.UDMGRANGE, 200)
    else
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 396)
end
