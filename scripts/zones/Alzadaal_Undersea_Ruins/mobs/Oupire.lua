-----------------------------------
-- Area: Alzadaal Undersea Ruins
--   NM: Oupire
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATTP, 25)
	mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ACC, 25) 
	mob:addMod(tpz.mod.EVA, 25)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UDMGBREATH, -66)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobFight(mob, target)
	local ElementMode = mob:getLocalVar("ElementMode")
	if ElementMode == 4 then
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 50, 0, 3600) 
	elseif ElementMode == 5 then
		mob:addStatusEffect(tpz.effect.ICE_SPIKES, 50, 0, 3600) 
	elseif ElementMode == 6 then
		mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 15, 0, 3600) 
	end
end

function onMobWeaponSkill(target, mob, skill)
	local StoneskinApplied = mob:getLocalVar("StoneskinApplied")
	if skill:getID() == 2109 then --Heliovoid
        mob:setLocalVar("ElementMode", 1) --Earth
		mob:setSpellList(2005)
		setResist(mob, 1)
		DeleteSpikes(mob)
		mob:castSpell(191) -- Stonega III
		if StoneskinApplied == 0 then -- Only supposed to get once per fight
			mob:addStatusEffect(tpz.effect.STONESKIN, 2000, 0, 0) 
			mob:setLocalVar("StoneskinApplied", 1) 
		end
	elseif skill:getID() == 2108 then --Nosferatu's Kiss
        mob:setLocalVar("ElementMode", 2) --Water
		mob:setSpellList(2006)
		setResist(mob, 2)
		DeleteSpikes(mob)
		mob:castSpell(201) -- Waterga III
	elseif skill:getID() == 2110 then --Wings of Gehenna
        mob:setLocalVar("ElementMode", 3) --Wind
		mob:setSpellList(2007)
		setResist(mob, 0)
		DeleteSpikes(mob)
		mob:castSpell(186) -- Aeroga III
		mob:addStatusEffect(tpz.effect.BLINK, 20, 0, 0) --Blink
    elseif skill:getID() == 2106 then --Bloodrake
        mob:setLocalVar("ElementMode", 4) --Fire
		mob:setSpellList(2008)
		setResist(mob, 0)
		DeleteSpikes(mob)
		mob:castSpell(176) -- Firaga III
    elseif skill:getID() == 2111 then --Eternal Damnation
        mob:setLocalVar("ElementMode", 5) --Ice
		mob:setSpellList(2009)
		setResist(mob, 5)
		DeleteSpikes(mob)
		mob:castSpell(181) -- Blizzaga III
    elseif skill:getID() == 2107 then --Decollation
        mob:setLocalVar("ElementMode", 6) --Thunder
		mob:setSpellList(2010)
		setResist(mob, 0)
		DeleteSpikes(mob)
		mob:castSpell(196) -- Thundaga III
    end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 252) then -- Stun
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(10)
    end
end

function onAdditionalEffect(mob, target, damage)
	local ElementMode = mob:getLocalVar("ElementMode")
	if ElementMode == 1 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY)
	elseif ElementMode == 2 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {power = 25})
	elseif ElementMode == 3 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SILENCE)
	elseif ElementMode == 4 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PLAGUE, {power = 25})
	elseif ElementMode == 5 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {power = 25})
	elseif ElementMode == 6 then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN)
	end
end

local function setResist(mob, element)
	if element == 0 then -- Not Earth/Water/Ice element
		mob:setMod(tpz.mod.SLOWRESTRAIT, 0)
		mob:setMod(tpz.mod.POISONRESTRAIT, 0)
		mob:setMod(tpz.mod.PARALYZERESTRAIT, 0)
	elseif element == 1 then -- Earth
		mob:setMod(tpz.mod.SLOWRESTRAIT, 100)
		mob:setMod(tpz.mod.POISONRESTRAIT, 0)
		mob:setMod(tpz.mod.PARALYZERESTRAIT, 0)
	elseif element == 2 then -- Water
		mob:setMod(tpz.mod.SLOWRESTRAIT, 0)
		mob:setMod(tpz.mod.POISONRESTRAIT, 100)
		mob:setMod(tpz.mod.PARALYZERESTRAIT, 0)
	elseif element == 5 then -- Ice
		mob:setMod(tpz.mod.SLOWRESTRAIT, 0)
		mob:setMod(tpz.mod.POISONRESTRAIT, 0)
		mob:setMod(tpz.mod.PARALYZERESTRAIT, 100)
	end
end

local function DeleteSpikes(mob)
	mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
	mob:delStatusEffect(tpz.effect.ICE_SPIKES)
	mob:delStatusEffect(tpz.effect.SHOCK_SPIKES)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 478)
    player:addTitle(tpz.title.OUPIRE_IMPALER)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(14400, 18000)) -- 4 to 5 hours
end
