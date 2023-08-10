-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree Y
-----------------------------------
local ID = require("scripts/zones/Boneyard_Gully/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    SetGenericNMStats(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:setMod(tpz.mod.COUNTER, 10)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 15)
end

function onMobSpawn(mob)
    mob:setLocalVar("regain", 200)
    mob:setLocalVar("chat", ID.text.CANT_HAVE_LOST)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("distracted", 0)
    mob:setMod(tpz.mod.REGAIN, 200)
end

-- TODO: advanced WS logic and dialog
function onMobWeaponSkill(target, mob, skill)
    mob:showText(mob, ID.text.MASSACRRRE_BEGIN)
end

function onMobDeath(mob, player, isKiller, noKiller)
    mob:showText(mob, mob:getLocalVar("chat"))
end