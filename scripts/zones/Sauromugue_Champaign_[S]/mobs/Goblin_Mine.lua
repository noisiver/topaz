------------------------------
-- Area: Sauromugue Champaign [S]
-- Mob: Goblin Mine
-- Dropped by Goblin Toxophile when roaming
-- Blows up in AOE if anyone steps on it
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/mine")}
------------------------------
function onMobDeath(mob, player, isKiller, noKiller)
end