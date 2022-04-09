---------------------------------------------------
-- Heavy Armature
-- Adds buffs Haste, Shell, Protect, Blink
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local AnimationSub = mob:AnimationSub()
    if mob:getPool() == 243 and AnimationSub > 0 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    -- Not much info on how much haste this gives. Supposed to be "high". Went with Magic Haste Cap
    MobBuffMove(mob, tpz.effect.HASTE, 3200, 0, 300)
    MobBuffMove(mob, tpz.effect.PROTECT, 250, 0, 300)
    MobBuffMove(mob, tpz.effect.SHELL, 50, 0, 300)
    MobBuffMove(mob, tpz.effect.BLINK, math.random(10, 25), 0, 300)
    skill:setMsg(MobBuffMove(mob, tpz.effect.PROTECT, 250, 0, 300))

    return tpz.effect.BLINK
end
