-----------------------------------
-- Ascetics Fury
-- Hand-to-Hand weapon skill
-- Skill Level: N/A
-- Chance of params.critical hit varies with TP. Glanzfaust: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Monk) quest.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:50%  VIT:50%
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
    params.numHits = 2
    params.ftp100 = 1.5 params.ftp200 = 1.5 params.ftp300 = 1.5
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.5 params.crit200 = 0.6 params.crit300 = 0.7
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 2; params.atk200 = 2; params.atk300 = 2

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.crit100 = 0.2 params.crit200 = 0.3 params.crit300 = 0.5
        params.atk100 = 2.6; params.atk200 = 2.6; params.atk300 = 2.6
    end

    -- Apply aftermath
    tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
		if damage > 0 then player:trySkillUp(target, tpz.skill.HAND_TO_HAND, tpHits+extraHits) end
		if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end

    return tpHits, extraHits, criticalHit, damage
end
