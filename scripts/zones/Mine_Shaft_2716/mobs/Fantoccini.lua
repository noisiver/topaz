-----------------------------------
-- Area: Mine Shaft #2716 (Pulling The Strings)
--   NM: Moblin Fantocinni
-----------------------------------
local ID = require("scripts/zones/Mine_Shaft_2716/IDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
local mobSkills =
    {
        [dsp.job.WAR] = {skill = 3009, special = dsp.jsa.MIGHTY_STRIKES},
        [dsp.job.MNK] = {skill = 3012, special = dsp.jsa.HUNDRED_FISTS},
        [dsp.job.WHM] = {skill = 3013, special = dsp.jsa.BENEDICTION},
        [dsp.job.BLM] = {skill = 3016, special = dsp.jsa.MANAFONT},
        [dsp.job.RDM] = {skill = 1008, special = dsp.jsa.CHAINSPELL},
        [dsp.job.THF] = {skill = 3008, special = dsp.jsa.PERFECT_DODGE},
        [dsp.job.PLD] = {skill = 1008, special = dsp.jsa.INVINCIBLE},
        [dsp.job.DRK] = {skill = 3014, special = dsp.jsa.BLOOD_WEAPON},
        [dsp.job.BST] = {skill = 3009, special = dsp.jsa.FAMILIAR},
        [dsp.job.BRD] = {skill = 3008, special = dsp.jsa.SOUL_VOICE},
        [dsp.job.RNG] = {skill = 3011, special = dsp.jsa.EES_MAAT},
        [dsp.job.SAM] = {skill = 3007, special = dsp.jsa.MEIKYO_SHISUI},
        [dsp.job.NIN] = {skill = 3006, special = dsp.jsa.MIJIN_GAKURE},
        [dsp.job.DRG] = {skill = 3015, special = dsp.jsa.CALL_WYVERN},
        [dsp.job.SMN] = {skill = 3016, special = dsp.jsa.ASTRAL_FLOW_MAAT},
        [dsp.job.BLU] = {skill = 1008, special = dsp.jsa.AZURE_LORE},
        [dsp.job.COR] = {skill = 3010, special = dsp.jsa.WILD_CARD},
        [dsp.job.PUP] = {skill = 3012, special = dsp.jsa.OVERDRIVE_SHAMARHAAN},   	   	   	   	   	   	   	   	   	   	   	   	   	   	
    }
    local player = mob:getBattlefield():getPlayers()
    
    for i,v in pairs(player) do
        local jobID = v:getMainJob()

        mob:changeMobPool(8017 +jobID)
        mob:setMobMod(dsp.mobMod.SKILL_LIST, mobSkills[jobID].skill)
        dsp.mix.jobSpecial.config(mob, {
            specials =
            {
                {id = mobSkills[jobID].special},
            },
        })
        if jobid == dsp.job.BST then
            mob:setPet(GetMobByID(mob:getID() + 1))
        elseif jobid == dsp.job.DRG then
            mob:setPet(GetMobByID(mob:getID() + 2))
        elseif jobid == dsp.job.SMN then
            mob:setPet(GetMobByID(mob:getID() + 3))
        elseif jobid == dsp.job.PUP then
            mob:setPet(GetMobByID(mob:getID() + 4))
        end
        break
    end
end

function onMobDeath(mob, player, isKiller)
    moblinId = mob:getID() - 2 -- Moblin Fantocinniman is always offset by -2
    local moblin = GetMobByID(moblinId)
    if moblin:isAlive() then
        mob:messageText(mob, ID.text.NO_NO_PAPA_BOUGHT_THAT + math.random(0, 1))
        if moblin:getLocalVar("standby") == 1 then
            DespawnMob(moblinId)
        end
    end
    if mob:hasPet() then
        local pet = mob:getPet()
        if pet and pet:isAlive() then
            DespawnMob(pet:getID())
        end
    end
end

function onMobDespawn(mob)
end
