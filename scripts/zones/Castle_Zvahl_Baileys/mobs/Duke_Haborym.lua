-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Duke Haborym
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.UDMGPHYS, 200)
    mob:setMod(tpz.mod.UDMGMAGIC, 200)
    mob:setMod(tpz.mod.UDMGRANGE, 200)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 10 and hitTrigger == 0 then
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, cooldown = math.random(60, 90), hpp = 90},
        },
    })
        target:PrintToPlayer("Witness my true form!",0,"Haborym")
        mob:useMobAbility(2110) -- Wings Of Gehenna
        mob:setHP(30000)
        mob:setModelId(1845) -- Vampyr
        mob:setMod(tpz.mod.UDMGPHYS, -50)
        mob:setMod(tpz.mod.UDMGMAGIC, -25)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.SDT_FIRE, 100)
        mob:setMod(tpz.mod.SDT_ICE, 100)
        mob:setMod(tpz.mod.SDT_WIND, 100)
        mob:setMod(tpz.mod.SDT_EARTH, 100)
        mob:setMod(tpz.mod.SDT_THUNDER, 100)
        mob:setMod(tpz.mod.SDT_WATER, 150)
        mob:setMod(tpz.mod.SDT_LIGHT, 150)
        mob:setMod(tpz.mod.SDT_DARK, 50)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6027)
        mob:setLocalVar("TriggerHit", 1)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)

    -- Set Duke_Haborym's spawnpoint and respawn time (21-23 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 82800))
end
