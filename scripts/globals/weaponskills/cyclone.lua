-----------------------------------
-- Cyclone
-- Dagger weapon skill
-- Skill level: 125
-- Delivers an area attack that deals wind elemental damage. Damage varies with TP.
-- This weapon skill is ranged and can be used from a distance (Up to 15').
-- Directly affected by Magic Attack Bonus.
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: Wind
-- Modifiers: DEX:30%  INT:25%
-- 100%TP    200%TP    300%TP
-- 1.00      2.38      2.88
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.ftp100 = 1.0 params.ftp200 = 1.25 params.ftp300 = 1.5
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.5 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.WIND
    params.skill = tpz.skill.DAGGER
    params.includemab = true
	params.enmityMult = 0.5
	params.bonusmacc = 50
    params.aoe = true


    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 0.4 params.int_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
	if damage > 0 then player:trySkillUp(target, tpz.skill.DAGGER, tpHits+extraHits) end
	if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end

    return tpHits, extraHits, criticalHit, damage

end
