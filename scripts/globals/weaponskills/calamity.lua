-----------------------------------
-- Calamity
-- Axe weapon skill
-- Skill level: 200 (Beastmasters and Warriors only.)
-- Delivers a single-hit attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget & Thunder Gorget.
-- Aligned with the Soil Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:32%  VIT:32%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      4.00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

	local params = {}
    params.ftp100 = 3.0 params.ftp200 = 3.5 params.ftp300 = 4.0
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 1.0
    params.ele = tpz.magic.ele.FIRE
    params.skill = tpz.skill.AXE
    params.includemab = true
	params.enmityMult = 0.5
	params.bonusmacc = 50

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp300 = 3.75
        params.str_wsc = 0.4 params.int_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
	if damage > 0 then player:trySkillUp(target, tpz.skill.AXE, tpHits+extraHits) end
	
    return tpHits, extraHits, criticalHit, damage

end
