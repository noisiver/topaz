-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Gotoh Zha the Redolent
-----------------------------------
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/weapon_break"),
    require("scripts/mixins/rage")
}
require("scripts/globals/status")
-----------------------------------
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MANAFONT, hpp = math.random(66, 95)},
            {id = tpz.jsa.BENEDICTION, hpp = 0},
        },
    })
    mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 320)
    mob:setMod(tpz.mod.MATT, 36)
    mob:setMod(tpz.mod.MDEF, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.SDT_FIRE, 85)
    mob:setMod(tpz.mod.SDT_ICE, 115)
    mob:setMod(tpz.mod.SDT_WIND, 50)
    mob:setMod(tpz.mod.SDT_EARTH, 85)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_WATER, 85)
    mob:setMod(tpz.mod.SDT_LIGHT, 85)
    mob:setMod(tpz.mod.SDT_DARK, 100)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.REGEN, 0)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 8000) -- 9k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 9000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:AnimationSub(0)
    mob:setLocalVar("BreakChance", 1)
    mob:setLocalVar("jobChanged", 0)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setSpellList(296) -- Set BLM spell list
end

function onMobFight(mob, target)
	local GroundBurstEnabled = mob:getLocalVar("GroundBurstEnabled")
    -- Throw staff at < 50% HP if it wasn't broken by critical hits
    if mob: getHPP() < 50 and mob:AnimationSub() == 0 then
        mob:useMobAbility(2361) -- Stave Toss
        mob:AnimationSub(1)
    end
    -- Swap to WHM after throwing staff
    if mob:AnimationSub() == 1 and mob:getLocalVar("jobChanged") == 0 then
        mob:setLocalVar("jobChanged", 1)
        mob:setSpellList(297) -- Set WHM spell list.
        -- set new job traits
        mob:setMod(tpz.mod.MATT, 0)
        --~50% DR to magic
        mob:setMod(tpz.mod.MDEF, 48) 
        mob:setMod(tpz.mod.REGEN, 30)
	    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 50)
        tpz.mix.jobSpecial.config(mob, {
            specials =
            {
                {id = tpz.jsa.MANAFONT, hpp = 0},
                {id = tpz.jsa.BENEDICTION, hpp = math.random(5, 40)},
            },
        })
    end
    -- If Warm-up is used, follow up with a Groundburst at next possible chance when target is in range
    if GroundBurstEnabled > 0 and mob:checkDistance(target) <= 10 then
        mob:useMobAbility(1926) -- Groundburst
        mob:setLocalVar("GroundBurstEnabled", 0) 
    end
end

function onMobWeaponSkillPrepare(mob, target)
    if mob:AnimationSub() == 0 then -- Only uses Rushing Drub as a BLM
        return 1920
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1924 then -- Warm-up. Enables use of Groundburst
        mob:setLocalVar("GroundBurstEnabled", 1)
    end
    if skill:getID() == 1926 then -- Groundburst
        mob:setLocalVar("GroundBurstEnabled", 0) 
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
