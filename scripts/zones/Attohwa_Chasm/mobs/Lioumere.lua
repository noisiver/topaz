-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Lioumere
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
-- TODO: reset hate and disengage (goes unclaimed if not attacked)
function onMobInitialize(mob)
    SetGenericNMStats(mob)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
end

function onMobFight(mob, target)
 local Pos = mob:getPos()
	if Pos.x == 479 and Pos.y == 20 and Pos.z == 41 then
        mob:SetAutoAttackEnabled(true)
        mob:setHP(mob:getMaxHP())
    end
end

function onMobWeaponSkill(target, mob, skill)
	mob:pathTo(479, 20, 41)
	mob:SetAutoAttackEnabled(false)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
	mob:SetAutoAttackEnabled(true)
end

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.THE_ROAD_FORKS and player:getCharVar("MEMORIES_OF_A_MAIDEN_Status") >= 7 and not player:hasKeyItem(tpz.ki.MIMEO_JEWEL)) then
        player:setCharVar("MEMORIES_OF_A_MAIDEN_Status", 8)
        player:setCharVar("LioumereKilled", os.time())
    end
end
