-----------------------------------
-- Area: Temenos Central Floor
--  Mob: Airi
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[1]+1):isDead() then
	    mob:setDamage(175)
        mob:addMod(tpz.mod.DEFP, 50)
        mob:addMod(tpz.mod.ACC, 50)
        mob:addMod(tpz.mod.EVA, 50)
        mob:addMod(tpz.mod.MDEF, 40)
        mob:setMod(tpz.mod.REGEN, 60)
        mob:setMod(tpz.mod.REGAIN, 100)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if GetMobByID(ID.mob.TEMENOS_C_MOB[1]+1):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[1]+2):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[1]+3):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[1]+4):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[1]+5):isDead()
        then
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[1]):setPos(mobX, mobY, mobZ)
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[1]):setStatus(tpz.status.NORMAL)
        end
    end
end
