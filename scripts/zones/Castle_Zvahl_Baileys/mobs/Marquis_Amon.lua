-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Amon
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(110)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 555)
    mob:setMod(tpz.mod.EVA, 360)
    mob:setMod(tpz.mod.MATT, 32) 
    mob:addMod(tpz.mod.MDEF, 24) 
    mob:setMod(tpz.mod.UFASTCAST, 50) 
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
    mob:addImmunity(tpz.immunity.SILENCE)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)

    -- Set Marquis_Amon's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200))

end
