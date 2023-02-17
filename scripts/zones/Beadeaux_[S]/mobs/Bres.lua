-- MNK/MNK
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- Only kicks, always twice in a row, up to three times in a row
-- Can Guard
-- Uses Dragon Kick, Aegis schism, Barbed Crescent(all fomor moves?). Greatly favors Dragon Kick.
-- Used 100 fists at 55% HP.
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
    AddKickMods(mob)
end

function onMobFight(mob, target)
    AddKickMods(mob)
end


function onMobWeaponSkillPrepare(mob, target)
    -- Uses Dragon Kick, Aegis schism, Barbed Crescent(all fomor moves?). Greatly favors Dragon Kick.
    if math.random(100) <= 20 then
        return math.random(249, 253)
    else
        return 8
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function AddKickMods(mob)
    if not mob:hasStatusEffect(tpz.effect.FOOTWORK) then
        mob:addStatusEffect(tpz.effect.FOOTWORK, 1, 0, 7200)
    end
    mob:setDamage(40)
    mob:setDelay(5000)
    mob:setMod(tpz.mod.MAIN_DMG_RATING, 0)
    mob:setMod(tpz.mod.STORETP, 0)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 14)
end