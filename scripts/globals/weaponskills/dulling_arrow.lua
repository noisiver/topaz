-----------------------------------
-- Dulling Arrow
-- Archery weapon skill
-- Skill level: 80
-- Lowers enemy's INT. Chance of params.critical varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:16%  AGI:25%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5 params.ftp200 = 1.7 params.ftp300 = 2.0
    params.str_wsc = 0.25 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.25 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.2 params.agi_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    local resist = applyResistanceAddEffect(player, target, tpz.magic.ele.FIRE, 0)

    if (damage > 0 and target:hasStatusEffect(tpz.effect.INT_DOWN) == false) and resist >= 0.5 then
    local duration = duration * resist
    local power = math.floor((player:getMainLvl() / 10) * (tp / 2000) + 5)
        target:addStatusEffect(tpz.effect.INT_DOWN, power, 0, duration)
    end
		if damage > 0 then player:trySkillUp(target, tpz.skill.ARCHERY, tpHits+extraHits) end
		if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end
    return tpHits, extraHits, criticalHit, damage
end
