---------------------------------------------
-- Cytokinesis
-- Calls forth reinforcements.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local zoneId = mob:getZoneID()
    local mobId = mob:getID()
    if zones[zoneId].pet and zones[zoneId].pet[mobId] then
        local petIds = zones[zoneId].pet[mobId]
        for i, petId in ipairs(petIds) do
            local pet = GetMobByID(petId)
            if pet and not pet:isSpawned() then
                pet:setSpawn(mob:getXPos(), mob:getYPos(),  mob:getZPos())
                pet:setPos(mob:getXPos(), mob:getYPos(),  mob:getZPos())
                SpawnMob(pet:getID())
                pet:updateEnmity(target)
            end
        end
    end

    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end