-----------------------------------
-- Area: Open Sea Route to Al Zahbi (Fished)
--  Mob: Northern Piranu
-----------------------------------
mixins = {require("scripts/mixins/families/orobon")}
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(120)
	mob:setMod(tpz.mod.EVA, 337)
	mob:setMod(tpz.mod.VIT, 100)
    mob:setMod(tpz.mod.MDEF, 25)
    mob:setMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMod(tpz.mod.REGAIN, 50)
	mob:setLocalVar("Message", 0)
    mob:setLocalVar("FeelersBreakChance", 50)
end

function onMobRoam(mob)
end

function onMobEngaged(mob)
end

function onMobFight(mob, target)
	local Message = mob:getLocalVar("Message")
	local MessageTwo = mob:getLocalVar("MessageTwo")
	local FrenzyTime = mob:getLocalVar("FrenzyTime")
	local BattleTime = mob:getBattleTime()
    if mob:AnimationSub() == 1 then
        mob:setMod(tpz.mod.REGAIN, 150)
		mob:setMod(tpz.mod.HASTE_MAGIC, 5000)
        if Message == 0 then
            local zonePlayers = mob:getZone():getPlayers()
            for _, zonePlayer in pairs(zonePlayers) do
                zonePlayer:PrintToPlayer("The Northern Piranu goes into a frenzy!",0,"Northern Piranu")
            end
		    mob:setLocalVar("Message", 1)
		    mob:setLocalVar("MessageTwo", 0)
            mob:setLocalVar("FrenzyTime", BattleTime + math.random(90, 120))
        end
    end
    if BattleTime >= FrenzyTime and Message == 1 then
        if MessageTwo == 0 then
            local zonePlayers = mob:getZone():getPlayers()
            for _, zonePlayer in pairs(zonePlayers) do
                zonePlayer:PrintToPlayer("The Northern Piranus seems to have calmed down.",0,"Northern Piranu")
            end
		    mob:setLocalVar("MessageTwo", 1)
        end
        mob:setMod(tpz.mod.REGAIN, 50)
		mob:setMod(tpz.mod.HASTE_MAGIC, 0)
        mob:AnimationSub(0)
		mob:setLocalVar("Message", 0)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end