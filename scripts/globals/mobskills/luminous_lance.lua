---------------------------------------------
--  Luminous Lance
---------------------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local lanceTime = mob:getLocalVar("lanceTime")
    local lanceOut = mob:getLocalVar("lanceOut")
    if (not (target:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD)))
        and (lanceTime + 60 < mob:getBattleTime()) and target:getCurrentAction() ~= tpz.act.MOBABILITY_USING
        and lanceOut == 1 then

        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)

    mob:showText(mob, ID.text.SELHTEUS_TEXT + 1)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.6
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.0
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.2
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.2
    params_phys.chr_wsc = 0.0

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_RANGED,params_phys)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.RANGED, info.hitslanded)

    mob:entityAnimationPacket("ids0")
    mob:setLocalVar("lanceTime", mob:getBattleTime())
    mob:setLocalVar("lanceOut", 0)
    target:AnimationSub(3)

    -- Cannot be resisted
    target:addStatusEffect(tpz.effect.TERROR, 0, 0, 20)

    target:takeDamage(dmg, mob, tpz.attackType.RANGED, tpz.damageType.RANGED)
    return dmg
end
