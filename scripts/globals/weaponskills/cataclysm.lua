-----------------------------------
-- Cataclysm
-- Skill level: 280
-- Delivers light elemental damage. Additional effect: Flash. Chance of effect varies with TP.
-- Generates a significant amount of Enmity.
-- Does not stack with Sneak Attack
-- Aligned with Aqua Gorget.
-- Aligned with Aqua Belt.
-- Properties:
-- Element: Light
-- Skillchain Properties:Induration Reverberation
-- Modifiers: STR:30% INT:30%
-- Damage Multipliers by TP:
--     100%TP    200%TP     300%TP
--      3.00     3.00     3.00
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.ftp100 = 3.0 params.ftp200 = 3.0 params.ftp300 = 3.0
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.3 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.DARK
    params.skill = tpz.skill.STAFF
    params.includemab = true
	params.enmityMult = 0.5
	params.bonusmacc = 100
    params.aoe = true

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 2.75 params.ftp200 = 4 params.ftp300 = 5
        params.str_wsc = 0.3 params.int_wsc = 0.3 params.mnd_wsc = 0.0
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
		if damage > 0 then player:trySkillUp(target, tpz.skill.STAFF, tpHits+extraHits) end
		
    return tpHits, extraHits, criticalHit, damage
end
