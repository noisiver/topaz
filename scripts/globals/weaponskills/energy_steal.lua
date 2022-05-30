------------------------
--    Energy Steal    --
-- Dagger (150 Skill)
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.ftp100 = 0.25 params.ftp200 = 0.3 params.ftp300 = 0.4
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 1.0 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.DARK
    params.skill = tpz.skill.DAGGER
    params.includemab = true
	params.enmityMult = 0.5
	params.bonusmacc = 50

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4 params.int_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
    player:addMP(damage)
    damage = 0
    return tpHits, extraHits, criticalHit, damage
end