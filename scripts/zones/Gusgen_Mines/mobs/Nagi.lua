------------------------------
-- Area: Gusgen Mines
--   Nagi
--   !additem 474 
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onSpellPrecast(mob, spell)
    local Guard = GetMobByID(17580445)
    local GuardTwo = GetMobByID(17580446)
    local GuardThree = GetMobByID(17580466)
    local GuardFour = GetMobByID(17580467)
    local GuardFive = GetMobByID(17580468)
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