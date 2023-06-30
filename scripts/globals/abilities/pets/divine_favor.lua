---------------------------------------------
-- Divine Favor
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill, summoner)
    local params = {}
    params.NO_TP_CONSUMPTION = true

    if (target:isPC()) then
        target:sendRaise(3)
        target:addStatusEffect(tpz.effect.RERAISE, 3, 0, 0) -- Infinite duration
    end

    master:setMP(0)

    return tpz.effect.RERAISE -- TODO: Test
end
