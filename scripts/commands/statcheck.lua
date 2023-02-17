function onTrigger(player)
    local targ = player:getCursorTarget();
    if (targ ~= nil)  then
        if (targ:isMob() or targ:isPet()) then
            local str = targ:getStat(tpz.mod.STR)
            local dex = targ:getStat(tpz.mod.DEX)
            local vit = targ:getStat(tpz.mod.VIT)
            local agi = targ:getStat(tpz.mod.AGI)
            local int = targ:getStat(tpz.mod.INT)
            local mnd = targ:getStat(tpz.mod.MND)
            local chr = targ:getStat(tpz.mod.CHR)

            local acc = targ:getACC()
            local eva = targ:getEVA()
            local att = targ:getStat(tpz.mod.ATT)
            local def = targ:getStat(tpz.mod.DEF)
            local matt = targ:getMod(tpz.mod.MATT)
            local macc = targ:getMod(tpz.mod.MACC)
            local mdef = targ:getMod(tpz.mod.MDEF)

            local fire = targ:getMod(tpz.mod.SDT_FIRE)
            local ice = targ:getMod(tpz.mod.SDT_ICE)
            local wind = targ:getMod(tpz.mod.SDT_WIND)
            local earth = targ:getMod(tpz.mod.SDT_EARTH)
            local water = targ:getMod(tpz.mod.SDT_WATER)
            local thunder = targ:getMod(tpz.mod.SDT_THUNDER)
            local dark = targ:getMod(tpz.mod.SDT_DARK)
            local light = targ:getMod(tpz.mod.SDT_LIGHT)

            local amnesia = targ:getMod(tpz.mod.EEM_AMNESIA)
            local virus = targ:getMod(tpz.mod.EEM_VIRUS)
            local silence = targ:getMod(tpz.mod.EEM_SILENCE)
            local gravity = targ:getMod(tpz.mod.EEM_GRAVITY)
            local stun = targ:getMod(tpz.mod.EEM_STUN)
            local lightSleep = targ:getMod(tpz.mod.EEM_LIGHT_SLEEP)
            local charm = targ:getMod(tpz.mod.EEM_CHARM)
            local paralyze = targ:getMod(tpz.mod.EEM_PARALYZE)
            local bind = targ:getMod(tpz.mod.EEM_BIND)
            local slow = targ:getMod(tpz.mod.EEM_SLOW)
            local petrify = targ:getMod(tpz.mod.EEM_PETRIFY)
            local terror = targ:getMod(tpz.mod.EEM_TERROR)
            local poison = targ:getMod(tpz.mod.EEM_POISON)
            local darkSleep = targ:getMod(tpz.mod.EEM_DARK_SLEEP)
            local blind = targ:getMod(tpz.mod.EEM_BLIND)

            local hthres = targ:getMod(tpz.mod.HTHRES)
            local pierceres = targ:getMod(tpz.mod.PIERCERES)
            local rangedres = targ:getMod(tpz.mod.RANGEDRES)
            local impactres = targ:getMod(tpz.mod.IMPACTRES)
            local slashres = targ:getMod(tpz.mod.SLASHRES)
            local spdefdown = targ:getMod(tpz.mod.SPDEF_DOWN)
       
            player:PrintToPlayer(string.format("%s Stats 0: MJOB: %i, SJOB: %i, HP: %i, MP: %i", targ:getName(), targ:getMainJob(), targ:getSubJob(), targ:getMaxHP(), targ:getMaxMP()))
            player:PrintToPlayer(string.format("%s Stats 1: LVL: %i, SLVL: %i, DELAY: %i, ACC: %i, EVA: %i, ATT: %i, DEF: %i, MATT: %i, MACC: %i, MDEF: %i ", targ:getName(), targ:getMainLvl(), targ:getSubLvl(), targ:getDelay(), acc,eva,att,def,matt,macc,mdef))
            player:PrintToPlayer(string.format("%s Stats 2: STR: %i, DEX: %i, VIT: %i, AGI: %i, INT: %i, MND: %i, CHR: %i", targ:getName(), str,dex,vit,agi,int,mnd,chr))
            player:PrintToPlayer(string.format("%s Stats 3: Fire: %i, Ice: %i, Wind: %i, Earth: %i, Water: %i, Thunder: %i, Dark: %i, Light: %i", targ:getName(), fire, ice, wind, earth, water, thunder, dark, light))
            player:PrintToPlayer(string.format("%s Stats 4: Amnesia: %i, Virus: %i, Silence: %i, Gravity: %i, Stun: %i, Sleep(L): %i, Charm: %i, Paralyze: %i", targ:getName(), amnesia, virus, silence, gravity, stun, lightSleep, charm, paralyze))
            player:PrintToPlayer(string.format("%s Stats 5: Bind: %i, Slow: %i, Petrify: %i, Terror: %i, Poison: %i, Sleep(D): %i, Blind: %i", targ:getName(), bind, slow, petrify, terror, poison, darkSleep, blind))
            player:PrintToPlayer(string.format("%s Stats 6: hthres: %i, pierceres: %i, rangedres: %i, impactres: %i, slashres: %i, spdefdown: %i", targ:getName(), hthres, pierceres, rangedres, impactres, slashres, spdefdown))
        else
            player:PrintToPlayer("Must select a mob using in game cursor first.");
        end
    end
end
---------------------------------------------------------------------------------------------------
-- func: statcheck
-- desc: Prints the Stats of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = ""
};