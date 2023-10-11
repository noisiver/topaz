-----------------------------------
-- Area: Sealions Den
--  Mob: Mammet-22_Zeta
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs");
require("scripts/globals/titles");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
	mob:addMod(tpz.mod.MDEF, 12)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobSpawn(mob)
    mob:SetMagicCastingEnabled(false)
end

function onMobEngaged(mob,target)
    mob:setLocalVar('changeTime', 0)
end

function onMobFight(mob, target)
    local form = mob:AnimationSub()

    -- Mammets seem to be able to change to any given form, per YouTube videos
    -- Added a random chance to change forms every 3 seconds if 60 seconds have passed, just to make things less formulaic.
        -- May be able to change forms more often.  Witnessed one at ~50 seconds, most were 60-80.
        -- Believe it or not, these changes may be too slow @ 50% chance.  Probability is a pain.
    -- L40 means their "weapons" are 40 DMG by default.
    if ((mob:getBattleTime() > mob:getLocalVar('changeTime') + 60 or mob:getLocalVar('changeTime') == 0) and math.random(0, 1) == 1
        and not mob:hasStatusEffect(tpz.effect.FOOD)) then
        changeForm(mob)
    end

end

function changeForm(mob)
    local newform = math.random(0, 2)
    if (mob:AnimationSub() == newform) then
        newform = 3
    end
    -- Mammets: Staff gets + 35 MAB,  Delay: Unarmed 130 / Sword 115 / Spear 320 / Staff 240
    -- Mammets: level 80 base damage  Unarmed 90 / Sword 120 / Spear 240 / Staff 60		
    if (newform == 0) then -- Hand Form, ~3s delay
        mob:SetMagicCastingEnabled(false)
        mob:setDamage(math.floor(mob:getMainLvl() *1.10)) 
        mob:setDelay(1300)
        mob:setMod(tpz.mod.MATT, 0) 
    elseif (newform == 1) then -- Sword Form, ~2s delay, melee hits for ~50-100 vs WHM/BLM w/o buffs, 40 DMG seems to work.
        mob:SetMagicCastingEnabled(false)
        mob:setDamage(math.floor(mob:getMainLvl() *1.47)) 
		mob:setDelay(1150)
        mob:setMod(tpz.mod.MATT, 0) 
    elseif (newform == 2) then -- Polearm Form, ~3-3.5s delay, melee hits for ~100-150.  Takes about 70-80 DMG to make this happen.
        mob:SetMagicCastingEnabled(false)
        mob:setDamage(math.floor(mob:getMainLvl() *2.69)) 
		mob:setDelay(3200)
        mob:setMod(tpz.mod.MATT, 0) 
    elseif (newform == 3) then -- Staff Form, ~4s delay, ~10 seconds between spell ends and next cast
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
        mob:SetMagicCastingEnabled(true)
        mob:setDamage(math.floor(mob:getMainLvl() *0.74))
		mob:setDelay(2400)
        mob:setMod(tpz.mod.MATT, 35) 
    end
    mob:AnimationSub(newform)
    mob:setLocalVar('changeTime', mob:getBattleTime())
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- find mob offset for given battlefield instance
    local inst = mob:getBattlefield():getArea()
    local instOffset = ID.mob.ONE_TO_BE_FEARED_OFFSET + (7 * (inst - 1))

    -- if all five mammets in this instance are dead, start event
    local allMammetsDead = true
    for i = instOffset + 0, instOffset + 4 do
        if not GetMobByID(i):isDead() then
            allMammetsDead = false
            break
        end
    end
    if allMammetsDead then
        player:release() -- prevents event collision if player kills multiple remaining mammets with an AOE move/spell
        player:startEvent(11)
    end
end

function onEventFinish(player, csid, option)
    if csid == 11 then
        local battlefield = player:getBattlefield()
        local inst = battlefield:getArea()
        -- players are healed in between fights, but their TP is set to 0
        player:addTitle(tpz.title.BRANDED_BY_LIGHTNING)
        player:setHP(player:getMaxHP())
        player:setMP(player:getMaxMP())
        player:setTP(0)
        player:setLocalVar("[OTBF]cs", 1)

        -- move player to instance
        if inst == 1 then
            player:setPos(-779, -103, -80)
        elseif inst == 2 then
            player:setPos(-140, -23, -440)
        elseif inst == 3 then
            player:setPos(499, 56, -802)
        end
    end
end

