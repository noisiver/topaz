------------------------------
-- Area: Mamook
--   NM: Hundredfaced Hapool Ja Clone
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.REGAIN, 250)
    mob:SetMagicCastingEnabled(false)
     tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MIJIN_GAKURE, cooldown = 45, hpp = 100},
        },
     })
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 461)
end
