-----------------------------------
-- Area: Pashhow Marshlands [S]
--  Mob: Virulent Peiste
-- Note: PH for Sugaar
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/peiste")}
-----------------------------------
local pixies = -- TODO: ID #'s'
{
    17146663,
    17146664,
    17146665,
    17146666,
    17146667
}
function onMobDeath(mob, player, isKiller, noKiller)
    -- 5% chance to spawn a loot pinata pixie on death
    if isKiller or nokiller then
        if math.random(100) <= 5 then
            local selectedPixie = GetAvailableMob(mob, pixies)
            SpawnMob(mob, player, selectedPixie, true)
            MessageGroup(mob, player, "A Pixie has appeared!", 0xD, none)
        end
    end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SUGAAR_PH, 5, 3600) -- 1 hour
end
