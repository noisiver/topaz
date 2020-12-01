---------------------------------------------
-- Sheep Song
-- 15' AoE sleep
---------------------------------------------
--require("scripts/globals/monstertpmoves")
--require("scripts/globals/settings")
--require("scripts/globals/status")
---------------------------------------------

--function onMobSkillCheck(target, mob, skill)
   -- return 0
--end

--function onMobWeaponSkill(target, mob, skill)
   -- local typeEffect = tpz.effect.SLEEP_I

    --skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 20))

   -- return typeEffect
--end


---------------------------------------------
-- Sheep Song
-- 15' AoE sleep
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end


function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLEEP_I
    local dINT = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local params = {}
    params.diff = nil
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = typeEffect
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 180 * resist

    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(typeEffect, 1, 0, duration)) then   --experimental
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end


