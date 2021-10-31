---------------------------------------------------
-- Nightmare
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill, summoner)
    -- base duration is 60 + 2 seconds per skill over cap
    local bonusTime = utils.clamp(((summoner:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - summoner:getMaxSkillLevel(pet:getMainLvl(), tpz.job.SMN, tpz.skill.SUMMONING_MAGIC))*2), 0, 120)
    local duration = 60 + bonusTime
    local lvlDiff = target:getMainLvl() - pet:getMainLvl()

    if lvlDiff < 0 then lvlDiff = 0; end
    local rand = math.random(0, 100)

    MobStatusEffectMove(pet, target, tpz.effect.BIO, 30, 3, 90)

    if rand < (50 - lvlDiff) and not target:isNM() then
        local typeEffect = tpz.effect.SLEEP_I
        target:addStatusEffectEx(tpz.effect.DEEPSLEEP,0,1,3,90)
        skill:setMsg(MobStatusEffectMove(pet, target, typeEffect, 1, 3, duration))

        return typeEffect
    end

    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end