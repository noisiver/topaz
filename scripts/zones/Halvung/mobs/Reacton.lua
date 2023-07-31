-----------------------------------
-- Area: Halvung
--   NM: Reacton (T2 ZNM)
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/rage")}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(100)
    mob:setMod(tpz.mod.DEF, 600)
    mob:setMod(tpz.mod.EVA, 340)
    mob:setMod(tpz.mod.MDEF, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGBREATH, 0) 
    mob:setMod(tpz.mod.SDT_FIRE, 130)
    mob:setMod(tpz.mod.SDT_ICE, 60)
    mob:setMod(tpz.mod.SDT_WIND, 60)
    mob:setMod(tpz.mod.SDT_EARTH, 60)
    mob:setMod(tpz.mod.SDT_THUNDER, 60)
    mob:setMod(tpz.mod.SDT_WATER, 60)
    mob:setMod(tpz.mod.SDT_LIGHT, 60)
    mob:setMod(tpz.mod.SDT_DARK, 60)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6500) -- 7k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 7300) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:setSpellList(2045) 
    mob:AnimationSub(0)
    mob:SetMagicCastingEnabled(false)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
	local GrowTime = mob:getLocalVar("GrowTime")
	local BattleTime = mob:getBattleTime()
    local AnimationSub = mob:AnimationSub()
    -- Grow
	if GrowTime == 0 then
        mob:setLocalVar("GrowTime", BattleTime + 180)
	elseif BattleTime >= GrowTime then
	    if AnimationSub == 0 then
		    mob:AnimationSub(1)
		    mob:setDamage(125)
            mob:setSpellList(2045) -- Fire through Fire III, Firaga, and Blaze Spikes
            mob:SetMagicCastingEnabled(true)
            mob:setLocalVar("GrowTime", BattleTime + 180)
	    elseif AnimationSub == 1 then
		    mob:AnimationSub(2)
		    mob:setDamage(150)
            mob:setSpellList(2046) -- Fire III and Fire IV, Firaga III, and Flare II.
            mob:SetMagicCastingEnabled(true)
            mob:setLocalVar("GrowTime", BattleTime + 60)
	    elseif AnimationSub == 2 then -- Self destruct after growing three times
		    mob:AnimationSub(3)
            mob:useMobAbility(511) -- Self-destruct
	    end
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 200)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
