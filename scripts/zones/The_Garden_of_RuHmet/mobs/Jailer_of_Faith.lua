-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Jailer of Faith
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(145)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.REFRESH, 50)
    -- Change animation to open
    mob:AnimationSub(2)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MANAFONT, hpp = math.random(70, 75)},
            {id = tpz.jsa.MANAFONT, hpp = math.random(40, 45)},
            {id = tpz.jsa.MANAFONT, hpp = math.random(20, 25)},
        },
    })
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
end

function onMobFight(mob)
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed
    local randomTime = math.random(45, 180)
    local changeTime = mob:getLocalVar("changeTime")

    if mob:getBattleTime() - changeTime > randomTime then
        -- Change close to open.
        if (mob:AnimationSub() == 1) then
            mob:AnimationSub(2)
        else -- Change from open to close
            mob:AnimationSub(1)
        end
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end
end

function onMonsterMagicPrepare(mob,target)
    local spells = {162, 191, 357, 365}
    local spell = spells[math.random(#spells)]
    if (spell == 162 or spell == 191) and mob:hasStatusEffect(tpz.effect.MANAFONT) then
        spell = 211 -- Quake II
    end
    return spell
end

function onMobDeath(mob)
end

function onMobDespawn(mob)
    -- Move QM to random location
    local pos = math.random(1, 5)
    GetNPCByID(ID.npc.JAILER_OF_FAITH_QM):setPos(ID.npc.JAILER_OF_FAITH_QM_POS[pos][1], ID.npc.JAILER_OF_FAITH_QM_POS[pos][2], ID.npc.JAILER_OF_FAITH_QM_POS[pos][3])
end
