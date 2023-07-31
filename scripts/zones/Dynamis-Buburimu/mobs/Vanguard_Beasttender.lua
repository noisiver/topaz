-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Vanguard Beasttender
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobFight(mob, target)
    local pet = mob:getID()+1
    if GetMobByID(pet):isDead() then
        tpz.mix.jobSpecial.config(mob, {
            specials =
            {
                {id = tpz.jsa.CHARM, hpp = 50},
            },
        })
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
