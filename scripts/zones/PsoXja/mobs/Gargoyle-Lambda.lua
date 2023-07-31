-----------------------------------
-- Area: Pso'xja
--   NM: Gargoyle-Lambda
-- Involved in the quest "A Reputation In Ruins"
-- Green Braclet ???
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 35) 
    mob:addMod(tpz.mod.DEFP, 35) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:addMod(tpz.mod.MDEF, 300)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
    mob:addImmunity(tpz.immunity.SILENCE)
    mob:addImmunity(tpz.immunity.PARALYZE)
    mob:addImmunity(tpz.immunity.SLOW)
    mob:addImmunity(tpz.immunity.REQUIEM)
    mob:addImmunity(tpz.immunity.ELEGY)
    mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 0, 0, 3600)
    mob:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):unsetFlag(tpz.effectFlag.DISPELABLE)
    mob:addStatusEffect(tpz.effect.ARROW_SHIELD, 0, 0, 3600)
    mob:getStatusEffect(tpz.effect.ARROW_SHIELD):unsetFlag(tpz.effectFlag.DISPELABLE)
    mob:setLocalVar("ResistanceChangeTime", 30)
    mob:setLocalVar("ResistanceMode", 1)
    mob:setSpellList(2063) -- Shock Spikes only
end

function onMobRoam(mob)
    mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 0, 0, 3600)
    mob:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):unsetFlag(tpz.effectFlag.DISPELABLE)
    mob:setLocalVar("ResistanceChangeTime", 30)
    mob:setLocalVar("ResistanceMode", 1)
end

function onMobFight(mob, target)
    local BattleTime = mob:getBattleTime()
    local ResistanceChangeTime = mob:getLocalVar("ResistanceChangeTime")
    local ResistanceMode = mob:getLocalVar("ResistanceMode")


    if BattleTime >= ResistanceChangeTime and ResistanceMode == 1 then
        printf("PDT Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 0, 0, 3600)
        mob:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):unsetFlag(tpz.effectFlag.DISPELABLE)
        mob:addStatusEffect(tpz.effect.ARROW_SHIELD, 0, 0, 3600)
        mob:getStatusEffect(tpz.effect.ARROW_SHIELD):unsetFlag(tpz.effectFlag.DISPELABLE)
        mob:delStatusEffectSilent(tpz.effect.MAGIC_SHIELD)
        mob:setSpellList(2063) -- Shock Spikes only
        mob:setLocalVar("ResistanceChangeTime", BattleTime + 30)
        mob:setLocalVar("ResistanceMode", 2)
    end

    if BattleTime >= ResistanceChangeTime and ResistanceMode == 2 then
        printf("MDT Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 0, 0, 3600)
        mob:getStatusEffect(tpz.effect.MAGIC_SHIELD):unsetFlag(tpz.effectFlag.DISPELABLE)
        mob:delStatusEffectSilent(tpz.effect.PHYSICAL_SHIELD)
        mob:delStatusEffectSilent(tpz.effect.ARROW_SHIELD)
        mob:setSpellList(2064) -- Silence Only
        mob:setLocalVar("ResistanceChangeTime", BattleTime + 30)
        mob:setLocalVar("ResistanceMode", 1)
    end
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- Both Gargoyles are dead
    if GetMobByID(ID.mob.GARGOYLE_LAMBDA):isDead() and GetMobByID(ID.mob.GARGOYLE_MU):isDead() then
        player:setCharVar("AReputationInRuins", 4)
    end
end
