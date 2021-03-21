-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Eastern Sphinx
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobFight(mob, target)
    local Bro = mob:getLocalVar("Bro")
    local BroDead = GetMobByID(ID.mob.WESTERN_SPHINX):isDead()
    if BroDead and Bro == 0 then
        mob:useMobAbility(689) -- Benediction
        mob:addMod(tpz.mod.DEFP, 50) 
        mob:addMod(tpz.mod.ATTP, 50)
        mob:addMod(tpz.mod.ACC, 100) 
        mob:addMod(tpz.mod.EVA, 50)
        mob:setMod(tpz.mod.UDMGMAGIC, 50)
        mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17289655)
        mob:SetMobAbilityEnabled(true)
        mob:setLocalVar("Bro", 1)
    end
end

function onMobSpawn(mob)
    mob:SetMobAbilityEnabled(false) 
    DespawnMob(mob:getID(), 180)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 797 then
        local deadlyhold = mob:getLocalVar("deadlyhold")

        deadlyhold = deadlyhold +1
        mob:setLocalVar("deadlyhold", deadlyhold)

        if deadlyhold > 1 then
            mob:setLocalVar("deadlyhold", 0)
        else
            mob:useMobAbility(797)
        end
    end
    if skill:getID() == 800 then
        local heatbreath = mob:getLocalVar("heatbreath")

        heatbreath = heatbreath +1  
        mob:setLocalVar("heatbreath", heatbreath)

        if heatbreath > 1 then
            mob:setLocalVar("heatbreath", 0)
        else
            mob:useMobAbility(800)
        end
    end
    if skill:getID() == 802 then
        local greatsandstorm = mob:getLocalVar("greatsandstorm")

        greatsandstorm = greatsandstorm +1
        mob:setLocalVar("greatsandstorm", greatsandstorm)

        if greatsandstorm > 1 then
            mob:setLocalVar("greatsandstorm", 0)
        else
            mob:useMobAbility(802)
        end
    end
    if skill:getID() == 803 then
        local greatwhirlwind = mob:getLocalVar("greatwhirlwind")

        greatwhirlwind = greatwhirlwind +1
        mob:setLocalVar("greatwhirlwind", greatwhirlwind)

        if greatwhirlwind > 1 then
            mob:setLocalVar("greatwhirlwind", 0)
        else
            mob:useMobAbility(803)
        end
    end
    if skill:getID() == 798 then
        local tailswing = mob:getLocalVar("tailswing")

        tailswing = tailswing +1
        mob:setLocalVar("tailswing", tailswing)

        if tailswing > 1 then
            mob:setLocalVar("tailswing", 0)
        else
            mob:useMobAbility(798)
        end
    end
    if skill:getID() == 799 then
        local tailsmash = mob:getLocalVar("tailsmash")

        tailsmash = tailsmash +1
        mob:setLocalVar("tailsmash", tailsmash)

        if tailsmash > 1 then
            mob:setLocalVar("tailsmash", 0)
        else
            mob:useMobAbility(799)
        end
    end
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
