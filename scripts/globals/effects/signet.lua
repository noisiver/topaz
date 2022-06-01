-----------------------------------
--
--     tpz.effect.SIGNET
--
--   Signet is a a beneficial Status Effect that allows the acquisition of Conquest Points and Crystals
--   from defeated enemies that grant Experience Points.

--   Increased Healing HP
--   No TP loss while resting
--   Bonus experience earned in smaller parties
--   Increased defense and evasion against attacks from your auto-attack target when even match or lower
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    -- Gain +25% more EXP in all zones if above level 55 and below 75
    local level = target:getMainLvl()

    if (level > 54) and (level < 75) then
        target:addMod(tpz.mod.EXP_BONUS, 25)
    end

    target:addLatent(tpz.latent.SIGNET_BONUS, 0, tpz.mod.DEF, 0)
    target:addLatent(tpz.latent.SIGNET_BONUS, 0, tpz.mod.EVA, 0)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:setmod(tpz.mod.EXP_BONUS, 0)
    target:delLatent(tpz.latent.SIGNET_BONUS, 0, tpz.mod.DEF, 0)
    target:delLatent(tpz.latent.SIGNET_BONUS, 0, tpz.mod.EVA, 0)
end
