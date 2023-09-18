-----------------------------------
-- Area: Pashhow Marshlands [S]
--  Mob: Pixie
-- Note: Random pop from Virulent Peiste.
-- Does not fight back, just a loot pinata.
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:SetMagicCastingEnabled(false)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
