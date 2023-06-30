-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Nashmeira
-- Note: PUP mythic weapon fight
-- !spawnmob 17584515
-----------------------------------
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/magic")
require("scripts/globals/utils")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    SpawnMob(mob:getID()+1)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.CHARM, cooldown = 60, hpp = 50},
        },
    })
end

function onMobEngaged(mob, target)
    local pet = GetMobByID(mob:getID() +1)
    pet:updateEnmity(mob:getTarget())
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        utils.MessageParty(player, "The beasts are calmer now.", 0, "Balpah")
    end
    DespawnMob(mob:getID()+1)
end

function onMobDespawn(mob)
    DespawnMob(mob:getID()+1)
end