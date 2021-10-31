-----------------------------------
-- Area: Monarch Linn
--  Mob: Mammet-19 Epsilon
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:SetMagicCastingEnabled(false)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
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
    -- setDamage works beautifully, but setDelay doesn't seem to be working.  Increased DMG turned off.
    if (newform == 0) then -- Hand Form, ~3s delay
        mob:SetMagicCastingEnabled(false)
		mob:setMod(tpz.mod.HASTE_MAGIC, 2000)
        mob:setDamage(40)
    elseif (newform == 1) then -- Sword Form, ~2s delay, melee hits for ~50-100 vs WHM/BLM w/o buffs, 40 DMG seems to work.
        mob:SetMagicCastingEnabled(false)
        mob:setDamage(40)
		mob:setMod(tpz.mod.HASTE_MAGIC, 2500)
    elseif (newform == 2) then -- Polearm Form, ~3-3.5s delay, melee hits for ~100-150.  Takes about 70-80 DMG to make this happen.
        mob:SetMagicCastingEnabled(false)
        mob:setDamage(75)
		mob:setMod(tpz.mod.HASTE_MAGIC, 1500)
    elseif (newform == 3) then -- Staff Form, ~4s delay, ~10 seconds between spell ends and next cast
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
        mob:SetMagicCastingEnabled(true)
        mob:setDamage(40)
		mob:setMod(tpz.mod.HASTE_MAGIC, 0)
    end
    mob:AnimationSub(newform)
    mob:setLocalVar('changeTime', mob:getBattleTime())
end

function onMobDeath(mob, player, isKiller)
end
