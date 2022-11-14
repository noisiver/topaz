-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Hatmehyt (Orobon NM)
-- ID: 17081182
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/orobon")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.STORETP, 100)
    mob:setLocalVar("FeelersBreakChance", 5)
end

function onMobEngaged(mob, target)
    -- Reset vars on engage
    mob:setLocalVar("msgTimer", os.time() + 45)
    mob:setLocalVar("phaseMsg", 0)
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local animationSub = mob:AnimationSub()
    local phaseMsg = mob:getLocalVar("phaseMsg")

    -- Procced by feelers being broken from frontal crits
    if (animationSub == 1) then -- Feelers broken
        BreakMob(mob, target, 1, 60, 0)
        mob:setMod(tpz.mod.REGEN, 0)
    end

    if not mob:hasStatusEffect(tpz.effect.AMNESIA) then
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems vulnerable to critical strikes.", 0xD, none, 30)
        mob:setMod(tpz.mod.REGEN, 100)
        mob:AnimationSub(0)
    end

    if (hpp < 50) and (phaseMsg == 0) then
        mob:setLocalVar("phaseMsg", 1)
        salvageUtil.msgGroup(mob, "The " .. MobName(mob) .. "s lamps begin to twitch.", 0xD, none)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    local hpp = mob:getHPP()
    local tpMoves = {1693, 1694, 1695, 1696, 1697}
    local tpMoves2 = {1696, 1698, 1977, 1978}
    -- 100 - 49% HP
    if (hpp > 49) then
        -- Gnash, Vile Belch, Hypnic Lamp, Seismic Tail, Seaspray
        return tpMoves[math.random(#tpMoves)]
    else
        -- Seismic Tail, Leeching Current, Deathgnash, Abominable Belch
        return tpMoves2[math.random(#tpMoves2)]
    end
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    local progress = instance:getProgress()

    if isKiller or noKiller then
        -- Teleport players back to the start 
        instance:setProgress(1)
        salvageUtil.teleportGroup(player, math.random(-342, -335), -0, -580, 0, true, false, false)
        salvageUtil.msgGroup(player, "A strange force pulls you back to the last used teleporter.", 0xD, none)
        -- Nearby door opens
        mob:getEntity(bit.band(ID.npc[4][1].DOOR1, 0xFFF), tpz.objType.NPC):setAnimation(8)
        mob:getEntity(bit.band(ID.npc[4][1].DOOR1, 0xFFF), tpz.objType.NPC):untargetable(true)
        salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
    end
end

function onMobDespawn(mob)
end
