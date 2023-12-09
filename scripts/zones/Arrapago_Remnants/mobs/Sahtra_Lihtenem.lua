-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Sahtra Lihtenem (Draugar NM)
-- ID: 17081148
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/mobs")
require("scripts/globals/msg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
tpMoveList1 = {484, 485, 478, 1795, 931} -- Blood Saber, Black Cloud, Hell Slash, Malediction, Cross Reaver
tpMoveList2 = {484, 485, 478, 1795, 935} -- Blood Saber, Black Cloud, Hell Slash, Malediction, Amon Drive
tpMoveList3 = {484, 485, 478, 1795, 937} -- Blood Saber, Black Cloud, Hell Slash, Malediction, Dragonfall

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DMGMB, 100)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 0)
    mob:setMobMod(tpz.mobMod.NO_REST, 1)
    ChangeJobTHF(mob)
    mob:setLocalVar("phase", 0)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.PERFECT_DODGE, hpp = 80},
            {id = tpz.jsa.MANAFONT, hpp = 50},
            {id = tpz.jsa.SPIRIT_SURGE, hpp = 20},
        },
    })
end

function onMobRoam(mob)
    local instance = mob:getInstance()
    local phase = mob:getLocalVar("phase")

    if (phase == 3) then 
        DeathDialogue(mob, target, instance)
    elseif (phase == 4) then -- Don't heal up from roaming
        SetHPPercent(mob)
    end
end

function onMobEngaged(mob, target)
    local phase = mob:getLocalVar("phase")
    -- Reset vars, jo, model on engage unless in phase 4
    mob:setLocalVar("jumpTimer", os.time() + 30)
    if (phase < 4) then
        mob:setLocalVar("phase", 0)
        mob:setLocalVar("bioTimer", os.time() + 30)
        mob:setLocalVar("msgTimer", os.time() + 45)
        ChangeJobTHF(mob)
    end
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local instance = mob:getInstance()
    local stage = instance:getStage()
    local phase = mob:getLocalVar("phase")
    local bioTimer = mob:getLocalVar("bioTimer")
    local jumpTimer = mob:getLocalVar("jumpTimer")
    local enmityList = mob:getEnmityList()
    local bioTarget = nil
    local scElement = {}

    -- Logic for first 3 phases. Phase4 is phase3 without killing players again.
    if (phase < 4) then
        if (hpp > 70) then 
            mob:setLocalVar("phase", 1)
            for _, enmity in ipairs(enmityList) do
                if enmityList and #enmityList > 0 and os.time() >= bioTimer then
                    local randomTarget = enmityList[math.random(1,#enmityList)];
                    entityId = randomTarget.entity:getID();
                    if (entityId > 10000) then -- ID is a mob(pet) then
                        bioTarget = GetMobByID(entityId)
                    else
                        bioTarget = GetPlayerByID(entityId)
                    end
                    mob:setLocalVar("bioTimer", os.time() + 5)
                    mob:castSpell(233, GetPlayerByID(bioTarget)) -- Bio IV
                end
            end
            ChangeJobTHF(mob)
        elseif (hpp > 30) and (hpp < 70) then 
            mob:setLocalVar("phase", 2)
            ChangeJobBLM(mob)
        elseif (hpp < 30) then 
            mob:setLocalVar("phase", 3)
            ChangeJobDRG(mob)
            if (stage == 3) then -- Do not do the kill all phase in the final boss fight
                instance:setProgress(instance:getProgress() + 100)
                KillAllPlayers(mob, instance)
            end
        end
    end

    -- Phase 4 logic
    if (phase == 4) then
        if os.time() >= jumpTimer then
            mob:setLocalVar("jumpTimer", os.time() + 30)
            mob:useMobAbility(718) -- Jump
        end
        ChangeJobDRG(mob)
    end

    mob:addListener("SPELL_DMG_TAKEN", "SL_SPELL_DMG_TAKEN", function(mob, caster, spell, amount, msg)
        local element = spell:getElement()
        local phase = mob:getLocalVar("phase")
        -- Taking a 1k+ damage Fire MB
        if (element == tpz.magic.ele.FIRE) and (amount >= 500) and (phase == 2) then
            if (msg == tpz.msg.basic.MAGIC_BURST_BLACK) or (msg == tpz.msg.MAGIC_BURST_BREATH) then
                BreakMob(mob, caster, 1, 60, 1)
            end
        end
    end)

    -- Handle Bio IV being interrupted
    mob:addListener("MAGIC_STATE_EXIT", "SL_MAGIC_EXIT", function(mob, spell)
        if spell:getID() == 233 then
          mob:setLocalVar("bioTimer", os.time() + 30)
        end
    end)

    -- Handle Jump being interrupted
    mob:addListener("WEAPONSKILL_STATE_INTERRUPTED", "SL_WS_INTERRUPTED", function(mob, skill)
        if skill == 718 then
            mob:setLocalVar("jumpTimer", 0)
        end
    end)

    if not mob:hasStatusEffect(tpz.effect.SILENCE) and (phase == 2) then
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems vulnerable to fire magic...", 0xD, none, 30)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    local phase = mob:getLocalVar("phase")

    if (phase == 1) then
        return tpMoveList1[math.random(#tpMoveList1)]
    elseif (phase == 2) then
        return tpMoveList2[math.random(#tpMoveList2)]
    elseif (phase >= 3) then
        return tpMoveList3[math.random(#tpMoveList3)]
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local progress = instance:getProgress()

    if isKiller or noKiller then
        -- If final boss, spawn next boss in line
        if salvageUtil.TrySpawnChariotBoss(mob, player, 17081149) then
        else
            -- Teleport players back to the start if this is the first NM killed
            if (progress == 0) then
                instance:setProgress(1)
                salvageUtil.teleportGroup(player, 339, -0, math.random(456, 464), 129, true, false, false)
                salvageUtil.msgGroup(player, "A strange force pulls you back to the last used teleporter.", 0xD, none)
            elseif (progress == 1) then
                -- Nearby door opens
                mob:getEntity(bit.band(ID.npc[3][1].DOOR2, 0xFFF), tpz.objType.NPC):setAnimation(8)
                mob:getEntity(bit.band(ID.npc[3][1].DOOR2, 0xFFF), tpz.objType.NPC):untargetable(true)
                salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
                instance:setProgress(2)
            end
        end
    end
end

function onMobDespawn(mob)
end

function ChangeJobTHF(mob)
    mob:setDamage(80)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
    mob:setMod(tpz.mod.MATT, 0)
    mob:setMod(tpz.mod.ATT, 360) 
    mob:setMod(tpz.mod.ACC, 398) 
    mob:setMod(tpz.mod.CONSERVE_TP, 0)
    mob:setMod(tpz.mod.CRIT_DEF_BONUS, 0)
    mob:setMod(tpz.mod.DRAGON_KILLER, 0)
    mob:setMod(tpz.mod.DRAGON_CIRCLE, 0)
    mob:SetMagicCastingEnabled(false)
    mob:setModelId(1757)
end

function ChangeJobBLM(mob)
    mob:setDamage(115)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
    mob:setMod(tpz.mod.MATT, 36)
    mob:setMod(tpz.mod.ATT, 360) 
    mob:setMod(tpz.mod.ACC, 398) 
    mob:setMod(tpz.mod.CONSERVE_TP, 0)
    mob:setMod(tpz.mod.CRIT_DEF_BONUS, 0)
    mob:setMod(tpz.mod.DRAGON_KILLER, 0)
    mob:setMod(tpz.mod.DRAGON_CIRCLE, 0)
    mob:SetMagicCastingEnabled(true)
    mob:setModelId(1769) 
end

function ChangeJobDRG(mob)
    mob:setDamage(115)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
    mob:setMod(tpz.mod.MATT, 0)
    mob:setMod(tpz.mod.ATT, 370) 
    mob:setMod(tpz.mod.ACC, 433) 
    mob:setMod(tpz.mod.CONSERVE_TP, 24)
    mob:setMod(tpz.mod.CRIT_DEF_BONUS, 5)
    mob:setMod(tpz.mod.DRAGON_KILLER, 5)
    mob:setMod(tpz.mod.DRAGON_CIRCLE, 5)
    mob:SetMagicCastingEnabled(false)
    mob:setModelId(1761) 
end


function KillAllPlayers(mob, instance)
    local chars = instance:getChars()

    for _, players in pairs(chars) do
        players:delStatusEffectSilent(tpz.effect.RERAISE)
        players:setHP(0)
        mob:disengage()
    end
end

function DeathDialogue(mob, target, instance)
    local textDelay = mob:getLocalVar("textDelay")
    local textLine = mob:getLocalVar("textLine")

    if (textLine == 0) and os.time() >= textDelay then
        mob:setLocalVar("textLine", 1)
        mob:setLocalVar("textDelay", os.time() + 20)
        salvageUtil.msgGroup(mob, "You trained them well, Gnirdrof.", 0, "Sahtra Lihtenem")
        salvageUtil.msgGroup(mob, "You delivered the greatest fighting force the world has ever known. Right into my hands. Exactly as I intended.", 0, "Sahtra Lihtenem")
    elseif (textLine == 1) and os.time() >= textDelay then
        mob:setLocalVar("textLine", 2)
        mob:setLocalVar("textDelay", os.time() + 10)
        salvageUtil.msgGroup(mob, "You will be rewarded for your unwitting sacrifice.", 0, "Sahtra Lihtenem")
    elseif (textLine == 2) and os.time() >= textDelay then
        mob:setLocalVar("textLine", 3)
        mob:setLocalVar("textDelay", os.time() + 20)
        salvageUtil.msgGroup(mob, "Watch now as I raise them from the dead, to become masters of the Draugar.", 0, "Sahtra Lihtenem")
        salvageUtil.msgGroup(mob, "They will shroud this world in chaos and destruction.", 0, "Sahtra Lihtenem")
    elseif (textLine == 3) and os.time() >= textDelay then
        mob:setLocalVar("textLine", 4)
        mob:setLocalVar("textDelay", os.time() + 20)
        salvageUtil.msgGroup(mob, "No more Sahtra, No more lives will be consumed by your hatred!", 0, "Noirit Gnirdrof")
    elseif (textLine == 4) and os.time() >= textDelay then
        mob:setLocalVar("textLine", 5)
        mob:setLocalVar("textDelay", os.time() + 10)
        salvageUtil.msgGroup(mob, "Free at last! It is over, my son. This is the moment of reckoning.", 0, "SaneretLihtenem")
    elseif (textLine == 5) and os.time() >= textDelay then
        mob:setLocalVar("textLine", 6)
        mob:setLocalVar("textDelay", os.time() + 20)
        mob:setLocalVar("phase", 4)
        salvageUtil.msgGroup(mob, "Rise up, champions of the Crystal!", 0, "Noirit Gnirdrof")
        RaiseAllPlayers(instance)
        mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
        instance:setProgress(instance:getProgress() - 100)
    end
end

function RaiseAllPlayers(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:sendRaise(3)
        v:delStatusEffect(1)
        v:setMP(3000)
        v:setLocalVar("GMRaise", 1)
    end
end

function SetHPPercent(mob)
    local hpp = 29
    hpp = hpp / 100
    hpp = math.ceil(mob:getMaxHP() * hpp)
    mob:setHP(hpp)
end


