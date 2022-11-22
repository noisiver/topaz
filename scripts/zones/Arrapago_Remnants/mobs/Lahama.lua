-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lahama
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local buddies =
{
    [1] = { 17081156, 17081160 },
    [2] = { 17081157, 17081162 },
    [3] = { 17081158, 17081164 },
    [4] = { 17081159, 17081166 },
}
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
    local mobId = mob:getID(instance)

    for _,party in ipairs(buddies) do
        for _,mob1 in ipairs(party) do
            if mob1 == mobId then
                for _,mob2 in ipairs(party) do
                    SpawnMob(mob2, instance)
                    GetMobByID(mob2, instance):updateEnmity(target)
                    GetMobByID(mob2, instance):setPos(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                end
                break
            end
        end
    end
    salvageUtil.msgGroup(mob, "The " ..  MobName(mob) .. " summons a helper!" , 0xD, none)
    mob:setLocalVar("maelstromTime", os.time() + math.random(30, 45))
end

function onMobFight(mob, target)
    local maelstromTime = mob:getLocalVar("maelstromTime")
    local drawInTick = mob:getLocalVar("drawInTick")

    -- Draws in players then uses Maelstrom every 30
    if os.time() >= maelstromTime then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            if os.time() >= drawInTick then
                mob:setLocalVar("drawInTick", os.time() + 3)
                local nearbyPlayers = mob:getPlayersInRange(40)
                if nearbyPlayers == nil then return end
                zonePlayer:setPos(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                zonePlayer:addStatusEffect(tpz.effect.BIND, 1, 0, 5)
            end
        end
		mob:useMobAbility(462) -- Maelstrom
        mob:setLocalVar("maelstromTime", os.time() + 30)
	end

    -- Handle Maelstrom being interrupted
    mob:addListener("WEAPONSKILL_STATE_INTERRUPTED", "LAHAMA_INTERRUPTED", function(mob, skill)
        if skill == 1965 then
            mob:setLocalVar("maelstromTime", os.time())
        end
    end)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- Despawn crab healer
    for _,party in ipairs(buddies) do
        for _,mob in ipairs(party) do
            if mob == mobId then
                for _,mob2 in ipairs(party) do
                    DespawnMob(mob2, instance)
                end
                break
            end
        end
    end
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081150, 17081166 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    hatmehyt = GetMobByID(17081182, instance)
    hatmehyt:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos())
    if not hatmehyt:isSpawned() then
        SpawnMob(17081182, instance)
        salvageUtil.msgGroup(mob, "A big fish leaps towards you!", 0xD, none)
    end
end


