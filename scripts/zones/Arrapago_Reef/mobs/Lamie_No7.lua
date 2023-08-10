-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamie_No7
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins ={require("scripts/mixins/weapon_break")}
------------------------------
function onMobSpawn(mob)
	mob:setDamage(125) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:AnimationSub(12)
end

function onMobEngaged(mob)
    mob:setLocalVar("rolldice", math.random(15, 30))
    mob:setLocalVar("twohourtime", math.random(45, 90))
end

function onMobFight(mob, target)
    local roll = math.random(1, 6)
	local rolldice = mob:getLocalVar("rolldice")
    local twohourtime = mob:getLocalVar("twohourtime")
    local battletime = mob:getBattleTime()
	if battletime >= rolldice then
        if roll == 1 then
        	target:PrintToPlayer("1",0,"Lamie No.7")
            if mob:AnimationSub() == 12 then
                mob:useMobAbility(1752) -- gusting_gouge
            elseif mob:AnimationSub() == 1 then
                 mob:useMobAbility(1753) -- hysteric_barrage
            end
        elseif roll == 2 then
        	target:PrintToPlayer("2",0,"Lamie No.7")
            if mob:AnimationSub() == 12 then
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
            elseif mob:AnimationSub() == 1 then
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
            end
        elseif roll == 3 then
        	target:PrintToPlayer("3",0,"Lamie No.7")
            if mob:AnimationSub() == 12 then
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
            elseif mob:AnimationSub() == 1 then
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
            end
        elseif roll == 4 then
        	target:PrintToPlayer("4",0,"Lamie No.7")
            if mob:AnimationSub() == 12 then
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
            elseif mob:AnimationSub() == 1 then
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
            end
        elseif roll == 5 then
        	target:PrintToPlayer("5",0,"Lamie No.7")
            if mob:AnimationSub() == 12 then
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
            elseif mob:AnimationSub() == 1 then
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
                 mob:useMobAbility(1753) -- hysteric_barrage
            end
        elseif roll == 6 then
        	target:PrintToPlayer("6",0,"Lamie No.7")
            if mob:AnimationSub() == 12 then
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
                mob:useMobAbility(1752) -- gusting_gouge
            elseif mob:AnimationSub() == 1 then
                mob:useMobAbility(1753) -- hysteric_barrage
                mob:useMobAbility(1753) -- hysteric_barrage
                mob:useMobAbility(1753) -- hysteric_barrage
                mob:useMobAbility(1753) -- hysteric_barrage
                mob:useMobAbility(1753) -- hysteric_barrage
                mob:useMobAbility(1753) -- hysteric_barrage
            end
        end
        mob:setLocalVar("rolldice", battletime + math.random(45, 60))
    end

    if battletime >= twohourtime then
        mob:useMobAbility(1934) -- Wild Card
	    mob:addTP(3000)
        mob:setLocalVar("twohourtime", battletime + math.random(60, 90))
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
end