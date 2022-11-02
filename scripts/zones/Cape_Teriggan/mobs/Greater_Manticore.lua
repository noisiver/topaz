-----------------------------------
-- Area: Cape Teriggan
--  Mob: Greater Manticore
-- Note: Place Holder for Frostmane
-----------------------------------
local ID = require("scripts/zones/Cape_Teriggan/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/magic")
require("scripts/globals/utils")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobInitialize(mob)
   end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.PERFECT_DODGE, hpp = 80},
            {id = tpz.jsa.MANAFONT, hpp = 70},
            {id = tpz.jsa.SPIRIT_SURGE, hpp = 30},
        },
    })
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 108, 2, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.FROSTMANE_PH, 20, 3600) -- changed from 1 to 6 hours
end