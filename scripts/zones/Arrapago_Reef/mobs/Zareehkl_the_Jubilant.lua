-----------------------------------
-- Area: Arrapago Reef
--   NM: Zareehkl the Jubilant
-----------------------------------
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(90)
    mob:setMod(tpz.mod.DEF, 416)
    mob:setMod(tpz.mod.EVA, 348)
    mob:setMod(tpz.mod.UDMGPHYS, 100)
    mob:setMod(tpz.mod.UDMGRANGE, 100)
    mob:setMod(tpz.mod.UDMGMAGIC, 100)
    mob:setMod(tpz.mod.UDMGBREATH, 100)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6500) -- 7k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 7300) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:AnimationSub(1)
    mob:SetMobSkillAttack(0)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 303)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
	local WeaponSwapTime = mob:getLocalVar("WeaponSwapTime")
    local AnimationSub = mob:AnimationSub()
	local BattleTime = mob:getBattleTime()
    -- Weapon Swap timer
	if WeaponSwapTime == 0 then
		mob:setLocalVar("WeaponSwapTime", BattleTime + math.random(60, 90))
	elseif BattleTime >= WeaponSwapTime then
        mob:AnimationSub(math.random(0, 2))
		mob:setLocalVar("WeaponSwapTime", BattleTime + math.random(60, 90))
    end
    -- Logic for current weapon
    if AnimationSub == 0 then -- Only uses jump attacks with sword out
        mob:setDamage(125)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 303)
        mob:SetMobSkillAttack(311) -- Jumping thrust auto-attack
    end
    if AnimationSub == 2 then -- Only uses Unblest Jambiya with dagger out
        mob:setDamage(125)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6113)
        mob:SetMobSkillAttack(0)
    end
    if AnimationSub == 1 then -- Uses normal attacks with fists out
        mob:setDamage(90)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 303)
        mob:SetMobSkillAttack(0)
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
