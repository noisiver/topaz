-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel GK
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMod(tpz.mod.MDEF, 12) 
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.CALL_WYVERN, hpp = 100, cooldown = 60}, -- "Call Wyvern is used at the time of monster engage. Call Wyvern is used ~1 minute subsequent to Wyvern's death."
            {id = tpz.jsa.MEIKYO_SHISUI, hpp = math.random(90, 95), cooldown = 90}, -- "Meikyo Shisui is used very frequently."
        },
    })
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-6, mobid+1 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)
    -- TODO: AA GK actively seeks to skillchain to Light off of his own WSs under MS, or other AA's WSs.
end

function onMobDeath(mob, player, isKiller)
end
