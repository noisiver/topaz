function onTrigger(player)
    local targ = player:getCursorTarget();
    if (targ ~= nil) and (targ:isMob()) then
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
        
        local hthres = targ:getMod(tpz.mod.HTHRES)
        local pierceres = targ:getMod(tpz.mod.PIERCERES)
        local impactres = targ:getMod(tpz.mod.IMPACTRES)
        local slashres = targ:getMod(tpz.mod.SLASHRES)
        local spdefdown = targ:getMod(tpz.mod.SPDEF_DOWN)
       
        player:PrintToPlayer(string.format("%s Stats 0: MJOB: %i, SJOB: %i, HP: %i, MP: %i", targ:getName(), targ:getMainJob(), targ:getSubJob(), targ:getMaxHP(), targ:getMaxMP()))
        player:PrintToPlayer(string.format("%s Stats 1: LVL: %i, SLVL: %i, ACC: %i, EVA: %i, ATT: %i, DEF: %i, MATT: %i, MACC: %i, MDEF: %i ", targ:getName(), targ:getMainLvl(), targ:getSubLvl(), acc,eva,att,def,matt,macc,mdef))
        player:PrintToPlayer(string.format("%s Stats 2: STR: %i, DEX: %i, VIT: %i, AGI: %i, INT: %i, MND: %i, CHR: %i", targ:getName(), str,dex,vit,agi,int,mnd,chr))
        player:PrintToPlayer(string.format("%s Stats 3: Fire: %i, Ice: %i, Wind: %i, Earth: %i, Water: %i, Thunder: %i", targ:getName(), fire, ice, wind, earth, water, thunder))
        player:PrintToPlayer(string.format("%s Stats 4: Dark: %i, Light: %i, hthres: %i, pierceres: %i, impactres: %i, slashres: %i, spdefdown: %i", targ:getName(),  dark, light, hthres, pierceres, impactres, slashres, spdefdown))
    else
        player:PrintToPlayer("Must select a mob using in game cursor first.");
    end
end;
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