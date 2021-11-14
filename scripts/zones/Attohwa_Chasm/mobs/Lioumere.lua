-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Lioumere
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/status")
-- TODO: reset hate and disengage (goes unclaimed if not attacked)

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
end

function onMobFight(mob, target)
    local pathing = mob:getLocalVar("pathing")
    if mob:getHP() + 100 < pathing then
        mob:setLocalVar("pathing", 0)
        mob:SetAutoAttackEnabled(true)
        local pos = target:getPos();
        mob:pathThrough({ pos.x, pos.y, pos.z }, tpz.path.flag.SCRIPT)
    elseif mob:atPoint({479, 20, 41}) then
        mob:setLocalVar("pathing", 0)
        mob:SetAutoAttackEnabled(true)
        mob:setHP(mob:getMaxHP())
    end
end

function onMobWeaponSkill(target, mob, skill)
    mob:queue(0, function(mob)
        mob:pathThrough({479, 20, 41}, tpz.path.flag.SCRIPT)
        mob:setLocalVar("pathing", mob:getHP())
        mob:SetAutoAttackEnabled(false)
    end)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.THE_ROAD_FORKS and player:getCharVar("MEMORIES_OF_A_MAIDEN_Status") >= 7 and not player:hasKeyItem(tpz.ki.MIMEO_JEWEL)) then
        player:setCharVar("MEMORIES_OF_A_MAIDEN_Status", 8)
        player:setCharVar("LioumereKilled", os.time())
    end
end
