-----------------------------------
-- Area: Waughroon Shrine (KS30 Copycat)
--  Mob: Osschaart
-- !additem clotho_orb
-----------------------------------
local ID = require("scripts/zones/Waughroon_Shrine/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/regimes")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------
local spellList =
{
    {tpz.job.WHM, 1},
    {tpz.job.BLM, 2},
    {tpz.job.RDM, 3},
    {tpz.job.PLD, 4},
    {tpz.job.DRK, 5},
    {tpz.job.BRD, 6},
    {tpz.job.NIN, 7},
    {tpz.job.SMN, 1},
    {tpz.job.BLU, 8},
    {tpz.job.SCH, 2079},
    {tpz.job.GEO, 2},
    {tpz.job.RUN, 4},
}

local twoHourList = {
    {tpz.job.WAR, tpz.jsa.MIGHTY_STRIKES},
    {tpz.job.MNK, tpz.jsa.HUNDRED_FISTS},
    {tpz.job.WHM, tpz.jsa.BENEDICTION},
    {tpz.job.BLM, tpz.jsa.MANAFONT},
    {tpz.job.RDM, tpz.jsa.CHAIN_SPELL},
    {tpz.job.THF, tpz.jsa.PERFECT_DODGE},
    {tpz.job.PLD, tpz.jsa.INVINCIBLE},
    {tpz.job.DRK, tpz.jsa.BLOOD_WEAPON},
    {tpz.job.BST, tpz.jsa.FAMILIAR},
    {tpz.job.BRD, tpz.jsa.SOUL_VOICE},
    {tpz.job.RNG, tpz.jsa.EES_KINDRED},
    {tpz.job.SAM, tpz.jsa.MEIKYO_SHISUI},
    {tpz.job.NIN, tpz.jsa.MIJIN_GAKURE},
    {tpz.job.DRG, tpz.jsa.CALL_WYVERN},
    {tpz.job.SMN, tpz.jsa.ASTRAL_FLOW},
    {tpz.job.BLU, tpz.jsa.AZURE_LORE},
    {tpz.job.COR, tpz.jsa.MIGHTY_STRIKES},
    {tpz.job.DNC, tpz.jsa.MIGHTY_STRIKES},
    {tpz.job.SCH, tpz.jsa.TABULA_RASA},
    {tpz.job.GEO, tpz.jsa.MIGHTY_STRIKES},
    {tpz.job.RUN, tpz.jsa.MIGHTY_STRIKES},
}

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setDamage(100)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 25) 
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setSpellList(2)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
    local battleTime = mob:getBattleTime()
    local charmTimer = mob:getLocalVar("charmTimer")
    local lastCharmTarget = mob:getLocalVar("lastCharmTarget")
    local charmTarget = mob:getLocalVar("charmTarget")
    local enmityList = mob:getEnmityList()
    local charmTargetJob = mob:getLocalVar("charmTargetJob")
    local currentTwoHour = mob:getLocalVar("currentTwoHour")

    for _, spells in pairs(spellList) do
        if (charmTargetJob == spells[1]) then
            mob:setSpellList(spells[2])
        end
    end
    for _, twohours in pairs(twoHourList) do
        if (charmTargetJob == twohours[1]) then
            mob:setLocalVar("currentTwoHour", twohours[2])
        end
    end
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = currentTwoHour, cooldown = 60, hpp = 90},
        },
    })

    -- Charms someone every 30 seconds. Always in the same order.
    if (battleTime >= charmTimer) and mob:getCurrentAction() ~= tpz.action.MAGIC_CASTING  and mob:getCurrentAction() ~= tpz.action.MOBABILITY_START
        and mob:getCurrentAction() ~= tpz.action.MOBABILITY_USING and mob:actionQueueEmpty() then
        if enmityList and #enmityList > 0 then
            mob:setLocalVar("charmTarget", math.random(#enmityList))
            -- Make sure the same person isn't charmed twice in a row
            if (charmTarget ~= lastCharmTarget) then
                -- Draw in player, then use Charm
                ForceDrawIn(mob, charmTarget)
                mob:setLocalVar("charmTimer", battleTime + 30)
                -- Remove charm from other players before applying charm so it stays on the currently deleted target
                DeleteCharmFromOthers(mob)
                mob:useMobAbility(710, GetPlayerByID(charmTarget))
                mob:setLocalVar("lastCharmTarget", charmTarget)
            end
        end
    end

    mob:addJobTraits(charmTargetJob, 85)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 710 then -- Charm
       local Targetjob = target:getMainJob()
       --mob:delJobTraits(target:getMainJob(), 85)
       mob:setLocalVar("charmTargetJob", Targetjob)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end

function DeleteCharmFromOthers(mob)
local zonePlayers = mob:getZone():getPlayers()
    for _, zonePlayer in pairs(zonePlayers) do
        if zonePlayer:hasStatusEffect(tpz.effect.CHARM_I) then
            zonePlayer:delStatusEffectSilent(tpz.effect.CHARM_I)
        end
    end
end