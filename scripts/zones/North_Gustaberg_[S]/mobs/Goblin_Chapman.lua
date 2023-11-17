-----------------------------------
-- Area: North Gustaberg [S]
--  Mob: Goblin Chapman (BLM)
-----------------------------------
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    SetDropRate(1036, 4769, 50)
    SetDropRate(1036, 4770, 50)
    SetDropRate(1036, 4798, 50)
    SetDropRate(1036, 4799, 50)
    SetDropRate(1036, 4818, 50)
end

function onMobEngaged(mob, target)
    SetDropRate(1036, 4769, 50)
    SetDropRate(1036, 4770, 50)
    SetDropRate(1036, 4798, 50)
    SetDropRate(1036, 4799, 50)
    SetDropRate(1036, 4818, 50)
end

function onMobFight(mob, target)
    SetDropRate(1036, 4769, 50)
    SetDropRate(1036, 4770, 50)
    SetDropRate(1036, 4798, 50)
    SetDropRate(1036, 4799, 50)
    SetDropRate(1036, 4818, 50)
end


function onMobDeath(mob, player, isKiller, noKiller)
end

