-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Medjeds Head (Bhoot NM)
-- Only takes full damage from Blunt / Impact
-- BLM/RDM
-- ID: 17081183
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
    mob:setMod(tpz.mod.HTHRES, 900)
    mob:setMod(tpz.mod.SLASHRES, 250)
    mob:setMod(tpz.mod.PIERCERES, 250)
    mob:setMod(tpz.mod.RANGEDRES, 250)
    mob:setMod(tpz.mod.IMPACTRES, 1000)
    DTEnabled(mob, true)
    mob:SetMagicCastingEnabled(false)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
    local body = GetMobByID(mob:getID(instance)+1, instance)
    -- Respawn Body on engaging after a wipe
    if body:isDead() then
        body:setSpawn(mob:getXPos() +3, mob:getYPos(), mob:getZPos() +3, mob:getRotPos())
        SpawnMob(mob:getID(instance)+1, instance)
    end
    body:updateEnmity(target)
    mob:setLocalVar("phaseMsg", 0)
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local instance = mob:getInstance()
    local phaseMsg = mob:getLocalVar("phaseMsg")
    local body = GetMobByID(mob:getID(instance)+1, instance)

    --100% DT if near Body
    if body:checkDistance(mob, instance) <= 30 and body:isAlive() then
        DTEnabled(mob, true)
    else
        DTEnabled(mob, false)
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems terrified of rough objects...", 0xD, none, 30)
    end

    -- Start phase 2 if Body is dead
    if (body:getHPP() == 0) and (phaseMsg == 0) then
        mob:setLocalVar("phaseMsg", 1)
        salvageUtil.msgGroup(mob, "The " .. MobName(mob) .. " goes into a frenzy!", 0xD, none)
        mob:setHP(40000)
        mob:setMod(tpz.mod.UDMGMAGIC, -50)
        mob:setMod(tpz.mod.UDMGBREATH, -50)
        mob:SetMagicCastingEnabled(true)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    local tpMoves = {477, 1339}
    -- Dark Sphere, Bane
    return tpMoves[math.random(#tpMoves)]
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TP_DRAIN, {chance = 100, power = math.random(10, 30)})
end

function onMobDisengage(mob)
    -- Reset stats and respawn Body if it was killed after a wipe
    local instance = mob:getInstance()
    local body = GetMobByID(mob:getID(instance)+1, instance)
    if body:isDead() then
        body:setSpawn(mob:getXPos() +3, mob:getYPos(), mob:getZPos() +3, mob:getRotPos())
        SpawnMob(mob:getID(instance)+1, instance)
    end
    mob:SetMagicCastingEnabled(false)
    mob:setLocalVar("phaseMsg", 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local progress = instance:getProgress()
    local body = GetMobByID(mob:getID(instance)+1, instance)

    -- Make sure Body is dead
    if body:isDead() then
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
