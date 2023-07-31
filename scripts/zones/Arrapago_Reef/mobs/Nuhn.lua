-----------------------------------
-- Area: Arrapago Reef
--  Mob: Nuhn
-----------------------------------
mixins =
{
   require("scripts/mixins/rage"),
   require("scripts/mixins/families/orobon")
}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 422)
    mob:setMod(tpz.mod.EVA, 278)
    mob:setMod(tpz.mod.MDEF, 20)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
    mob:setMod(tpz.mod.STORETP, 100)
    mob:setMod(tpz.mod.REGAIN, 0)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 8000) -- 9k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 9000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    mob:AnimationSub(0)
    mob:setLocalVar("FeelersBreakChance", 1) 
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
    local ModeChange = mob:getLocalVar("ModeChange")
    local AIMode = mob:getLocalVar("AIMode")
    local AnimationSub = mob:AnimationSub()
    local BattleTime = mob:getBattleTime()

    if AnimationSub == 0 then
        mob:setLocalVar("AIMode", 1)
        mob:setMod(tpz.mod.REGAIN, 0)
    end
    -- Enrages if Feelers are broken
    if AnimationSub == 1 then
        mob:setMod(tpz.mod.REGAIN, 200)
        mob:setLocalVar("AIMode", 2)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1697 then -- Uses Vile Belch after Seaspray
        mob:useMobAbility(1694) -- Vile Belch
    end
end


function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 300)
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
