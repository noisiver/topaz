-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------
local ID = require("scripts/zones/Dragons_Aery/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 15)
    mob:addMod(tpz.mod.EVA, 20)
    mob:addMod(tpz.mod.ACC, 25)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ID.npc.FAFNIR_QM):setStatus(tpz.status.DISAPPEAR)
    end

    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(30, 90))
    end

    if battletime >= twohourTime and wingsDown == 0 then
        printf("Wings Down");
        mob:addMod(tpz.mod.ATT, 400)
        mob:addMod(tpz.mod.EVA, 370)
        mob:setMod(tpz.mod.UDMGPHYS, -50)
        mob:setMod(tpz.mod.UDMGMAGIC, -5)
        mob:SetMobAbilityEnabled(false)
        mob:AnimationSub(1)
        mob:useMobAbility(1053) -- Legitimately captured super_buff ID
        mob:setLocalVar("wingsTime", battletime + math.random(20, 30))
        mob:setLocalVar("wingsDown", 1)
    end

    if battletime >= wingsTime and wingsDown == 1 then
        printf("Wings Up");
        mob:addMod(tpz.mod.ATT, -400)
        mob:addMod(tpz.mod.EVA, -370)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:SetMobAbilityEnabled(true)
        mob:AnimationSub(0)
        mob:setLocalVar("twohourTime", battletime + math.random(60, 120))
        mob:setLocalVar("wingsTime", 0)
        mob:setLocalVar("wingsDown", 0)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.NIDHOGG_SLAYER)
end

function onMobDespawn(mob)
    -- Set Nidhogg's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Nidhogg", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Fafnir's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Nidhogg", 0)
        DisallowRespawn(ID.mob.FAFNIR, false)
        UpdateNMSpawnPoint(ID.mob.FAFNIR)
        GetMobByID(ID.mob.FAFNIR):setRespawnTime(75600 + math.random(0, 6) * 1800) -- 21 - 24 hours with half hour windows
    end
end
