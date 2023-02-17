-----------------------------------
-- Herculean Slash
-- Great Sword weapon skill
-- Skill Level: 290
-- Paralyzes target. Duration of effect varies with TP.
-- Aligned with the Snow Gorget, Thunder Gorget & Breeze Gorget.
-- Aligned with the Snow Belt, Thunder Belt & Breeze Belt.
-- Element: Ice
-- Modifiers: VIT:60%
-- As this is a magic-based weaponskill it is also modified by Magic Attack Bonus.
-- 100%TP    200%TP    300%TP
-- 3.50      3.50      3.50
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.ftp100 = 3.5 params.ftp200 = 3.5 params.ftp300 = 3.5
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.6 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.ICE
    params.skill = tpz.skill.GREAT_SWORD
    params.includemab = true
	params.enmityMult = 0.5

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.vit_wsc = 0.8
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
		if damage > 0 then player:trySkillUp(target, tpz.skill.GREAT_SWORD, tpHits+extraHits) end
		if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end

    local effect = tpz.effect.PARALYSIS
    local resist = applyResistanceAddEffect(player, target, tpz.magic.ele.ICE, 0, tpz.effect.PARALYSIS)
    local power = 25

    if damage > 0 and (canOverwrite(target, effect, power)) and resist >= 0.5 then
        local duration = (tp/1000 * 60) * resist
        target:delStatusEffectSilent(effect)
        target:addStatusEffect(effect, power, 3, duration)
    end
    return tpHits, extraHits, criticalHit, damage

end
