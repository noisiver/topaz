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
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.MDEF, 250)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.SDT_WATER, 80)
    mob:setMod(tpz.mod.SDT_LIGHT, 115)
    mob:setMod(tpz.mod.SDT_EARTH, 80)
    mob:setMod(tpz.mod.SDT_WIND, 50)
    mob:setMod(tpz.mod.SDT_THUNDER, 50)
    mob:setMod(tpz.mod.SDT_DARK, 80)
    mob:setMod(tpz.mod.SDT_FIRE, 80)
    mob:setMod(tpz.mod.SDT_ICE, 115)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")
    local Guard = GetMobByID(17396728)
    local GuardTwo = GetMobByID(17396729)
    local GuardThree = GetMobByID(17396730)
    local GuardFour = GetMobByID(17396731)
    local GuardFive = GetMobByID(17396732)
    local GuardSix = GetMobByID(17396733)
    local GuardSeven = GetMobByID(17396734)
    local GuardEight = GetMobByID(17396735)

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(30, 45))
    elseif battletime >= twohourTime and wingsDown == 0 then
        printf("Wings Up");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        target:PrintToPlayer("Rid our castle of these scum!",0,"Tzee Xicu")
        Guard:spawn()
        GuardTwo:spawn()
        GuardThree:spawn()
        GuardFour:spawn()
        GuardFive:spawn()
        GuardSix:spawn()
        GuardSeven:spawn()
        GuardEight:spawn()
        Guard:updateEnmity(target)
        GuardTwo:updateEnmity(target)
        GuardThree:updateEnmity(target)
        GuardFour:updateEnmity(target)
        GuardFive:updateEnmity(target)
        GuardSix:updateEnmity(target)
        GuardSeven:updateEnmity(target)
        GuardEight:updateEnmity(target)
        mob:setLocalVar("wingsTime", battletime + 5)
        mob:setLocalVar("wingsDown", 1)
    end

    if battletime >= wingsTime and wingsDown == 1 then
        printf("Wings Down");
        mob:setLocalVar("twohourTime", battletime + math.random(25, 40))
        mob:setLocalVar("wingsTime", 0)
        mob:setLocalVar("wingsDown", 0)
    end
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.YAGUDO_KING_ENGAGE)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {duration = 60})
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.DEITY_DEBUNKER)
    if isKiller then
        mob:showText(mob, ID.text.YAGUDO_KING_DEATH)
    end
    DespawnMob(Guard)
    DespawnMob(GuardTwo)
    DespawnMob(GuardThree)
    DespawnMob(GuardFour)
    DespawnMob(GuardFive)
    DespawnMob(GuardSix)
    DespawnMob(GuardSeven)
    DespawnMob(GuardEight)
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
