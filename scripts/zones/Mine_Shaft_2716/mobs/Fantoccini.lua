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
        [tpz.job.WAR] = {skill = 3009, special = tpz.jsa.MIGHTY_STRIKES},
        [tpz.job.MNK] = {skill = 3012, special = tpz.jsa.HUNDRED_FISTS},
        [tpz.job.WHM] = {skill = 3013, special = tpz.jsa.BENEDICTION},
        [tpz.job.BLM] = {skill = 3016, special = tpz.jsa.MANAFONT},
        [tpz.job.RDM] = {skill = 1008, special = tpz.jsa.CHAINSPELL},
        [tpz.job.THF] = {skill = 3008, special = tpz.jsa.PERFECT_DODGE},
        [tpz.job.PLD] = {skill = 1008, special = tpz.jsa.INVINCIBLE},
        [tpz.job.DRK] = {skill = 3014, special = tpz.jsa.BLOOD_WEAPON},
        [tpz.job.BST] = {skill = 3009, special = tpz.jsa.FAMILIAR},
        [tpz.job.BRD] = {skill = 3008, special = tpz.jsa.SOUL_VOICE},
        [tpz.job.RNG] = {skill = 3011, special = tpz.jsa.EES_MAAT},
        [tpz.job.SAM] = {skill = 3007, special = tpz.jsa.MEIKYO_SHISUI},
        [tpz.job.NIN] = {skill = 3006, special = tpz.jsa.MIJIN_GAKURE},
        [tpz.job.DRG] = {skill = 3015, special = tpz.jsa.CALL_WYVERN},
        [tpz.job.SMN] = {skill = 3016, special = tpz.jsa.ASTRAL_FLOW_MAAT},
        [tpz.job.BLU] = {skill = 1008, special = tpz.jsa.AZURE_LORE},
        [tpz.job.COR] = {skill = 3010, special = tpz.jsa.WILD_CARD},
        [tpz.job.PUP] = {skill = 3012, special = tpz.jsa.OVERDRIVE_SHAMARHAAN},   	   	   	   	   	   	   	   	   	   	   	   	   	   	
    }
    local player = mob:getBattlefield():getPlayers()
    
    for i,v in pairs(player) do
        local jobID = v:getMainJob()

        mob:changeMobPool(8017 +jobID)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, mobSkills[jobID].skill)
        tpz.mix.jobSpecial.config(mob, {
            specials =
            {
                {id = mobSkills[jobID].special},
            },
        })
        if jobid == tpz.job.BST then
            mob:setPet(GetMobByID(mob:getID() + 1))
        elseif jobid == tpz.job.DRG then
            mob:setPet(GetMobByID(mob:getID() + 2))
        elseif jobid == tpz.job.SMN then
            mob:setPet(GetMobByID(mob:getID() + 3))
        elseif jobid == tpz.job.PUP then
            mob:setPet(GetMobByID(mob:getID() + 4))
        end
        break
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
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
