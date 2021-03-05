-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Spellspear Djokvukk
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
     mob:setMobMod(tpz.mobMod.MAGIC_COOL, 30)
     mob:addMod(tpz.mod.DEFP, 30) 
     mob:addMod(tpz.mod.ATTP, 20)
     mob:addMod(tpz.mod.ACC, 50) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.CHAINSPELL, cooldown = 180, hpp = 90},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
