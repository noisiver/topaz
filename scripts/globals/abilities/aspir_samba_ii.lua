-----------------------------------
-- Ability: Aspir Samba II
-- Inflicts the next target you strike with Aspir daze, allowing all those engaged in battle with it to drain its MP.
-- Obtained: Dancer Level 60
-- Recast Time: 1:00
-- TP Cost: 25%
-- Duration: 1:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(tpz.effect.TRANCE) then
        player:delTP(120)
    end

    local duration = 120 + player:getMod(tpz.mod.SAMBA_DURATION)
    duration = duration * (100 + player:getMod(tpz.mod.SAMBA_PDURATION))/100
    player:delStatusEffect(tpz.effect.HASTE_SAMBA)
    player:delStatusEffect(tpz.effect.DRAIN_SAMBA)
    player:addStatusEffect(tpz.effect.ASPIR_SAMBA, 2, 0, duration)

end
