-----------------------------------
-- Area: Qulun Dome
--   NM: Za'Dha Adamantking
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Qulun_Dome/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 20) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.DEF, 10000)
    mob:setMod(tpz.mod.UDMGPHYS, 50)
    mob:setMod(tpz.mod.SDT_WATER, 70)
    mob:setMod(tpz.mod.SDT_LIGHT, 70)
    mob:setMod(tpz.mod.SDT_EARTH, 70)
    mob:setMod(tpz.mod.SDT_WIND, 70)
    mob:setMod(tpz.mod.SDT_THUNDER, 70)
    mob:setMod(tpz.mod.SDT_DARK, 70)
    mob:setMod(tpz.mod.SDT_FIRE, 70)
    mob:setMod(tpz.mod.SDT_ICE, 70)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")
    local sdtRNG = mob:getLocalVar("sdtRNG")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(60, 90))
    elseif battletime >= twohourTime and wingsDown == 0 then
        printf("Wings Up");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setLocalVar("wingsTime", battletime + 10)
        mob:setLocalVar("wingsDown", 1)
        mob:setLocalVar("sdtRNG", math.random(1, 6))
    end

    if battletime >= wingsTime and wingsDown == 1 then
        printf("Wings Down");
        mob:setLocalVar("twohourTime", battletime + math.random(50, 80))
        mob:setLocalVar("wingsTime", 0)
        mob:setLocalVar("wingsDown", 0)
    end

    if sdtRNG == 1 then
        mob:setMod(tpz.mod.SDT_WATER, 70)
        mob:setMod(tpz.mod.SDT_LIGHT, 70)
        mob:setMod(tpz.mod.SDT_EARTH, 130)
        mob:setMod(tpz.mod.SDT_WIND, 70)
        mob:setMod(tpz.mod.SDT_THUNDER, 70)
        mob:setMod(tpz.mod.SDT_DARK, 70)
        mob:setMod(tpz.mod.SDT_FIRE, 70)
        mob:setMod(tpz.mod.SDT_ICE, 70)
    end
    if sdtRNG == 2 then
        mob:setMod(tpz.mod.SDT_WATER, 130)
        mob:setMod(tpz.mod.SDT_LIGHT, 70)
        mob:setMod(tpz.mod.SDT_EARTH, 70)
        mob:setMod(tpz.mod.SDT_WIND, 70)
        mob:setMod(tpz.mod.SDT_THUNDER, 70)
        mob:setMod(tpz.mod.SDT_DARK, 70)
        mob:setMod(tpz.mod.SDT_FIRE, 70)
        mob:setMod(tpz.mod.SDT_ICE, 70)
    end
    if sdtRNG == 3 then
        mob:setMod(tpz.mod.SDT_WATER, 70)
        mob:setMod(tpz.mod.SDT_LIGHT, 70)
        mob:setMod(tpz.mod.SDT_EARTH, 70)
        mob:setMod(tpz.mod.SDT_WIND, 130)
        mob:setMod(tpz.mod.SDT_THUNDER, 70)
        mob:setMod(tpz.mod.SDT_DARK, 70)
        mob:setMod(tpz.mod.SDT_FIRE, 70)
        mob:setMod(tpz.mod.SDT_ICE, 70)
    end
    if sdtRNG == 4 then
        mob:setMod(tpz.mod.SDT_WATER, 70)
        mob:setMod(tpz.mod.SDT_LIGHT, 70)
        mob:setMod(tpz.mod.SDT_EARTH, 70)
        mob:setMod(tpz.mod.SDT_WIND, 70)
        mob:setMod(tpz.mod.SDT_THUNDER, 70)
        mob:setMod(tpz.mod.SDT_DARK, 70)
        mob:setMod(tpz.mod.SDT_FIRE, 130)
        mob:setMod(tpz.mod.SDT_ICE, 70)
    end
    if sdtRNG == 5 then
        mob:setMod(tpz.mod.SDT_WATER, 70)
        mob:setMod(tpz.mod.SDT_LIGHT, 70)
        mob:setMod(tpz.mod.SDT_EARTH, 70)
        mob:setMod(tpz.mod.SDT_WIND, 70)
        mob:setMod(tpz.mod.SDT_THUNDER, 70)
        mob:setMod(tpz.mod.SDT_DARK, 70)
        mob:setMod(tpz.mod.SDT_FIRE, 70)
        mob:setMod(tpz.mod.SDT_ICE, 130)
    end
    if sdtRNG == 6 then
        mob:setMod(tpz.mod.SDT_WATER, 70)
        mob:setMod(tpz.mod.SDT_LIGHT, 70)
        mob:setMod(tpz.mod.SDT_EARTH, 70)
        mob:setMod(tpz.mod.SDT_WIND, 130)
        mob:setMod(tpz.mod.SDT_THUNDER, 70)
        mob:setMod(tpz.mod.SDT_DARK, 70)
        mob:setMod(tpz.mod.SDT_FIRE, 70)
        mob:setMod(tpz.mod.SDT_ICE, 70)
    end
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.QUADAV_KING_ENGAGE)
end

function onAdditionalEffect(mob, target, damage)
    local sdtRNG = mob:getLocalVar("sdtRNG")
    if sdtRNG > 0 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE + sdtRNG - 1, {chance = 1000})
    else
        return 0, 0, 0 -- Just in case its somehow not got a variable set
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ADAMANTKING_USURPER)
    if isKiller then
        mob:showText(mob, ID.text.QUADAV_KING_DEATH)
    end
end

function onMobDespawn(mob)
    -- reset hqnm system back to the nm placeholder
    local nqId = mob:getID() - 1
    SetServerVariable("[POP]Za_Dha_Adamantking", os.time() + 259200) -- 3 days
    SetServerVariable("[PH]Za_Dha_Adamantking", 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(nqId, false)
    UpdateNMSpawnPoint(nqId)
    GetMobByID(nqId):setRespawnTime(math.random(75600, 86400))
end
