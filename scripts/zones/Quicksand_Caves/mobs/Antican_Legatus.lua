-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Legatus
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.SDT_WATER, 100)
    mob:setMod(tpz.mod.SDT_LIGHT, 100)
    mob:setMod(tpz.mod.SDT_EARTH, 100)
    mob:setMod(tpz.mod.SDT_WIND, 130)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_DARK, 100)
    mob:setMod(tpz.mod.SDT_FIRE, 130)
    mob:setMod(tpz.mod.SDT_ICE, 100)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 90)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 16)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    local Guard = GetMobByID(mob:getID()-1)
    local GuardTwo = GetMobByID(mob:getID()+1)
    local Shell = mob:getLocalVar("Shell")
    local GuardsDead = GetMobByID(ID.mob.ANTICAN_CONSUL):isDead() and GetMobByID(ID.mob.ANTICAN_PRAETOR):isDead()

    if mob:getHPP() <= 75 and hitTrigger == 0 and Shell == 0   then
        target:PrintToPlayer("I have no more time for your games.",0,"Legatus")
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        Guard:spawn()
        Guard:updateEnmity(target)
        GuardTwo:spawn()
        GuardTwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 1)
        mob:setLocalVar("Shell", 1)
        printf("Spawning Guards 75%");
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 and Shell == 0  then
        target:PrintToPlayer("I have no more time for your games.",0,"Legatus")
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:addMod(tpz.mod.ATTP, 25)
        mob:addMod(tpz.mod.ACC, 50)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 1500)
        Guard:spawn()
        Guard:updateEnmity(target)
        GuardTwo:spawn()
        GuardTwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 2)
        mob:setLocalVar("Shell", 1)
        printf("Spawning Guards 50%");
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 and Shell == 0  then
        target:PrintToPlayer("I have no more time for your games.",0,"Legatus")
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:addMod(tpz.mod.ATTP, 25)
        mob:addMod(tpz.mod.ACC, 50)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 20)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 2500)
        Guard:spawn()
        Guard:updateEnmity(target)
        GuardTwo:spawn()
        GuardTwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 3)
        mob:setLocalVar("Shell", 1)
        printf("Spawning Guards 25%");
    end

    if Shell == 1  then
        printf("Protective Shell");
        mob:setMod(tpz.mod.REGEN, 300)
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGRANGE, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:SetMagicCastingEnabled(false)
    end
    if GuardsDead then
        printf("Protective shell removed");
        target:PrintToPlayer("Hmpfh, looks like I'll have to deal with you myself.",0,"Legatus")
        mob:setMod(tpz.mod.REGEN, 0)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
        mob:SetAutoAttackEnabled(true)
        mob:SetMobAbilityEnabled(true)
        mob:SetMagicCastingEnabled(true)
        mob:setLocalVar("Shell", 0)
    end
end

function onMobDeath(mob, player, isKiller)
end
