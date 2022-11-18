-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Ruins Oil (Clot NM)
-- ID: 17081105
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.DMGSC, 100)
    mob:setMod(tpz.mod.HTHRES, 500)
    mob:setMod(tpz.mod.SLASHRES, 1500)
    mob:setMod(tpz.mod.PIERCERES, 1500)
    mob:setMod(tpz.mod.RANGEDRES, 1500)
    mob:setMod(tpz.mod.IMPACTRES, 500)
end

function onMobEngaged(mob, target)
    -- Reset 2 hour uses on engage
    mob:setLocalVar("meikiyuUses", 0)
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local meikiyuUses = mob:getLocalVar("meikiyuUses")
    local scElement = {}
    scElement = utils.GetMatchingSCDayElement()
    mob:addListener("SKILLCHAIN_TAKE", "RO_SC_TAKE", function(mob, target, element, damage)
        -- Taking a 1k+ damage SC matching the day
        for _,v in pairs(scElement) do
            if element == v and damage >= 500 then 
                BreakMob(mob, target, 1, 30, 0)
            end
        end
    end)
    -- Remove Amnesia !! proc when using 2hr Meikyo Shisui
    if (hpp <= 69) and (meikiyuUses == 0) then
        mob:setLocalVar("meikiyuUses", 1)
        RemoveAmnesia(mob)
        mob:useMobAbility(730) -- Meikyo Shisui
    elseif (hpp <= 39) and (meikiyuUses == 1) then
        mob:setLocalVar("meikiyuUses", 2)
        RemoveAmnesia(mob)
        mob:useMobAbility(730) -- Meikyo Shisui
    elseif (hpp <= 19) and (meikiyuUses == 2) then
        mob:setLocalVar("meikiyuUses", 3)
        RemoveAmnesia(mob)
        mob:useMobAbility(730) -- Meikyo Shisui
    end
    if not mob:hasStatusEffect(tpz.effect.AMNESIA) then
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems weak to skillchains...", 0xD, none, 30)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    -- Only Dissolve, Muxus Spread, and Epoxy Spread
    return math.random(2550, 2552)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()

    if isKiller or noKiller then
        -- Increase progress counter, at 4 turn teleporter back on
        instance:setProgress(instance:getProgress() +1) 
    end
end

function onMobDespawn(mob)
end

function RemoveAmnesia(mob)
    if mob:hasStatusEffect(tpz.effect.AMNESIA) then
        mob:delStatusEffectSilent(tpz.effect.AMNESIA)
    end
end
