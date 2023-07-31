-----------------------------------
-- Area: Halvung
--  Mob: Troll_Mythril_Guard
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17031440)
end

function onPath(mob)
	local Monamaq = GetMobByID(17031440)
	mob:pathTo(Monamaq:getXPos(), Monamaq:getYPos(), Monamaq:getZPos())
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

