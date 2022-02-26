---------------------------------------------------------------------------------------------------
-- func: godmode
-- desc: Toggles god mode on the player, granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    if (player:getCharVar("GodMode") == 0) then
        -- Toggle GodMode on..
        player:setCharVar("GodMode", 1)

        -- Add bonus effects to the player..
        player:addStatusEffect(tpz.effect.MAX_HP_BOOST, 1000, 0, 0)
        player:addStatusEffect(tpz.effect.MAX_MP_BOOST, 1000, 0, 0)
        player:addStatusEffect(tpz.effect.MIGHTY_STRIKES, 1, 0, 0)
        player:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 0)
        player:addStatusEffect(tpz.effect.CHAINSPELL, 1, 0, 0)
        player:addStatusEffect(tpz.effect.PERFECT_DODGE, 1, 0, 0)
        player:addStatusEffect(tpz.effect.INVINCIBLE, 1, 0, 0)
        player:addStatusEffect(tpz.effect.ELEMENTAL_SFORZO, 1, 0, 0)
        player:addStatusEffect(tpz.effect.MANAFONT, 1, 0, 0)
        player:addStatusEffect(tpz.effect.REGAIN, 300, 0, 0)
        player:addStatusEffect(tpz.effect.REFRESH, 99, 0, 0)
        player:addStatusEffect(tpz.effect.REGEN, 99, 0, 0)
        player:addStatusEffect(tpz.effect.FEALTY, 1, 0, 0)

        -- Add bonus mods to the player..
        player:addMod(tpz.mod.RACC, 2500)
        player:addMod(tpz.mod.RATT, 2500)
        player:addMod(tpz.mod.ACC, 2500)
        player:addMod(tpz.mod.ATT, 2500)
        player:addMod(tpz.mod.MATT, 2500)
        player:addMod(tpz.mod.MACC, 2500)
        player:addMod(tpz.mod.RDEF, 2500)
        player:addMod(tpz.mod.DEF, 2500)
        player:addMod(tpz.mod.MDEF, 2500)
        player:setMod(tpz.mod.MEVA, 2500)

        -- Heal the player from the new buffs..
        player:addHP( 50000 )
        player:setMP( 50000 )
    else
        -- Toggle GodMode off..
        player:setCharVar("GodMode", 0)

        -- Remove bonus effects..
        player:delStatusEffectSilent(tpz.effect.MAX_HP_BOOST)
        player:delStatusEffectSilent(tpz.effect.MAX_MP_BOOST)
        player:delStatusEffectSilent(tpz.effect.MIGHTY_STRIKES)
        player:delStatusEffectSilent(tpz.effect.HUNDRED_FISTS)
        player:delStatusEffectSilent(tpz.effect.CHAINSPELL)
        player:delStatusEffectSilent(tpz.effect.PERFECT_DODGE)
        player:delStatusEffectSilent(tpz.effect.INVINCIBLE)
        player:delStatusEffectSilent(tpz.effect.ELEMENTAL_SFORZO)
        player:delStatusEffectSilent(tpz.effect.MANAFONT)
        player:delStatusEffectSilent(tpz.effect.REGAIN)
        player:delStatusEffectSilent(tpz.effect.REFRESH)
        player:delStatusEffectSilent(tpz.effect.REGEN)
        player:delStatusEffectSilent(tpz.effect.FEALTY)
        player:delStatusEffectSilent(tpz.effect.POISON)
        player:delStatusEffectSilent(tpz.effect.CURSE)

        -- Remove bonus mods..
        player:delMod(tpz.mod.RACC, 2500)
        player:delMod(tpz.mod.RATT, 2500)
        player:delMod(tpz.mod.ACC, 2500)
        player:delMod(tpz.mod.ATT, 2500)
        player:delMod(tpz.mod.MATT, 2500)
        player:delMod(tpz.mod.MACC, 2500)
        player:delMod(tpz.mod.RDEF, 2500)
        player:delMod(tpz.mod.DEF, 2500)
        player:delMod(tpz.mod.MDEF, 2500)
        player:setMod(tpz.mod.MEVA, 240)
    end
end
