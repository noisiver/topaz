---------------------------------------------
-- Summer Breeze
--
-- Description: AoE full status effect removal. (If nothing to remove, it instead gains Regain.)
-- Regain cannot be dispelled.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end
function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.REGAIN

    if utils.hasDispellableEffect(target) then
        return MobSelfDispelMove(mob, skill)
    else
        skill:setMsg(MobBuffMove(mob, tpz.effect.REGAIN, 10, 3, 300))
        local effect1 = mob:getStatusEffect(typeEffect)
        effect1:unsetFlag(tpz.effectFlag.DISPELABLE)
        return tpz.effect.REGAIN
    end
end
