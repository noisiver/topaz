-----------------------------------
-- Area: The Celestial Nexus
--  Mob: Exoplates
-- Zilart Mission 16 BCNM Fight
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:AnimationSub(0)
    mob:SetAutoAttackEnabled(false)
    mob:setUnkillable(true)
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 50)
    local shifts = mob:getLocalVar("shifts")
    local shiftTime = mob:getLocalVar("shiftTime")
    -- Make sure you can tank Eald by hitting the Exoplates
	GetMobByID(17518595):updateEnmity(target)

    if (mob:AnimationSub() == 0 and shifts == 0 and mob:getHPP() <= 67) then
        mob:useMobAbility(993)
        mob:setLocalVar("shifts", shifts+1)
        mob:setLocalVar("shiftTime", mob:getBattleTime()+5)
    elseif (mob:AnimationSub() == 1 and shifts <= 1 and mob:getHPP() <= 33) then
        mob:useMobAbility(997)
        mob:setLocalVar("shifts", shifts+1)
        mob:setLocalVar("shiftTime", mob:getBattleTime()+5)
    elseif (mob:AnimationSub() == 2 and shifts <= 2 and mob:getHPP() <= 2) then
        mob:useMobAbility(1001)
        mob:setLocalVar("shifts", shifts+1)
        mob:setLocalVar("shiftTime", mob:getBattleTime()+5)
    elseif (mob:getHPP() <= 67 and mob:AnimationSub() == 0 and mob:getBattleTime() >= shiftTime ) then
        mob:AnimationSub(1)
    elseif (mob:getHPP() <= 33 and mob:AnimationSub() == 1 and mob:getBattleTime() >= shiftTime) then
        mob:AnimationSub(2)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local eald_narche = GetMobByID(mob:getID() - 1)
    eald_narche:delStatusEffectSilent(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    eald_narche:delStatusEffectSilent(tpz.effect.ARROW_SHIELD, 0, 1, 0, 0)
    eald_narche:delStatusEffectSilent(tpz.effect.MAGIC_SHIELD, 0, 1, 0, 0)
end

function onEventUpdate(player, csid, option)
    -- printf("updateCSID: %u", csid)
end

function onEventFinish(player, csid, option, target)
    -- printf("finishCSID: %u", csid)

    if (csid == 32004) then
        DespawnMob(target:getID())
        DespawnMob(target:getID()-1)
        DespawnMob(target:getID()+2)
        DespawnMob(target:getID()+3)
        mob = SpawnMob(target:getID()+1)
        mob:updateEnmity(player)
        -- the "30 seconds of rest" you get before he attacks you, and making sure he teleports first in range
        mob:addStatusEffectEx(tpz.effect.BIND, 0, 1, 0, 30)
        mob:addStatusEffectEx(tpz.effect.SILENCE, 0, 1, 0, 40)
    end

end
