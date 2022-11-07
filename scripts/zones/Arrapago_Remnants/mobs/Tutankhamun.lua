-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Tutankhamun (Qutrub NM)
-- ID: 17081149
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:SetMagicCastingEnabled(false)
end

function onMobEngaged(mob, target)
    -- Reset vars on engage
    mob:setLocalVar("modeChangeTimer", 15)
    mob:setLocalVar("mode", math.random(1,3))
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local battletime = mob:getBattleTime()
    local modeChangeTimer = mob:getLocalVar("modeChangeTimer")
    local mode = mob:getLocalVar("mode")
    local catapultTimer = mob:getLocalVar("catapultTimer")

    mob:addListener("TAKE_DAMAGE", "TUT_TAKE_DAMAGE", function(mob, amount, attacker, attacktype, damagetype)
        -- Taking a 20k+ damage in 1 hit procs white !! for 60s
        if (amount >= 20000) then
            BreakMob(mob, attacker, 1, 60, 3)
        end
    end)

    -- Mode change logic
    if battletime >= modeChangeTimer and mode == 1 then
        mob:useMobAbility(307) -- Red 2hr cloud
        MeleeMode(mob)
        mob:setLocalVar("modeChangeTimer", battletime + 120)
        mob:setLocalVar("mode", math.random(1,3))
    end

    if battletime >= modeChangeTimer and mode == 2 then
        mob:useMobAbility(624) -- Green 2hr cloud
        RangedMode(mob)
        mob:setLocalVar("modeChangeTimer", battletime + 120)
        mob:setLocalVar("mode", math.random(1,3))
    end
	
    if battletime >= modeChangeTimer and mode == 3 then
        mob:useMobAbility(625) -- Blue 2hr cloud
        SpellMode(mob)
        mob:setLocalVar("modeChangeTimer", battletime + 120)
        mob:setLocalVar("mode", math.random(1,3))
    end
end

function onMobWeaponSkillPrepare(mob, target)
    local tpMoves = {1779, 1780, 1784, 2890}
    -- Mangle, Leaping Cleave, Unblest Jambiya, Gen'ei Ryodan
    return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    local progress = instance:getProgress()

    if isKiller or noKiller then
        -- Teleport players back to the start if this is the first NM killed
        if (progress == 0) then
            instance:setProgress(1)
            salvageUtil.teleportGroup(player, 339, -0, math.random(456, 464), 129, true, false, false)
            salvageUtil.msgGroup(player, "A strange force pulls you back to the last used teleporter.", 0xD, none)
        else
            -- Nearby door opens
            mob:getEntity(bit.band(ID.npc[3][1].DOOR1, 0xFFF), tpz.objType.NPC):setAnimation(8)
            mob:getEntity(bit.band(ID.npc[3][1].DOOR1, 0xFFF), tpz.objType.NPC):untargetable(true)
            salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
            instance:setProgress(2)
        end
    end
end

function onMobDespawn(mob)
end

function MeleeMode(mob)
    mob:setMod(tpz.mod.UDMGPHYS, 1000)
    mob:setMod(tpz.mod.UDMGBREATH, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGRANGE, 0)
    mob:SetMagicCastingEnabled(false)
    mob:AnimationSub(0)
end

function RangedMode(mob)
    mob:setMod(tpz.mod.UDMGPHYS, 0)
    mob:setMod(tpz.mod.UDMGBREATH, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGRANGE, 1000)
    mob:SetMagicCastingEnabled(false)
    mob:AnimationSub(2)
end

function SpellMode(mob)
    mob:setMod(tpz.mod.UDMGPHYS, 0)
    mob:setMod(tpz.mod.UDMGBREATH, 1000)
    mob:setMod(tpz.mod.UDMGMAGIC, 1000)
    mob:setMod(tpz.mod.UDMGRANGE, 0)
    mob:SetMagicCastingEnabled(true)
    mob:AnimationSub(1)
end
