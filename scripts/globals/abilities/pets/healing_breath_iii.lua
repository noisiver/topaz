---------------------------------------------
-- Healing Breath III
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------
function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(pet, target, skill, action)

    -- HP Recovered = [([(Wyvern Max HP)*(Breath Multiplier/256)] + Healing Breath Base + (Breath Job Points * 10)) * (1 + (Breath Augments/100))]
    -- Breath Multiplier = Σ(Healing Breath Value + Enhances Breath Equipment + Deep Breathing Modifier)
    -- Deep Breathing Modifier = floor([37.5 + (12.5 * Deep Breathing Merits)] + Augment-Icon.png Augment Deep Breathing)
    -- Augment Deep Breathing = 5 per merit including the first
    ---------- Deep Breathing ----------
    -- 0 for none
    -- 50 for first merit
    -- 5 for each merit after the first
    -- TODO: 5 per merit for augmented AF2 (10663 *w/ augment*)

    local master = pet:getMaster()
    local hp = pet:getMaxHP()
    local gear = master:getMod(tpz.mod.WYVERN_BREATH) -- Master gear that enhances breath
    local breathBase = 42
    local deepBreathing = 0
    if pet:hasStatusEffect(tpz.effect.MAGIC_ATK_BOOST) then
        deepBreathing = 100 + (master:getMerit(tpz.merit.DEEP_BREATHING) - 1) * 10
        pet:delStatusEffectSilent(tpz.effect.MAGIC_ATK_BOOST)
    end
    local breathMultiplier = 55 + gear + deepBreathing
    local breathJP = 0 -- NYI
    local breathAug = (0 / 100) -- NYI

    local hpRecovered = math.floor((hp * (breathMultiplier/256)) + breathBase + (breathJP) * (1 + (breathAug)))
    -- print(string.format("hp %s\ngear %s\nbreathMultiplier %s\nbreathBase %s\ndeepBreathing %s\nbreathJP %s\nbreathAug %s\nhpRecovered %s", hp, gear, breathMultiplier, breathBase, deepBreathing, breathJP, breathAug, hpRecovered)) 

    skill:setMsg(tpz.msg.basic.JA_RECOVERS_HP)
    target:addHP(hpRecovered)
    pet:updateEnmityFromCure(target, hpRecovered)
    target:addStatusEffect(tpz.effect.REGEN, 5, 3, 60)
    return hpRecovered
end
