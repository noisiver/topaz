-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:setDamage(145)
    mob:addMod(tpz.mod.DEFP, 44) 
    mob:addMod(tpz.mod.ATTP, 39)
    mob:addMod(tpz.mod.EVA, 40)
    mob:setMod(tpz.mod.MP, 5000)
    mob:setMod(tpz.mod.UFASTCAST, 100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 20000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ID.npc.BEHEMOTH_QM):setStatus(tpz.status.DISAPPEAR)
    end
    mob:setUnkillable(true)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
    -- Casts Meteor at 1% HP
    if (mob:getHPP() <= 1) then
        mob:castSpell(218)
    end

    -- Dies immediately after casting meteor
    mob:addListener("MAGIC_STATE_EXIT", "KING_BEHEMOTH_MAGIC_STATE_EXIT", function(mob, spell)
        mob:setUnkillable(false)
        mob:setHP(0)
    end)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 20, duration = 5})
end

function onCastStarting(mob, spell)
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(50)
        spell:setAnimation(280)
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.BEHEMOTH_DETHRONER)
end

function onMobDespawn(mob)
    -- Set King_Behemoth's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]King_Behemoth", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]King_Behemoth", 0)
        DisallowRespawn(ID.mob.BEHEMOTH, false)
        UpdateNMSpawnPoint(ID.mob.BEHEMOTH)
        GetMobByID(ID.mob.BEHEMOTH):setRespawnTime(36000 + math.random(0, 6) * 1800) -- 21 - 24 hours with half hour windows
    end
end
