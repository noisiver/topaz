-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree X
-----------------------------------
local ID = require("scripts/zones/Boneyard_Gully/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    SetGenericNMStats(mob)
    mob:addMod(tpz.mod.DEFP, 50)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 15)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
end

function onMobSpawn(mob)
    mob:setLocalVar("chat", ID.text.DEFEATED)
end

function onMobEngaged(mob, target)
    SpawnMob(mob:getID() + 2)
    mob:setLocalVar("distracted", 0)
    mob:setMod(tpz.mod.REGAIN, 175)
	mob:setLocalVar("regain", 175)
end

function onMobWeaponSkill(target, mob, skill)
    mob:showText(mob, ID.text.MY_TURN_MY_TURN)
end

function onMobDeath(mob, player, isKiller, noKiller)
    mob:showText(mob, mob:getLocalVar("chat"))
    DespawnMob(mob:getID()+2)
end