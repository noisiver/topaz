-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Xolotl
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/world")
local ID = require("scripts/zones/Attohwa_Chasm/IDs")
-----------------------------------

function onMobInitialize(mob)
    -- Wiki: Susceptible to Slow, Paralyze, Silence and Gravity but will build resistance to them all. Unclear exactly how fast
   -- mob:setMod(tpz.mod.RESBUILD_GRAVITY,10)
   -- mob:setMod(tpz.mod.RESBUILD_PARALYZE,10)
   -- mob:setMod(tpz.mod.RESBUILD_SLOW,10)
   -- mob:setMod(tpz.mod.RESBUILD_SILENCE,10)
end

function onMobSpawn(mob)
	mob:setDamage(140)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobFight(mob,target)
    local mobId = mob:getID()
    local timeInterval = mob:getBattleTime() % 6
    for i = 1, 2 do
        local child = GetMobByID(mobId + i)
        if child:isSpawned() then
            if target and child:getCurrentAction() == tpz.act.ROAMING then -- doing nothing, make share enmity
                child:updateEnmity(target)
            end
        elseif mob:getCurrentAction() ~= 30 and mob:actionQueueEmpty() and timeInterval == (i-1)*3 then -- not spawned, not casting, not using an ability and should summon
            mob:SetMagicCastingEnabled(false)
            mob:entityAnimationPacket("casm")
            mob:timer(1500, function(mob)
                mob:entityAnimationPacket("shsm")
                mob:SetMagicCastingEnabled(true)
                local pos = mob:getPos()
                child:setSpawn(pos.x + i, pos.y - 0.5, pos.z - i, pos.rot)
                child:spawn()
            end)
        end
    end
end

function onMobRoam(mob)
    local mobId = mob:getID()

    for i = 1, 2 do
        local child = GetMobByID(mobId + i)
        if child:isSpawned() and child:getID() == mobId + 1 then
            child:pathTo(mob:getXPos() + 1, mob:getYPos() + 3, mob:getZPos() + 0.15)
        elseif child:isSpawned() and child:getID() == mobId + 2 then
            child:pathTo(mob:getXPos() + 3, mob:getYPos() + 5, mob:getZPos() + 0.15)
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    -- Can be slept with Lullaby once after each Charm, after which he builds resistance.
    if skill:getID() == 533 or skill:getID() == 1329 then
        mob:setMod(tpz.mod.SLEEPRESTRAIT, 20)
    end
end

function onMagicHit(caster, target, spell)
    if (spell:tookEffect() and caster:isPC() and spell:getID() == 376 or spell:getID() == 463 or spell:getID() == 576 or spell:getID() == 584) then
        target:setMod(tpz.mod.SLEEPRESTRAIT, 100)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.XOLOTL_XTRAPOLATOR)
end

function onMobDespawn(mob)
end


