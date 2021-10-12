------------------------------
-- Area: Gusgen Mines
--   Nagi
--   !additem 474 
--	  !pos 220.5291 -39.6000 254.1887
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onSpellPrecast(mob, spell)
	local target = mob:getTarget()
    local Guard = GetMobByID(17580431)
    local GuardTwo = GetMobByID(17580432)
    local GuardThree = GetMobByID(17580433)
    local GuardFour = GetMobByID(17580434)
    local GuardFive = GetMobByID(17580435)
    local X = mob:getXPos()
    local Y = mob:getYPos()
    local Z = mob:getZPos()
    if (spell:getID() == 340) then -- Utsusemi: San
		Guard:spawn()
		GuardTwo:spawn()
		GuardThree:spawn()
		GuardFour:spawn()
		GuardFive:spawn()
		Guard:updateEnmity(target)
		GuardTwo:updateEnmity(target)
		GuardThree:updateEnmity(target)
		GuardFour:updateEnmity(target)
		GuardFive:updateEnmity(target)
		Guard:setPos(X, Y, Z)
		Guard:setSpawn(X, Y, Z)
		GuardTwo:setPos(X, Y, Z)
		GuardTwo:setSpawn(X, Y, Z)
		GuardThree:setPos(X, Y, Z)
		GuardThree:setSpawn(X, Y, Z)
		GuardFour:setPos(X, Y, Z)
		GuardFour:setSpawn(X, Y, Z)
		GuardFive:setPos(X, Y, Z)
		GuardFive:setSpawn(X, Y, Z)
	end
	if (spell:getID() == 339) then -- Utsusemi: Ni
		Guard:spawn()
        GuardTwo:spawn()
        GuardThree:spawn()
        GuardFour:spawn()
		Guard:updateEnmity(target)
        GuardTwo:updateEnmity(target)
        GuardThree:updateEnmity(target)
        GuardFour:updateEnmity(target)
		Guard:setPos(X, Y, Z)
		Guard:setSpawn(X, Y, Z)
		GuardTwo:setPos(X, Y, Z)
		GuardTwo:setSpawn(X, Y, Z)
		GuardThree:setPos(X, Y, Z)
		GuardThree:setSpawn(X, Y, Z)
		GuardFour:setPos(X, Y, Z)
		GuardFour:setSpawn(X, Y, Z)
	end
end

function onMobDeath(mob, player, isKiller)
    DespawnMob(Guard)
    DespawnMob(GuardTwo)
    DespawnMob(GuardThree)
    DespawnMob(GuardFour)
    DespawnMob(GuardFive)
	player:PrintToPlayer("Fighting you was an honor.",0,"Nagi")
  end