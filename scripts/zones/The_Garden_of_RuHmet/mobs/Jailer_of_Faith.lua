-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Jailer of Faith
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(155)
    mob:setMod(tpz.mod.ATT, 435) -- 500
    mob:setMod(tpz.mod.DEF, 412) -- 450
    mob:setMod(tpz.mod.EVA, 236) -- 275
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
        mob:setLocalVar("Form", 0)
        mob:setLocalVar("ClosedTime", 0)
        mob:setLocalVar("OpenTime", 0)
end

function onMobFight(mob)
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed
    local OpenTime = mob:getLocalVar("OpenTime")
    local ClosedTime = mob:getLocalVar("ClosedTime")
    local Form = mob:getLocalVar("Form")
    local BattleTime = mob:getBattleTime()

    if BattleTime > ClosedTime and form == 0 then
        -- Change close to open.
        mob:AnimationSub(2)
        mob:setMod(tpz.mod.DMG, 12.5) 
        mob:setLocalVar("Form", 1)
        mob:setLocalVar("OpenTime", 180)
    end
    if BattleTime > ClosedTime and form == 1 then -- Change from open to close
        mob:AnimationSub(1)
        mob:setMod(tpz.mod.DMG, -25) 
        mob:setLocalVar("Form", 0)
        mob:setLocalVar("ClosedTime", 60)
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
