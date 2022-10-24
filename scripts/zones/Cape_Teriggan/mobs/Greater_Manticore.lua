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
-----------------------------------
function onMobInitialize(mob)
   end

function onMobSpawn(mob)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 108, 2, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.FROSTMANE_PH, 20, 3600) -- changed from 1 to 6 hours
end

-- For testing purposes only
--function onMobWeaponSkillPrepare(mob, target)
--    return 1560 
--end