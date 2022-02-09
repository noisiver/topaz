-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Batteilant Bhoot
-----------------------------------
function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
	local StunTime = mob:getLocalVar("StunTime")
	local DreadSpikesTime = mob:getLocalVar("DreadSpikesTime")
	local DrainTime = mob:getLocalVar("DrainTime")
	local BattleTime = mob:getBattleTime()
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1709 then -- Abrasive Tantra
	    mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.AMNESIA, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
    end
    if skill:getID() == 1710 then -- Deafening Tantra
	    mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.SILENCE, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
