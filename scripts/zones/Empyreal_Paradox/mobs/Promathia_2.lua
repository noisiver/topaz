-----------------------------------
-- Area: Empyreal Paradox
--  MOB: Promathia (phase 2)
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MAIN_DMG_RATING, 50)
	mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.MDEF, 60)
    mob:setMod(tpz.mod.UDMGMAGIC, -20)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobInitialize(mob)
    mob:setMod(tpz.mod.REGAIN, 50)
    mob:setMod(tpz.mod.UFASTCAST,15)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 18)
end

function onMobEngaged(mob,target)
    local bcnmAllies = mob:getBattlefield():getAllies()
    for i,v in pairs(bcnmAllies) do
        v:addEnmity(mob, 0, 1)
    end
end

function onMobFight(mob,target,spell)
    if mob:AnimationSub() == 3 and not mob:hasStatusEffect(tpz.effect.STUN) then
        mob:AnimationSub(0)
        mob:stun(1500)
    elseif mob:AnimationSub() == 2 and not mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
        mob:AnimationSub(0)
    elseif mob:AnimationSub() == 1 and not mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) then
        mob:AnimationSub(0)
    end
    local now = os.time()
    if now >= mob:getLocalVar("meteor") then
        mob:setLocalVar("meteor", now + 60)
        mob:castSpell(218, target)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 219 then
        spell:setMPCost(1)
    elseif spell:getID() == 218 then             
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller)
end
