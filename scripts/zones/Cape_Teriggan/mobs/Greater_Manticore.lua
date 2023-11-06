-----------------------------------
-- Area: Cape Teriggan
--  Mob: Greater Manticore
-- Note: Place Holder for Frostmane
-----------------------------------
local ID = require("scripts/zones/Cape_Teriggan/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
    local prisonUses = mob:getLocalVar("prisonUses")
    local hpp = mob:getHPP()
    local tp = mob:getTP()
    local enmityList = mob:getEnmityList()
    local prisonTarget = nil
    local test = mob:getLocalVar("test")
    if (test > 0) then
        for _, enmity in ipairs(enmityList) do
            if enmityList and #enmityList > 0 then
                local randomTarget = enmityList[math.random(1,#enmityList)];
                entityId = randomTarget.entity:getID();
                if (entityId > 10000) then -- ID is a mob(pet) then
                    prisonTarget = GetMobByID(entityId)
                else
                    prisonTarget = GetPlayerByID(entityId)
                end
                if mob:getCurrentAction() ~= tpz.action.MOBABILITY_START and mob:getCurrentAction() ~= tpz.action.MOBABILITY_USING and
                    mob:actionQueueEmpty() and (tp < 1000) then
                    if (hpp <= 69) and (prisonUses == 0) then
                        mob:setLocalVar("prisonUses", 1)
                        ForceDrawIn(mob, prisonTarget)
                        prisonTarget:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
                        mob:useMobAbility(486, prisonTarget) -- Whip Tongue
                    elseif (hpp <= 39) and (prisonUses == 1) then
                        mob:setLocalVar("prisonUses", 2)
                        ForceDrawIn(mob, prisonTarget)
                        prisonTarget:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
                        mob:useMobAbility(486, prisonTarget) -- Whip Tongue
                    elseif (hpp <= 19) and (prisonUses == 2) then
                        mob:setLocalVar("prisonUses", 3)
                        ForceDrawIn(mob, prisonTarget)
                        prisonTarget:addStatusEffect(tpz.effect.BIND, 1, 0, 10)
                        mob:useMobAbility(486, prisonTarget) -- Whip Tongue
                    end
                end
            end
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 108, 2, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.FROSTMANE_PH, 20, 3600) -- changed from 1 to 6 hours
end