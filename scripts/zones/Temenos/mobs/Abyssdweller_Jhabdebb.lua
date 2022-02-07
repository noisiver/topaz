-----------------------------------
-- Area: Temenos
--  Mob: Abyssdweller Jhabdebb
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]+5):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+6):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+7):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+8):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+9):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+10):isDead()
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
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):updateEnmity(target)
end

function onMobFight(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):isDead() then
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
