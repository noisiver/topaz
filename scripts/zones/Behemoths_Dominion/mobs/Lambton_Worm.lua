-----------------------------------
-- Area: Behemoth's Dominion
--  Mob: Lambton Worm
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(150)
    mob:setMod(tpz.mod.ATT, 475)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 350)
	mob:setMod(tpz.mod.VIT, 50)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.PHYS_ABSORB, 0)
    mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobRoam(mob)
    mob:setMod(tpz.mod.PHYS_ABSORB, 0)
    mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobFight(mob, target)
    local dv = mob:getLocalVar("dv")
    local sg = mob:getLocalVar("sg")
    local av = mob:getLocalVar("av")
    local ep = mob:getLocalVar("ep")
    local void = mob:getLocalVar("void")
    local des = mob:getLocalVar("des")
    
    if dv ~= 0 then
        mob:useMobAbility(2187) -- dustvoid
        mob:setLocalVar("dv", 0)
    end

    if sg ~= 0 then
        mob:useMobAbility(2188) -- slaverous_gale
        mob:setLocalVar("sg", 0)
    end

    if av ~= 0 then
        mob:useMobAbility(2189) -- aeolian_void
        mob:setLocalVar("av", 0)
    end

    if ep ~= 0 then
        mob:useMobAbility(2190) -- extreme_purgation
        mob:setLocalVar("ep", 0)
    end

    if void ~= 0 then
        mob:useMobAbility(2192) -- doomvoid
        mob:setLocalVar("void", 0)
    end

    if des ~= 0 then
        mob:useMobAbility(2191) -- desiccation
        mob:setLocalVar("des", 0)
    end


	local AbsorbTime = mob:getLocalVar("AbsorbTime")
	local BattleTime = mob:getBattleTime()

	if AbsorbTime == 0 then
		mob:setLocalVar("AbsorbTime", BattleTime + math.random(105, 120))
	elseif BattleTime >= AbsorbTime then
        mob:setMod(tpz.mod.PHYS_ABSORB, 2000)
        mob:setMod(tpz.mod.MAGIC_ABSORB, 2000)
        mob:useMobAbility(2192) -- Doomvoid
        mob:setLocalVar("AbsorbTime", BattleTime + math.random(105, 120))
        mob:timer(5000, function(mob) -- Absorbs all damage for 5 seconds, then draws in
            for _,player in ipairs(mob:getEnmityList()) do
                mob:drawIn(target)
            end
            mob:setMod(tpz.mod.PHYS_ABSORB, 0)
            mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
        end)
	end
end

function onMobDisengage(mob)
	mob:setLocalVar("AbsorbTime", 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.LAMBTON_WORM_DESEGMENTER)
end
