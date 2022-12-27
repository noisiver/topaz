-- DRK/DRK
-- Immune to Paralyze, Silence, Sleep, Bind, Gravity, Break
-- Casts Absorb Spells including Absorb-ACC
-- Cast Timer: 31 - > 55 - > 21 - > 58 - > 32 - > 53 - > 17
-- Two Hour animation whenever he changes "modes"
-- Modes are Physical or Magical + Breath + Spirits absorb. **CAN SWAP into same absorb twice in a row!!**
-- Mode Timer: 52 - > 32 - > 24 - > 40 - > (over 1 minute) 55 - > 50
-- Absorbs double the dmg taken in mode.
-- Uses Shell Bash, Ore Lob, Head Butt, Ore Toss, Wrath of Gudha
-----------------------------------
-- Area: Beadeaux [S]
--   NM: Ba'Tho Mercifulheart
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMod(tpz.mod.DARK_NEVER_MISS, 0)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("absorbChangeTimer", os.time() + math.random(15, 60))
    mob:setLocalVar("mode", 0)
end

function onMobFight(mob, target)
    local absorbChangeTimer = mob:getLocalVar("absorbChangeTimer")
    local mode = mob:getLocalVar("mode")

    if (os.time() >= absorbChangeTimer) then
        mob:setLocalVar("absorbChangeTimer", os.time() + math.random(15, 60))
        mob:setLocalVar("mode", math.random(1, 2))
        mob:useMobAbility(307) -- 2 hour "cloud" animation
    end

    if (mode == 1) then -- Physical  Absorb
        mob:setMod(tpz.mod.PHYS_ABSORB, 200)
        mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    elseif (mode == 2) then -- Magical + Breath Absorb
        mob:setMod(tpz.mod.PHYS_ABSORB, 0)
        mob:setMod(tpz.mod.MAGIC_ABSORB, 200)
    end
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = { 2204, 2223, 2224, 2225, 2228}
   --  Ore Lob, Ore Toss, Head Butt, Shell Bash, Wrath of Gudha

   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end
