---------------------------------------------
-- Pyric Bulwark
--
-- Description: Grants a Physical Shield effect for a time.
-- Type: Enhancing
--
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)

  if (mob:getFamily() == 316) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1796) then
        return 0
    else
        return 1
    end
  end
   -- TODO: Used only when second/left head is alive (animationsub 0 or 1)
   if (mob:AnimationSub() < 1) then
      return 0
   else
      return 1
   end
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.PHYSICAL_SHIELD
    skill:setMsg(MobBuffMove(mob, typeEffectOne, 1, 0, 45))
    local effect1 = mob:getStatusEffect(typeEffectOne)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)
    if (mob:getFamily() == 313) then -- Tinnin follows this up immediately with Nerve Gas
        mob:useMobAbility(1580)
    end

    return typeEffectOne
end
