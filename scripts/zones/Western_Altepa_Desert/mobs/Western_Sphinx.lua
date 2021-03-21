-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Western Sphinx
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobFight(mob, target)
    local Bro = mob:getLocalVar("Bro")
    local BroDead = GetMobByID(ID.mob.EASTERN_SPHINX):isDead()
    if BroDead and Bro == 0 then
        mob:useMobAbility(689) -- Benediction
        mob:setMod(tpz.mod.UFASTCAST, 50)
        mob:addMod(tpz.mod.MDEF, 100) 
        mob:setMod(tpz.mod.UDMGPHYS, 50)
        mob:setMod(tpz.mod.REFRESH, 300)
        mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17289654)
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 5)
        mob:SetMagicCastingEnabled(true)
        mob:setLocalVar("Bro", 1)
    end
end

function onMobSpawn(mob)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false) 
    DespawnMob(mob:getID(), 180)
end

function onMobDeath(mob, player, isKiller)
    if
        GetMobByID(ID.mob.EASTERN_SPHINX):isDead() and
        GetMobByID(ID.mob.WESTERN_SPHINX):isDead() and
        player:getCurrentMission(BASTOK) == tpz.mission.id.bastok.RETURN_OF_THE_TALEKEEPER and
        player:getCharVar("MissionStatus") == 2
    then
        player:setCharVar("Mission6-1MobKilled", 1)
    end
end
