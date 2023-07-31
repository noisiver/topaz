-----------------------------------
-- Area: Alzadaal Undersea Ruins
--   NM: Wulgaru (T2 ZNM)
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/families/acrolith")
}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(125)
    mob:setMod(tpz.mod.DEF, 350)
    mob:setMod(tpz.mod.EVA, 320)
    mob:setMod(tpz.mod.MDEF, 40)
    mob:setMod(tpz.mod.UDMGBREATH, 0) 
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6500) -- 7k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 7300) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:AnimationSub(0)
    mob:delRoamFlag(512)
	mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 3, 0, 3600)
	mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 3, 0, 3600)
    mob:setLocalVar("LoseLimb", 0)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobRoam(mob)
    local AnimationSub = mob:AnimationSub()
    if AnimationSub == 2 then
    -- Ensure he stays tagged
    local NearbyPlayers = mob:getPlayersInRange(50)
        if NearbyPlayers == nil then return end
        if NearbyPlayers then
            for _,v in ipairs(NearbyPlayers) do
                mob:updateClaim(v)
            end
        end
	    -- scripted run around
	    mob:addRoamFlag(512) -- ignore attacking
	    if not mob:isFollowingPath() then
            if mob:getHPP() >= 5 then
		        mob:disengage()
            end
		    local point = {math.random(-54,12),-4,math.random(188,213)}
		    mob:pathThrough(point, tpz.path.flag.RUN)
	    end
    end
    if AnimationSub == 2 then
        mob:delStatusEffectSilent(tpz.effect.MAGIC_SHIELD)
        mob:delStatusEffectSilent(tpz.effect.PHYSICAL_SHIELD)
    end
end

function onMobFight(mob, target)
	local LoseLimb = mob:getLocalVar("LoseLimb")
	local BattleTime = mob:getBattleTime()
    local AnimationSub = mob:AnimationSub()
    -- Positional DT if has at least one arm
    if AnimationSub < 2 then
	    if mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) == false then
		    mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 3, 0, 3600)
	    end
	    if mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) == false then
		    mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 3, 0, 3600)
	    end
    end
    -- Always lose arm below 75% HP and gain increased attack speed
    if mob:getHPP() < 75 and LoseLimb == 0 and mob:checkDistance(target) <= 6 and mob:actionQueueEmpty() then
        mob:useMobAbility(2074) -- Detonating Grip
        mob:setLocalVar("LoseLimb", 2)
		mob:addMod(tpz.mod.HASTE_MAGIC, 3500)
    end
    -- If crits removed the final arm then run around scared with no positional DR
    if AnimationSub == 2 then
        mob:delStatusEffectSilent(tpz.effect.MAGIC_SHIELD)
        mob:delStatusEffectSilent(tpz.effect.PHYSICAL_SHIELD)
    end
    -- Spams TP moves at low HP
    if mob:getHPP() < 25 then
        mob:setMod(tpz.mod.REGAIN, 500)
    end
    -- Run around helplessly if both arms are lost
    if AnimationSub == 2 then
        mob:addRoamFlag(512) -- ignore attacking
	    if not mob:isFollowingPath() then
            if mob:getHPP() >= 5 then
		        mob:disengage()
            end
		    local point = {math.random(-54,12),-4,math.random(188,213)}
		    mob:pathThrough(point, tpz.path.flag.RUN)
	    end
    end
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
