-----------------------------------
-- Area: Mount Zhayolm
--   Mob: Wamoura Prince
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/status")
-----------------------------------
-- TODO: Damage resistances in streched and curled stances. Halting movement during stance change. Morph into Wamoura.

function onMobSpawn(mob)
	mob:AnimationSub(0)
    mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    if canEvolve(mob) then
        mob:hideName(false)
        mob:untargetable(false)
        mob:setLocalVar("evolveTime", os.time() + math.random(3500, 3600)) -- Evolves in approx 1 Vana'diel day
    end
end

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("formTime")
    if mob:AnimationSub() == 0 and os.time() > roamTime then
        mob:AnimationSub(1)
        mob:setMod(tpz.mod.MOVE, -25)
        mob:setMod(tpz.mod.UDMGMAGIC, -33)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    elseif mob:AnimationSub() == 1 and os.time() > roamTime then
        mob:AnimationSub(0)
        mob:setMod(tpz.mod.MOVE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 33)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    end

    if canEvolve(mob) then
        local evolveTime = mob:getLocalVar("evolveTime")
        if os.time() > evolveTime then
            local princeID = mob:getID()
            local wamoura = GetMobByID(princeID + 1)
            wamoura:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1)
            mob:hideName(true)
            mob:untargetable(true)
            DespawnMob(princeID)
            wamoura:spawn()
            DisallowRespawn(princeID, true)
        end
    end
end

function onMobFight(mob, target)
    local fightTime = mob:getLocalVar("formTime")
	local Animation = mob:getLocalVar("Animation")

    if Animation == 0 then
	    mob:setLocalVar("Animation", math.random(1,2)) --Random roll for animation
	elseif Animation == 1 and os.time() > fightTime then
        mob:AnimationSub(1)
        mob:setMod(tpz.mod.MOVE, -25)
        mob:setMod(tpz.mod.UDMGMAGIC, -33)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
		mob:setLocalVar("Animation", math.random(1,2)) --Random roll for animation
    elseif Animation == 2 and os.time() > fightTime then
        mob:AnimationSub(0)
        mob:setMod(tpz.mod.MOVE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 33)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
		mob:setLocalVar("Animation", math.random(1,2)) --Random roll for animation
    end
end

function onMobDeath(mob)
    player:addCurrency("zeni_point", 10)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
end

function canEvolve(mob)
    local canPrinceEvolve = false
    local mobId = mob:getID()

    for i,v in pairs(ID.mob.EVOLVING_WAMOURA_PRINCES) do
        if mobId == v then   
            canPrinceEvolve = true
        end
    end

    return canPrinceEvolve    
end
