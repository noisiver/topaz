-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Medjeds Body (Bhoot NM)
-- Only takes full damage from Piercing
-- WAR/WAR
-- ID: 17081184
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(80)
    mob:setDelay(4000)
    mob:setMod(tpz.mod.HTHRES, 250)
    mob:setMod(tpz.mod.SLASHRES, 250)
    mob:setMod(tpz.mod.PIERCERES, 1000)
    mob:setMod(tpz.mod.RANGEDRES, 250)
    mob:setMod(tpz.mod.IMPACTRES, 250)
    DTEnabled(mob, true)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
    local head = GetMobByID(mob:getID(instance)-1, instance)
    -- Respawn Head on engaging after a wipe
    if head:isDead() then
        head:setSpawn(mob:getXPos() +3, mob:getYPos(), mob:getZPos() +3, mob:getRotPos())
        SpawnMob(mob:getID(instance)-1, instance)
    end
    head:updateEnmity(target)
    mob:setLocalVar("msgTimer", os.time() + 45)
    mob:setLocalVar("phaseMsg", 0)
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local instance = mob:getInstance()
    local phaseMsg = mob:getLocalVar("phaseMsg")
    local head = GetMobByID(mob:getID(instance)-1, instance)

    --100% DT if near Head
    if head:checkDistance(mob) <= 30 and head:isAlive() then
        DTEnabled(mob, true)
        PeriodicInstanceMessage(mob, target, "The ghosts seem to be empowering each other...", 0xD, none, 30)
    else
        DTEnabled(mob, false)
    end

    -- Start phase2 if Head is dead
    if (head:getHPP() == 0) and (phaseMsg == 0) then
        mob:setLocalVar("phaseMsg", 1)
        salvageUtil.msgGroup(mob, "The " .. MobName(mob) .. " goes into a frenzy!", 0xD, none)
        mob:setHP(40000)
        mob:setDelay(2000)
        mob:setMod(tpz.mod.HTHRES, 500)
        mob:setMod(tpz.mod.SLASHRES, 500)
        mob:setMod(tpz.mod.PIERCERES, 500)
        mob:setMod(tpz.mod.RANGEDRES, 500)
        mob:setMod(tpz.mod.IMPACTRES, 500)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    local tpMoves = {472, 477, 1339}
    -- Grave Wheel, Dark Sphere, Bane
    return tpMoves[math.random(#tpMoves)]
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = math.random(75, 150)})
end

function onMobDisengage(mob)
    -- Reset stats and respawn Head if it was killed after a wipe
    local instance = mob:getInstance()
    local head = GetMobByID(mob:getID(instance)-1, instance)
    if head:isDead() then
        head:setSpawn(mob:getXPos() +3, mob:getYPos(), mob:getZPos() +3, mob:getRotPos())
        SpawnMob(mob:getID(instance)-1, instance)
    end
    mob:setDelay(4000)
    mob:setMod(tpz.mod.HTHRES, 250)
    mob:setMod(tpz.mod.SLASHRES, 250)
    mob:setMod(tpz.mod.PIERCERES, 1000)
    mob:setMod(tpz.mod.RANGEDRES, 250)
    mob:setMod(tpz.mod.IMPACTRES, 250)
    mob:setLocalVar("phaseMsg", 0)
end


function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local progress = instance:getProgress()
    local head = GetMobByID(mob:getID(instance)-1, instance)

    -- Make sure Head is dead
    if head:isDead() then
        if isKiller or noKiller then
            -- Teleport players back to the last porter used
            salvageUtil.teleportGroup(player, -339, -0, math.random(-503, -496), 0, true, false, false)
            salvageUtil.msgGroup(player, "A strange force pulls you back to the last used teleporter.", 0xD, none)
            -- Nearby door opens
            mob:getEntity(bit.band(ID.npc[4][1].DOOR2, 0xFFF), tpz.objType.NPC):setAnimation(8)
            mob:getEntity(bit.band(ID.npc[4][1].DOOR2, 0xFFF), tpz.objType.NPC):untargetable(true)
            salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
            instance:setProgress(2)
            player:addTreasure(5736, mob) --Linen Coin Purse
        end
    end
end

function onMobDespawn(mob)
end

function DTEnabled(mob, bool)
    if bool == true then
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGRANGE, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGBREATH, -100)
    else
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMod(tpz.mod.UDMGBREATH, 0)
    end
end

