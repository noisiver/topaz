-----------------------------------
-- Area: Castle Oztroja
--   NM: Tzee Xicu the Manifest
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:addMod(tpz.mod.MDEF, 250)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobRoam(mob)
    -- Despawn Servants
    for v = 17396728, 17396735, 1 do
        DespawnMob(v)
    end
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.YAGUDO_KING_ENGAGE)
    -- Despawn all Yagudo in room and disable them respawning
    for v = 17396115, 17396134, 1 do
        DespawnMob(v)
        DisallowRespawn(v, true)
    end
end

function onMobFight(mob, target)
    local BattleTime = mob:getBattleTime()
    local ServantsTime = mob:getLocalVar("ServantsTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")

    if ServantsTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("ServantsTime", math.random(30, 45))
    elseif BattleTime >= ServantsTime and wingsDown == 0 then
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("Rid our castle of these scum!",0,"Tzee Xicu")
        end
        for v = 17396271, 17396278, 1 do
            GetMobByID(v):setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
            GetMobByID(v):spawn()
            GetMobByID(v):updateEnmity(target)
        end
        mob:setLocalVar("wingsTime", BattleTime + 5)
        mob:setLocalVar("wingsDown", 1)
    end

    if BattleTime >= wingsTime and wingsDown == 1 then
        printf("Wings Down");
        mob:setLocalVar("ServantsTime", BattleTime + math.random(30, 45))
        mob:setLocalVar("wingsTime", 0)
        mob:setLocalVar("wingsDown", 0)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {duration = 60})
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.DEITY_DEBUNKER)
    if isKiller then
        mob:showText(mob, ID.text.YAGUDO_KING_DEATH)
    end
    -- Despawn Servants
    for v = 17396728, 17396735, 1 do
        DespawnMob(v)
    end
    -- Allow Yagudo in room to respawn
    for v = 17396115, 17396134, 1 do
        DisallowRespawn(v, false)
    end
end

function onMobDespawn(mob)
    -- reset hqnm system back to the nm placeholder
    local nqId = mob:getID() - 3
    SetServerVariable("[POP]Tzee_Xicu_the_Manifest", os.time() + 1) -- 0 hours
    SetServerVariable("[PH]Tzee_Xicu_the_Manifest", 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(nqId, false)
    UpdateNMSpawnPoint(nqId)
    GetMobByID(nqId):setRespawnTime(math.random(36000, 43200)) -- 21 to 23 hours
end
