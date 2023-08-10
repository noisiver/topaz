-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Vanguard Pathfinder
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Buburimu/IDs")
require("scripts/globals/mobs")
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

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.WOODNIX_SHRILLWHISTLE_PH, 10, 1200) -- 20 minutes
end
