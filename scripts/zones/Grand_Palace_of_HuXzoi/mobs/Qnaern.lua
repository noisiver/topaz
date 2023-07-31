-----------------------------------
-- Area: Grand Palace of HuXzoi
--   NM: Qn'aern
-- Note: The RDM and WHM versions in Palace assist Ix'Aern (MNK)
--       All Qn'aerns can use their respective two-hour abilities multiple times (guessing 2-minute timers)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:AnimationSub(1)
    local mJob = mob:getMainJob()
    if mJob == tpz.job.RDM then
        mob:setMod(tpz.mod.FASTCAST,15)
        tpz.mix.jobSpecial.config(mob, {
            specials =
            {
                {
                    id = tpz.jsa.CHAINSPELL,
                    cooldown = math.random(180, 210)
                },
            },
        })
    elseif mJob == tpz.job.WHM then
        mob:setMod(tpz.mod.REGEN, 3)
        tpz.mix.jobSpecial.config(mob, {
            specials =
            {
                {
                    id = tpz.jsa.BENEDICTION,
                    cooldown = math.random(180, 210)
                },
            },
        })
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
