-----------------------------------
-- Shockwave
-- Great Sword weapon skill
-- Skill level: 150
-- Delivers an area of effect attack. Sleeps enemies. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: None
-- Modifiers: STR:30%  MND:30%
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
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.3 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1
	params.bonusmacc = 50
	
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
		if damage > 0 then player:trySkillUp(target, tpz.skill.GREAT_SWORD, tpHits+extraHits) end
		if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end

    local resist = applyResistanceAddEffect(player, target, tpz.magic.ele.DARK, 0, tpz.effect.SLEEP_I)
    -- Silence duration changed from 60 to 45 as per bg-wiki: http://www.bg-wiki.com/bg/Tachi:_Gekko
    if (damage > 0 and target:hasStatusEffect(tpz.effect.SLEEP_I) == false) and resist >= 0.5 then
        local duration = (tp/1000 * 60) * resist
        target:addStatusEffect(tpz.effect.SLEEP_I, 1, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end
