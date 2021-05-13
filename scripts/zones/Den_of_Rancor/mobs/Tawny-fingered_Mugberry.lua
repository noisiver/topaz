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
            {id = tpz.jsa.PERFECT_DODGE, cooldown = math.random(120, 300), hpp = 90},
        },
    })
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMobMod(tpz.mobMod.TELEPORT_TYPE, 1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.TELEPORT_CD, math.random(30 , 45))
    mob:setMobMod(tpz.mobMod.TELEPORT_START, 2037)
    mob:setMobMod(tpz.mobMod.TELEPORT_END, 988)
    mob:setMobMod(tpz.mobMod.TELEPORT_TYPE, 1)
end

function onMobFight(mob, target)
    if (mob:hasStatusEffect(tpz.effect.PERFECT_DODGE) == true) then
        mob:setMod(tpz.mod.UDMGMAGIC, 200)
    else
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 396)
end
