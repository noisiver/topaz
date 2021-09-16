-----------------------------------
-- Blade Kamu
-- Katana weapon skill
-- Skill Level: N/A
-- Lowers target's params.accuracy. Duration of effect varies with TP. Nagi: Aftermath effect varies with TP.
-- Effect lasts 60 seconds @ 100 TP, 90 seconds @ 200 TP, and 120 seconds @ 300 TP
-- Available only after completing the Unlocking a Myth (Ninja) quest.
-- Aligned with the Shadow Gorget, Thunder Gorget & Breeze Gorget.
-- Aligned with the Shadow Belt, Thunder Belt & Breeze Belt.
-- Element: None
-- Modifiers: STR:50%  INT:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 3.5 params.ftp200 = 3.5 params.ftp300 = 3.5
    params.str_wsc = 0.0 params.dex_wsc = 0.4 params.vit_wsc = 0.0 params.agi_wsc = 0.4 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.25; params.atk200 = 1.25; params.atk300 = 1.25
    params.ignoresDef = true
    params.ignored100 = 0.25
    params.ignored200 = 0.25
    params.ignored300 = 0.25

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.6 params.int_wsc = 0.6
        params.atk100 = 1.3125; params.atk200 = 1.3125; params.atk300 = 1.3125
    end

    -- Apply Aftermath
    tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    local resist = applyResistanceAddEffect(player, target, tpz.magic.ele.EARTH, 0)
    if damage > 0 then
        if not target:hasStatusEffect(tpz.effect.ACCURACY_DOWN) and resist >= 0.5 then
            local duration = tp / 1000 * 60 * resist
            target:addStatusEffect(tpz.effect.ACCURACY_DOWN, 10, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end
