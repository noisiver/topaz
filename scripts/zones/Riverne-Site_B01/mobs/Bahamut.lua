-----------------------------------
-- Area: Riverne - Site B01 (BCNM)
--   NM: Bahamut
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
--UNTESTED!!!!!
-----------------------------------
function onMobInitialise(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end


function onMobSpawn(mob)
	mob:setDamage(250)
    mob:setMod(tpz.mod.UFASTCAST, 50) 
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 25)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:addStatusEffect(tpz.effect.PHALANX, 35, 0, 180)
    mob:addStatusEffect(tpz.effect.STONESKIN, 350, 0, 300)
    mob:addStatusEffect(tpz.effect.PROTECT, 175, 0, 1800)
    mob:addStatusEffect(tpz.effect.SHELL, 24, 0, 1800)
    mob:setLocalVar("NextPhase", 89)
end

function onMobRoam(mob)
    mob:setLocalVar("MegaFlare", 0)
    mob:setLocalVar("GigaFlareUsed", 0)
end

function onMobFight(mob, target)
    local NextPhase = mob:getLocalVar("NextPhase")
    local MegaFlare = mob:getLocalVar("MegaFlare")
    local GigaFlareUsed = mob:getLocalVar("GigaFlareUsed")
    if mob:getHPP() > 10 and mob:getHPP() < NextPhase and MegaFlare == 0 then -- Summons a random avatar every 20% HP
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:showText(mob, ID.text.BAHAMUT_TAUNT)
            zonePlayer:showText(mob, ID.text.BAHAMUT_TAUNT +1)
        end
        mob:useMobAbility(1551)
        mob:setLocalVar("NextPhase", NextPhase - 10)
        mob:setLocalVar("MegaFlare", 1)
    end
    if mob:getHPP() < 10 and GigaFlareUsed == 0 then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:showText(mob, ID.text.BAHAMUT_TAUNT +2)
        end
        mob:setLocalVar("GigaFlareUsed", 1)
        mob:useMobAbility(1552)
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1551 then --Giga Flare
        mob:setLocalVar("MegaFlare", 1)   
    end
end

function onMobDeath(mob, player, isKiller)
end
