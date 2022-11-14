---------------------------------------------
-- Bugle Call
--
-- Description: Summons 4 Imps to assist the user.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    player = mob:getTarget()
    local zone = player:getZone()
    local instance = mob:getInstance()

    if zone:getType() == tpz.zoneType.INSTANCED then
        mobid = mob:getID(instance)
        for impId = mobid + 1, mobid + 5 do
            if not GetMobByID(impId, instance):isSpawned() then  
                summon = SpawnMob(impId, instance)
                summon:updateEnmity(player)
                summon:setPos(mob:getXPos() + math.random(1, 6), mob:getYPos(), mob:getZPos() + math.random(1, 6))
            end
        end
    else
        mobid = mob:getID()
        for impId = mobid + 1, mobid + 5 do
            if not GetMobByID(impId):isSpawned() then  
                summon = SpawnMob(impId)
                summon:updateEnmity(player)
                summon:setPos(mob:getXPos() + math.random(1, 6), mob:getYPos(), mob:getZPos() + math.random(1, 6))
            end
        end
    end

    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end