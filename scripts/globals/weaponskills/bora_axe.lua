-----------------------------------
-- Bora Axe
-- Axe weapon skill
-- Skill level: 280
-- Delivers a single-hit ranged attack at a maximum distance of 15.7'. Chance of binding varies with TP
-- Bind doesn't always break from hitting mob.
-- This Weapon Skill's first hit params.ftp is duplicated for all additional hits
-- Not natively available to RNG
-- Aligned with the ?? Gorget.
-- Element: Ice
-- Modifiers: DEX 100%  -- http://wiki.bluegartr.com/bg/Bora_Axe
-- 100%TP    200%TP    300%TP
-- 1.0        1.0      1.0
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 2
    params.ftp100 = 2.5 params.ftp200 = 2.7 params.ftp300 = 3.0
    params.str_wsc = 0.0 params.dex_wsc = 0.5 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1 params.atk200 = 1 params.atk300 = 1
    params.hybridWS = true
    params.ele = tpz.magic.ele.ICE
    params.skill = tpz.skill.AXE
    params.includemab = true
	params.bonusmacc = 50

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 4.5 params.ftp200 = 4.5 params.ftp300 = 4.5
        params.dex_wsc = 1.0
        params.atk100 = 1.0; params.atk200 = 1.0; params.atk300 = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	if damage > 0 then player:trySkillUp(target, tpz.skill.AXE, tpHits+extraHits) end

	local resist =  applyResistanceAddEffect(player, target, tpz.magic.ele.ICE, params.bonusmacc, tpz.effect.FROST) 
    local duration = (tp/1000 * 30) + 60
    if (damage > 0 and resist >= 0.5) then
        if not target:hasStatusEffect(tpz.effect.FROST) and not target:hasStatusEffect(tpz.effect.BURN) then
            target:addStatusEffect(tpz.effect.FROST, 15, 3, duration * resist)
        end
    end
	
    return tpHits, extraHits, criticalHit, damage
end
