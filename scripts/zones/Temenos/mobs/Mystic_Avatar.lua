-----------------------------------
-- Area: Temenos E T
--  Mob: Mystic Avatar
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

function onMobSpawn(mob)
    local mobID = mob:getID()
    mob:setMod(tpz.mod.SDT_FIRE, 100)
    mob:setMod(tpz.mod.SDT_ICE, 100)
    mob:setMod(tpz.mod.SDT_WIND, 100)
    mob:setMod(tpz.mod.SDT_EARTH, 100)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_WATER, 100)
    mob:setMod(tpz.mod.SDT_LIGHT, 100)
    mob:setMod(tpz.mod.SDT_DARK, 100)
    if mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        mob:setMod(tpz.mod.SDT_FIRE, 50)
        mob:setMod(tpz.mod.SDT_ICE, 50)
        mob:setMod(tpz.mod.SDT_WIND, 50)
        mob:setMod(tpz.mod.SDT_EARTH, 50)
        mob:setMod(tpz.mod.SDT_THUNDER, 50)
        mob:setMod(tpz.mod.SDT_WATER, 50)
        mob:setMod(tpz.mod.SDT_LIGHT, 50)
        mob:setMod(tpz.mod.SDT_DARK, 100)
        mob:addMod(tpz.mod.EVA, 50)
    end
end

function onMobEngaged(mob, target)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobID = mob:getID()
        local battlefield = mob:getBattlefield()
        if mobID <= ID.mob.TEMENOS_E_MOB[6] + 4 then
            local floor = ((mobID - (ID.mob.TEMENOS_E_MOB[1] + 4)) / 9) + 1
            local crateMask = battlefield:getLocalVar("crateMaskF" .. floor)
            if crateMask == 0 then
                tpz.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_E_GATE[floor])
            end
        elseif mobID >= ID.mob.TEMENOS_C_MOB[2]+9 then
            local element_offset = mobID - ID.mob.TEMENOS_C_MOB[2]+8
            local partner_offset = element_offset % 6 -- Levithan's partner starts at 0
            GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(tpz.mod.SDT_FIRE - 1 + element_offset, +50)
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2] + 3 + partner_offset):isAlive() then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2] + 3 + partner_offset)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2] + 9 + partner_offset)
            end
        end

    end
end
