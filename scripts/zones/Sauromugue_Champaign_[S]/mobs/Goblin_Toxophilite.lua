------------------------------
-- Area: Sauromugue Champaign [S]
-- Mob: Goblin Toxophilite
-- Drops a Goblin Mine while roaming.
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/mine_layer")}
------------------------------
function onMobDeath(mob, player, isKiller, noKiller)
end