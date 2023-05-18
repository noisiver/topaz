-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Nashmeira
-- Note: PUP mythic weapon fight
-- !spawnmob 17584515
-----------------------------------
local ID = require("scripts/zones/Crawlers_Nest/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    SpawnMob(mob:getID()+1)
end

function onMobEngaged(mob, target)
    local pet = GetMobByID(mob:getID() +1)
    mob:setLocalVar("frame_change", os.time() + 45)
    pet:updateEnmity(mob:getTarget())
end

function onMobFight(mob, target)
    local current_frame = mob:getLocalVar("frame")
    local chainspell = mob:getLocalVar("chainSpell")
    local pet = GetMobByID(mob:getID() +1)
    local now = os.time()

    if mob:getLocalVar("frame_change") <= now then
        changeFrame(pet)
        mob:setLocalVar("frame_change", now + 30)
        mob:setLocalVar("shieldBash", 0)
    elseif current_frame == tpz.frames.SHARPSHOT and mob:getLocalVar("ranged") <= now then
        pet:useMobAbility(272, target) -- Ranged Attack
        mob:setLocalVar("ranged", now + 5)
    elseif current_frame == tpz.frames.VALOREDGE and mob:getLocalVar("shieldBash") <= now then
        pet:useMobAbility(1944, target) -- Shield Bash
        mob:setLocalVar("shieldBash", now + 30)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        utils.MessageParty(player, "Not fair! You cheated!", 0, "Nashmeira")
    end
    DespawnMob(mob:getID()+1)
end

function onMobDespawn(mob)
    DespawnMob(mob:getID()+1)
end

function getCurrentFrameStats(pet, percentage)
    local frame = mob:getLocalVar("frame")
    if frame == tpz.frames.VALOREDGE then
        pet:setDamage(20)
        pet:setDelay(1000)
        pet:setMod(tpz.mod.ATTP, 10)
        pet:setMod(tpz.mod.DEFP, 60)
        pet:setMod(tpz.mod.RATTP, 0)
        --pet:setMod(tpz.mod.ACC, 239) -- TODO
        --pet:setMod(tpz.mod.EVA, 225) -- TODO
        pet:setMod(tpz.mod.MATT, 0)
        pet:setMod(tpz.mod.UDMGPHYS, -75)
        pet:setMod(tpz.mod.UDMGRANGE, 0)
        pet:setMod(tpz.mod.UDMGBREATH, 0)
        pet:setMod(tpz.mod.UDMGMAGIC, 0)
        pet:setMod(tpz.mod.REGEN, 10)
        pet:setMobMod(tpz.mobMod.SKILL_LIST, 1174)
        pet:setModelId(1978)
        pet:SetMagicCastingEnabled(false)
        utils.MessageParty(player, "Mnejing, slash them to pieces!", 0, "Nashmeira")
        printf("Current Frame: Valoredge")
    elseif frame == tpz.frames.SHARPSHOT then
        pet:setDamage(120)
        pet:setDelay(4000)
        pet:setMod(tpz.mod.ATTP, 0)
        pet:setMod(tpz.mod.DEFP, 30)
        pet:setMod(tpz.mod.RATTP, 0)
        --pet:setMod(tpz.mod.ACC, 300) -- TODO
        --pet:setMod(tpz.mod.EVA, 275) -- TODO
        pet:setMod(tpz.mod.MATT, 0)
        pet:setMod(tpz.mod.UDMGPHYS, 0)
        pet:setMod(tpz.mod.UDMGRANGE, 0)
        pet:setMod(tpz.mod.UDMGBREATH, 0)
        pet:setMod(tpz.mod.UDMGMAGIC, 0)
        pet:setMod(tpz.mod.REGEN, 0)
        pet:setMobMod(tpz.mobMod.SKILL_LIST, 1175)
        pet:setModelId(1980)
        pet:SetMagicCastingEnabled(false)
        utils.MessageParty(player, "Mnejing, pierce them with arrows!", 0, "Nashmeira")
        printf("Current Frame: Sharpshot")
    elseif frame == tpz.frames.STORMWAKER then
        pet:setDamage(120)
        pet:setDelay(4000)
        pet:setMod(tpz.mod.ATTP, 0)
        pet:setMod(tpz.mod.DEFP, 0)
        pet:setMod(tpz.mod.RATTP, 0)
        --pet:setMod(tpz.mod.ACC, 239) -- TODO
        --pet:setMod(tpz.mod.EVA, 225) -- TODO
        pet:setMod(tpz.mod.MATT, 0)
        pet:setMod(tpz.mod.UDMGPHYS, 0)
        pet:setMod(tpz.mod.UDMGRANGE, 0)
        pet:setMod(tpz.mod.UDMGBREATH, -75)
        pet:setMod(tpz.mod.UDMGMAGIC, -75)
        pet:setMod(tpz.mod.REGEN, 0)
        pet:setMobMod(tpz.mobMod.SKILL_LIST, 1173)
        pet:setMobMod(tpz.mobMod.MAGIC_COOL, 20)
        pet:setModelId(1979)
        pet:setSpellList(511) -- T4, -GA, AM, Enfeebles
        pet:SetMagicCastingEnabled(true)
        utils.MessageParty(player, "Mnejing, turn them to ashes!", 0, "Nashmeira")
        printf("Current Frame: Stormwaker")
    end
end