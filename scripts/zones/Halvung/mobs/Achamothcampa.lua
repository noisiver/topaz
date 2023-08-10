-----------------------------------
-- Area: Halvung
--  ZNM: Achamothcampa
-----------------------------------
mixins =
{
    require("scripts/mixins/rage")
}
require("scripts/globals/status")
-----------------------------------
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setLocalVar("EvolveTime", os.time() + 30)
    mob:setLocalVar("[rage]timer", 900) -- 15 minutes
    -- Either immune to physical damage or magic
    if mob:getID() == 17031601 then
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGRANGE, -100)
    end
    if mob:getID() == 17031602 then
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGBREATH, -100)
    end
    mob:hideName(false)
    mob:untargetable(false)
end

function onMobFight(mob, target)
    -- Can't evolve when slept
    if 
        mob:hasStatusEffect(tpz.effect.SLEEP_I) or
        mob:hasStatusEffect(tpz.effect.SLEEP_II) or
        mob:hasStatusEffect(tpz.effect.LULLABY)
    then return end
    -- Evolve after being alive for 30 seconds
    local EvolveTime = mob:getLocalVar("EvolveTime")
	if EvolveTime == 0 then
		mob:setLocalVar("EvolveTime", BattleTime + 30)
	elseif os.time() >= EvolveTime then
        local AchamothcampaID = mob:getID()
        local AchamothNymphaID = GetMobByID(AchamothcampaID + 2)
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        mob:hideName(true)
        mob:untargetable(true)
        DespawnMob(AchamothcampaID)
        AchamothNymphaID:spawn()
        AchamothNymphaID:setPos(mobX, mobY, mobZ)
        AchamothNymphaID:updateEnmity(target)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
