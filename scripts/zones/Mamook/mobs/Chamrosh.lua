-----------------------------------
-- Area: Mamook
--  ZNM: Chamrosh (Tier-1 ZNM)
-- Does not use normal colibri mimic mechanics, changes form every
-- 2.5 mins. st form mimics all spells 2nd form cast spells from list only
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
-- todo: when mimics a spell will cast the next tier spell

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
	mob:setDamage(125)
    mob:setMod(tpz.mod.ATT, 522)
    mob:addMod(tpz.mod.UFASTCAST, 150)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 3000) -- 5k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 5000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setLocalVar("changeTime", 60)
    mob:setLocalVar("useWise", math.random(25, 50))

        -- Apply MACC Equal to A+ skill of their level so they will land mimiced spells
        local skill = utils.getSkillLvl(1, mob:getMainLvl())
        mob:setMod(tpz.mod.MACC, skill)
end

function onMobFight(mob, target)
    local delay = mob:getLocalVar("delay")
    local LastCast = mob:getLocalVar("LAST_CAST")
    local spell = mob:getLocalVar("COPY_SPELL")
    local changeTime = mob:getLocalVar("changeTime")

    if spell > 0 and mob:hasStatusEffect(tpz.effect.SILENCE) == false then
        if delay >= 3 then
            mob:castSpell(spell)
            mob:setLocalVar("COPY_SPELL", 0)
            mob:setLocalVar("delay", 0)
        else
            mob:setLocalVar("delay", delay+1)
        end
    end
    if mob:getHPP() < mob:getLocalVar("useWise") and mob:getLocalVar("usedMainSpec") == 0 then
        mob:useMobAbility(1702)
        mob:setLocalVar("usedMainSpec", 1)
    end
    if mob:getBattleTime() >= changeTime then
        if mob:AnimationSub() == 0 then
            mob:AnimationSub(1)
            mob:setSpellList(0)
            mob:setLocalVar("changeTime", mob:getBattleTime() + 60)
        else
            mob:AnimationSub(0)
            mob:setSpellList(302)
            mob:setLocalVar("changeTime", mob:getBattleTime() + 60)
        end
    end
end

function onMagicHit(caster, target, spell)
    if spell:tookEffect() and target:AnimationSub() == 1 and (caster:isPC() or caster:isPet()) then
        if spell:getID() == 533 then return end -- Doesn't mimic self-destruct
        if spell:getID() >= 23 and spell:getID() <= 40 or spell:getID() >= 144 and spell:getID() <= 203 or spell:getID() >= 220 and spell:getID() <= 233 then
            target:setLocalVar("COPY_SPELL", spell:getID() +1)
        else
            target:setLocalVar("COPY_SPELL", spell:getID())
        end
        target:setLocalVar("LAST_CAST", target:getBattleTime())
    end

    return 1
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 100)
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
