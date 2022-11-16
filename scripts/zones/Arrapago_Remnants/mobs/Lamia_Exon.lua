-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lamie Exon
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
    local buddies = {
      [17081209] = 17081210,
      [17081210] = 17081209,
    }
    local buddy = GetMobByID(buddies[mob:getID()], instance)
    buddy:updateEnmity(target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081209, 17081210 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081211, instance)
    salvageUtil.msgGroup(mob, "What have you done?!", 0, "Medusa")
end


