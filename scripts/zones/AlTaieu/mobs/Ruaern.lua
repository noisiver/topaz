-----------------------------------
-- Area: Al'Taieu
--   NM: Ru'aern
-- Note: Spawned by Rubious Crystals for PM 8-1
-----------------------------------
mixins = {
require("scripts/mixins/job_special"),
require("scripts/mixins/families/aern")
}
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 15)
end

function onMobEngaged(mob, target)
	mob:SetMagicCastingEnabled(true)
	if mob:getMainJob() == tpz.job.DRG or mob:getMainJob() == tpz.job.BST then
		mob:spawnPet()
	end
end

function onMobRoam(mob)
	mob:SetMagicCastingEnabled(false)
end


function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(COP) == tpz.mission.id.cop.GARDEN_OF_ANTIQUITY and player:getCharVar("PromathiaStatus") == 2) then
        local aernKills =
        {
            [ID.mob.AERNS_TOWER_SOUTH + 0] = "Ru_aern_1-1KILL",
            [ID.mob.AERNS_TOWER_SOUTH + 1] = "Ru_aern_1-2KILL",
            [ID.mob.AERNS_TOWER_SOUTH + 2] = "Ru_aern_1-3KILL",
            [ID.mob.AERNS_TOWER_WEST  + 0] = "Ru_aern_2-1KILL",
            [ID.mob.AERNS_TOWER_WEST  + 1] = "Ru_aern_2-2KILL",
            [ID.mob.AERNS_TOWER_WEST  + 2] = "Ru_aern_2-3KILL",
            [ID.mob.AERNS_TOWER_EAST  + 0] = "Ru_aern_3-1KILL",
            [ID.mob.AERNS_TOWER_EAST  + 1] = "Ru_aern_3-2KILL",
            [ID.mob.AERNS_TOWER_EAST  + 2] = "Ru_aern_3-3KILL",
        }

        local varToSet = aernKills[mob:getID()]

        if (varToSet ~= nil) then
            player:setCharVar(varToSet, 1)
        end

        if (player:getCharVar("Ru_aern_1-1KILL") == 1 and player:getCharVar("Ru_aern_1-2KILL") == 1 and player:getCharVar("Ru_aern_1-3KILL") == 1) then
            player:setCharVar("[SEA][AlTieu]SouthTower", 1)
            clearTowerVars(player, 1)
        end

        if (player:getCharVar("Ru_aern_2-1KILL") == 1 and player:getCharVar("Ru_aern_2-2KILL") == 1 and player:getCharVar("Ru_aern_2-3KILL") == 1) then
            player:setCharVar("[SEA][AlTieu]WestTower", 1)
            clearTowerVars(player, 2)
        end

        if (player:getCharVar("Ru_aern_3-1KILL") == 1 and player:getCharVar("Ru_aern_3-2KILL") == 1 and player:getCharVar("Ru_aern_3-3KILL") == 1) then
            player:setCharVar("[SEA][AlTieu]EastTower", 1)
            clearTowerVars(player, 3)
        end
    end
end

function clearTowerVars (player, towerNum)
    player:setCharVar("Ru_aern_"..towerNum.."-1KILL", 0)
    player:setCharVar("Ru_aern_"..towerNum.."-2KILL", 0)
    player:setCharVar("Ru_aern_"..towerNum.."-3KILL", 0)
end
