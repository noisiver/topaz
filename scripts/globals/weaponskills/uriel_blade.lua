-----------------------------------
-- Uriel Blade
-- Sword weapon skill
-- Skill Level: N/A
-- Description: Delivers an area attack that deals light elemental damage. Damage varies with TP. Additional effect Flash.
-- AoE range ??.
-- Only available during Campaign Battle while wielding a Griffinclaw.
-- Aligned with the Thunder Gorget & Breeze Gorget.
-- Aligned with Thunder Belt & Breeze Belt.
-- Modifiers: STR: 32% MND:32%
-- 100%TP    200%TP    300%TP
-- 4.50      6.00      7.50
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 4.5 params.ftp200 = 6 params.ftp300 = 7.5
    params.str_wsc = 0.32 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.32 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.LIGHT
    params.skill = tpz.skill.SWORD
    params.includemab = true
    params.bonusmacc = 256

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
	if damage > 0 then player:trySkillUp(target, tpz.skill.SWORD, tpHits+extraHits) end
	


    if (damage > 0 and target:hasStatusEffect(tpz.effect.FLASH) == false) then
    target:addStatusEffect(tpz.effect.FLASH, 200, 0, 15)
    end


    return tpHits, extraHits, criticalHit, damage
end
