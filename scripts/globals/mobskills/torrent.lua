---------------------------------------------
--  Torrent
--  Description: Removes all Equipment
--  Type: Magical Enfeebling
--  Ignore Shadows, Single target
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    for i = tpz.slot.MAIN, tpz.slot.BACK do
        target:unequipItem(i)
    end
    target:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, 0xFFFF, 0, 60)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end
