-----------------------------------
-- Area: Temenos
--  Mob: Pee Qoho the Python
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]+18):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+19):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+20):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+21):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+22):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+23):isDead()
    then
        mob:setDamage(150)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, -13)
        mob:setMod(tpz.mod.UDMGBREATH, 0)
    else
	    mob:setDamage(400)
        mob:setMod(tpz.mod.UDMGPHYS, -90)
        mob:setMod(tpz.mod.UDMGRANGE, -90)
        mob:setMod(tpz.mod.UDMGMAGIC, -90)
        mob:setMod(tpz.mod.UDMGBREATH, -90)
    end
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):updateEnmity(target)
end

function onMobFight(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):isDead() then
	    mob:setDamage(250)
        mob:setMod(tpz.mod.UDMGPHYS, -50)
        mob:setMod(tpz.mod.UDMGRANGE, -50)
        mob:setMod(tpz.mod.UDMGMAGIC, -50)
        mob:setMod(tpz.mod.UDMGBREATH, -50)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if GetMobByID(ID.mob.TEMENOS_C_MOB[3]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[3]):setStatus(tpz.status.NORMAL)
        end
    end
end
