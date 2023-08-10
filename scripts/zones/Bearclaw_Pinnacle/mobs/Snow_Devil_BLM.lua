------------------------------
-- Area: Bearclaw Pinnacle
--   Mob: Snow Devil
--   Job: BLM
-- ENM:  When Hell Freezes Over
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------
function onMobSpawn(mob)
    mob:setDamage(110)
    mob:setMod(tpz.mod.ATT, 400)
    mob:setMod(tpz.mod.DEF, 350)
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMod(tpz.mod.SDT_FIRE, 50)
    mob:setMod(tpz.mod.SDT_ICE, 115)
    mob:setMod(tpz.mod.SDT_WIND, 50)
    mob:setMod(tpz.mod.SDT_EARTH, 50)
    mob:setMod(tpz.mod.SDT_THUNDER, 50)
    mob:setMod(tpz.mod.SDT_WATER, 50)
    mob:setMod(tpz.mod.SDT_LIGHT, 50)
    mob:setMod(tpz.mod.SDT_DARK, 50)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 20)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:addImmunity(tpz.immunity.SILENCE)
end

function onMobRoam(mob)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local battlefield = mob:getBattlefield()
    local SnowDevilWaves = battlefield:getLocalVar("SnowDevilWaves")
    -- Despawn mob holding chest closed until all waves are cleared
    if isKiller or noKiller then
        if SnowDevilWaves >= 4 and GetMobByID(16801818):isDead() and GetMobByID(16801819):isDead() and GetMobByID(16801820):isDead() and
        GetMobByID(16801821):isDead() then
            DespawnMob(16801826)
        end
        if mob:getID() == 16801818 then -- "Main" wave Snoll only increases wave counter
            -- Increase wave counter
            battlefield:setLocalVar("SnowDevilWaves", SnowDevilWaves + 1)
            --printf("%u", SnowDevilWaves)
        end
    end
end

function onMobDespawn(mob)
    local battlefield = mob:getBattlefield()
    local SnowDevilWaves = battlefield:getLocalVar("SnowDevilWaves")
    if SnowDevilWaves == 4 then return end -- Don't spawn anymore mobs after 4 waves
    -- Spawn next wave of snolls
    if GetMobByID(16801818):isDead() and GetMobByID(16801819):isDead() and GetMobByID(16801820):isDead() and
    GetMobByID(16801821):isDead() then
        battlefield:setLocalVar("SnowDevilSpawns", math.random(0,3))
        local SnowDevilSpawns = battlefield:getLocalVar("SnowDevilSpawns")
        for v = 16801834, 16801834 + SnowDevilSpawns, 1 do
            GetMobByID(v):spawn()
        end
    end
end