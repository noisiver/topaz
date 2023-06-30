-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Allocen
--   JA Autos
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(125)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 555)
    mob:setMod(tpz.mod.EVA, 360)
    mob:setMod(tpz.mod.UDMGPHYS, -50)
    mob:setMod(tpz.mod.UDMGRANGE, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, -38)
    mob:setMod(tpz.mod.DMGBREATH, -50)
	mob:SetMobSkillAttack(6028)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
    mob:addImmunity(tpz.immunity.SILENCE)
end

function onMobFight(mob, target)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MIGHTY_STRIKES, cooldown = 30, hpp = 95},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)

    -- Set Marquis_Allocen's spawnpoint and respawn time (21-23 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200))

end
