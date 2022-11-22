-----------------------------------
-- Area: Vunkerl Inlet [S]
--   ANNM
--   NM: Procrustes
--  !addkeyitem RED_LABELED_CRATE
-- TODO: fix/test!
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("drawInTick", 0)
    mob:setLocalVar("comboTime", 45)
    mob:setLocalVar("Drawin", 0)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    local comboTime = mob:getLocalVar("comboTime")
    local drawInTick = mob:getLocalVar("drawInTick")
    local BattleTime = mob:getBattleTime()
    -- Once adds are dead, draws in and Collosal slams every 90 seconds
    -- Continues to use it until it successfully gets it off
    for i = 17117554, 17117559 do
        if not GetMobByID(i):isDead() then
            return
        end
    end

    if BattleTime >= comboTime then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            if BattleTime >= drawInTick then
                mob:setLocalVar("drawInTick", BattleTime + 3)
                local nearbyPlayers = mob:getPlayersInRange(40)
                if nearbyPlayers == nil then return end
                zonePlayer:setPos(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                zonePlayer:addStatusEffect(tpz.effect.BIND, 1, 0, 5)
            end
        end
		mob:useMobAbility(2578) -- Colossal Slam
        mob:setLocalVar("comboTime", BattleTime + 10)
	end

    mob:addListener("WEAPONSKILL_STATE_EXIT", "COLOSSAL_BLOW_FINISH", function(mob, skillID) 
        if skillID == 2578 then -- Colossal Slam
            mob:setLocalVar("comboTime", BattleTime + 90) -- This won't work, needs to be converted to os.time()
        end
    end)
    tpz.annm.PetShield(mob, 17117554, 17117559)
end


function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
