------------------------------
-- Area: Lufaise Meadows
--   NM: Kurrea
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(120)
    mob:setMod(tpz.mod.REGEN, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobFight(mob)
    local EatSoup = mob:getLocalVar("EatSoup")
    local battletime = mob:getBattleTime()
	if EatSoup == 0 then
		mob:setLocalVar("EatSoup", battletime + math.random(20, 30))
	elseif battletime >= EatSoup then
        local pos = mob:getSpawnPos()
		mob:pathTo(-245.2178,-16.0504,41.2311)
		mob:SetAutoAttackEnabled(false)
        mob:SetMagicCastingEnabled(false)
        mob:setLocalVar("EatSoup", battletime + math.random(20, 30))
	end

	local Pos = mob:getPos()
	local RNG = math.random(1, 8)
	if Pos.x == -245.2178 and Pos.y == -16.0504 and Pos.z == 41.2311 then
		mob:showText(mob, 7785) -- Kurrea slurps down the adamantoise soup!
		if RNG == 1 then
			mob:showText(mob, 7786) -- Kurrea's muscles bulge crazily!
			mob:addMod(tpz.mod.MAIN_DMG_RATING, 50)
		elseif RNG == 2 then
			mob:showText(mob, 7787) -- Kurrea's scales shine mysteriously!
			mob:addStatusEffect(tpz.effect.MDEF, 50, 0, 0)
		elseif RNG == 3 then
			mob:showText(mob, 7788) -- Kurrea is enveloped by a fierce wind!
			mob:castSpell(186) -- Aeroga III
		elseif RNG == 4 then
			mob:showText(mob, 7789) -- Kurrea's hide grows rigid!
			mob:addMod(tpz.mod.DMGPHYS, 50)
		elseif RNG == 5 then
			mob:showText(mob, 7790) -- The veins in Kurrea's head are popping out!
			mob:addmod(tpz.mod.FASTCAST, 50)
		elseif RNG == 6 then
			mob:showText(mob, 7791) -- Kurrea's eyes glow weirdly!
			mob:addStatusEffect(tpz.effect.MATT, 100, 0, 0)
		elseif RNG == 7 then
			mob:showText(mob, 7792) -- Kurrea's wounds disappear!
			mob:addHP(mob:getMaxHP() * .25)
		elseif RNG == 8 then
			mob:showText(mob, 7794) -- Kurrea's face has turned green...
			mob:setmod(tpz.mod.MAIN_DMG_RATING, 0)
			mob:setmod(tpz.mod.DMGPHYS, 0)
			mob:setmod(tpz.mod.FASTCAST, 0)
			mob:delStatusEffect(tpz.effect.MATT)
			mob:delStatusEffect(tpz.effect.MDEF)
		end
		mob:SetAutoAttackEnabled(true)
        mob:SetMagicCastingEnabled(true)
	end
end

function onMobDeath(mob, player, isKiller)
end
