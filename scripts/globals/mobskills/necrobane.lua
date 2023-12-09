---------------------------------------------
-- Necrobane
-- Inflicts Paralysis + Curse.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Normal Dvegr for learning  Bilgestorm
    if (mob:getPool() == 9124) then
        return 0
    end

  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1840) then
        return 0
    else
        return 1
    end
  end
  if(mob:getFamily() == 91) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1839) then
        return 0
    else
        return 1
    end
  end

  return 0
end

function onMobWeaponSkill(target, mob, skill)

    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 50, 0, 300)
    skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.CURSE_I, 33, 0, 300))
    return dmg
end
