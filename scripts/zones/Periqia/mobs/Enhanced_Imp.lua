-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Batteilant Bhoot
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MDEF, 40)
    mob:setMod(tpz.mod.UDMGMAGIC, -13)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
	if mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 25, 0, 3600)
	end
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local auraMode = mob:getLocalVar("auraMode")
    if (auraMode == 1) then
        AddMobAura(mob, target, 10, tpz.effect.AMNESIA, 1, 3)
    elseif (auraMode == 2) then
        AddMobAura(mob, target, 10, tpz.effect.MUTE, 1, 3)
    end
	if mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 25, 0, 3600)
	end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1709 then -- Abrasive Tantra
	    mob:setLocalVar("auraMode", 1)
    end
    if skill:getID() == 1710 then -- Deafening Tantra
	    mob:setLocalVar("auraMode", 2)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        mob:getEntity(bit.band(ID.npc._JK3, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Door G-11 (Before Final Fight)
    end
end

function onMobDespawn(mob)
end
