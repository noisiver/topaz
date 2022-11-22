-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Barnacle Crab
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local buddies =
{
    [1] = { 17081160, 17081156 },
    [2] = { 17081162, 17081157 },
    [3] = { 17081164, 17081158 },
    [4] = { 17081166, 17081159 },
}

local spellList =
{
    [1] = 511, -- Haste II
    [2] = 477, -- Regen IV
    [3] = 52,  -- Shell V
    [4] = 107, -- Phalanx II
    [5] = 6,   -- Cure VI
    [6] = 47, -- Protect V

}

function onMobSpawn(mob)
    mob:setMod(tpz.mod.UDMGPHYS, -100)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
    mob:setMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMod(tpz.mod.UDMGRANGE, -100)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 1)
    mob:delImmunity(tpz.immunity.SILENCE)
    mob:SetAutoAttackEnabled(false)
    mob:setUnkillable(true)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
    local mobId = mob:getID(instance)
    local spellTime = mob:getLocalVar("spellTime")

    for _,party in ipairs(buddies) do
        for _,mob1 in ipairs(party) do
            if mob1 == mobId then
                for _,mob2 in ipairs(party) do
                    if os.time() >= spellTime and (mob2 ~= mobId) then
                        mob:setLocalVar("spellTime", os.time() + 10)
                        mob:castSpell(GetBestSpell(mob2, instance), GetMobByID(mob2, instance))
                    end
                end
                break
            end
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
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


function GetBestSpell(mob2, instance)
    local buddy = GetMobByID(mob2, instance)
    local rng = math.random()

    -- Check for buffs
    if not buddy:hasStatusEffect(tpz.effect.HASTE) then
        return 511
    elseif not buddy:hasStatusEffect(tpz.effect.SHELL) then
        return 52
    elseif not buddy:hasStatusEffect(tpz.effect.PROTECT) then
        return 47
    end

    if rng < 0.5 then
        -- Check for debuffs
        if buddy:hasStatusEffect(tpz.effect.POISON) then
            return 14
        elseif buddy:hasStatusEffect(tpz.effect.PARALYSIS) then
            return 15
        elseif buddy:hasStatusEffect(tpz.effect.BLINDNESS) then
            return 16
        end
    else
        return math.random(4, 6) -- Cure 4-6
    end

    return math.random(4, 6) -- Cure 4-6
end