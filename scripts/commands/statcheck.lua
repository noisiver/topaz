function onTrigger(player)
    local targ = player:getCursorTarget();
    if (targ ~= nil) then
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

        local fire = targ:getMod(tpz.mod.FIREEVA)
        local ice = targ:getMod(tpz.mod.ICEEVA)
        local wind = targ:getMod(tpz.mod.WINDEVA)
        local earth = targ:getMod(tpz.mod.EARTHEVA)
        local water = targ:getMod(tpz.mod.WATEREVA)
        local thunder = targ:getMod(tpz.mod.THUNDEREVA)
        
        local hthres = target:getMod(tpz.mod.HTHRES)
        local pierceres = target:getMod(tpz.mod.PIERCERES)
        local impactres = target:getMod(tpz.mod.IMPACTRES)
        local slashres = target:getMod(tpz.mod.SLASHRES)
        local spdefdown = target:getMod(tpz.mod.SPDEF_DOWN)
       
        player:PrintToPlayer(string.format("%s Stats 0: MJOB: %u, SJOB: %u, HP: %u, MP: %u", targ:getName(), targ:getMainJob(), targ:getSubJob(), targ:getMaxHP(), targ:getMaxMP()))
        player:PrintToPlayer(string.format("%s Stats 1: LVL: %u, SLVL: %u, ACC: %u, EVA: %u, ATT: %u, DEF: %u, MATT: %u, MACC: %u, MDEF: %u ", targ:getName(), targ:getMainLvl(), targ:getSubLvl(), acc,eva,att,def,matt,macc,mdef))
        player:PrintToPlayer(string.format("%s Stats 2: STR: %u, DEX: %u, VIT: %u, AGI: %u, INT: %u, MND: %u, CHR: %u", targ:getName(), str,dex,vit,agi,int,mnd,chr))
        player:PrintToPlayer(string.format("%s Stats 3: Fire: %f, Ice: %f, Wind: %f, Earth: %f, Water: %f, Thunder: %f", targ:getName(), fire, ice, wind, earth, water, thunder))
        player:PrintToPlayer(string.format("%s Stats 4: H2hthres: %h, pierceres: %p, impactres: %i, slashres: %s, spdefdown: %sp", targ:getName(), h2h, pierce, impact, slash, spdef))
    else
        player:PrintToPlayer("Must select a target using in game cursor first.");
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