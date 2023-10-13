-----------------------------------
-- Area: Talacca Cove
-- MOB: Qultada
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs");
-----------------------------------

function onMobInitialize(mob)
    mob:addListener("WEAPONSKILL_TAKE", "SHAMARHAAN_WEAPONSKILL_TAKE", function(target, attacker, skillId, tp, action)
        if attacker:getID() ~= ID.mob.QULTADA then
            target:messageText(target, ID.text.QULTADA_THINGS_HEAT_UP)
        end
    end)

    mob:addListener("WEAPONSKILL_USE", "SHAMARHAAN_WEAPONSKILL_USE", function(mob, target, wsid, tp, action)
        if wsid == 39 or wsid == 42 then -- Sword WS
            mob:messageText(mob, ID.text.QULTADA_ANTE_UP)
        end
        if wsid == 212 or wsid == 3253 then -- Marksmanship WS
            mob:messageText(mob, ID.text.QULTADA_LETS_TRY_YOUR_LUCK)
        end
    end)
end

function onMobSpawn(mob)
    mob:setLocalVar("special_threshold", math.random(50,60))
end

function onMobRoam(mob)
end

function onMobEngaged(mob, target)
    mob:messageText(mob, ID.text.QULTADA_CARDS_BEEN_DEALT + math.random(0, 2))
    mob:setLocalVar("engaged", target:getID())
    mob:setLocalVar("quick_draw", os.time() + math.random(5, 10))
    mob:setLocalVar("wild_card", os.time() + math.random(45, 60))
end

function onMobDisengaged(mob)
    engagedID = mob:getLocalVar("engaged")
    if engagedID ~= 0 then
        player = GetPlayerByID(engagedID)
        if player:getHP() == 0 then
            mob:showText(mob, ID.text.QULTADA_DENT_MY_TRICORNE)
        end
    end
end

function onMobFight(mob,target)
    if mob:getLocalVar("quick_draw") <= os.time() then
        -- Randomly use one of the Quick Draw shots
        mob:useMobAbility(2009 + math.random(0, 7), target)
        mob:messageText(mob, ID.text.QULTADA_THINK_YOU_CAN)
        mob:setLocalVar("quick_draw", os.time() + math.random(30, 40))
    end

    if (mob:getHPP() < 95) then
        -- Uses Wild Card every 45-60s
        if mob:getLocalVar("wild_card") <= os.time() then
            mob:messageText(mob, ID.text.QULTADA_BEHOLD_MY_TRUMP_CARD)
            mob:useMobAbility(tpz.jsa.WILD_CARD_QULTADA)
            mob:setLocalVar("wild_card", os.time() + math.random(45, 60))
        end
    end

    if mob:getLocalVar("dialog") == 1 and mob:getBattleTime() >= 120 then
        mob:showText(mob, ID.text.QULTADA_TOO_BAD)
        mob:setLocalVar("dialog", 2)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    mob:messageText(mob, ID.text.QULTADA_NOT_BAD)
end

function onMobWeaponSkill(target, mob, skill, action)
    if skill:getID() == 114 then
        -- Currently only made to be used with Qultada in Breaking the Bonds of Fate (COR Limit Break)
        -- It is unclear if this has any effect whatsoever so for now it is just used for animations and speech
        local roll = math.random(1, 6)
        local previousRoll = mob:getLocalVar("corsairRollTotal")
        action:speceffect(mob:getID(), roll)
        roll = roll + previousRoll
        mob:setLocalVar("corsairRollTotal", roll)
        return roll
    elseif skill:getID() == tpz.jsa.WILD_CARD_QULTADA then
        -- It appears that Qultada always rolls a 4 which grants 3000TP and resets Job Abilities
        mob:setLocalVar("quick_draw", os.time() + 3)
        return 0
    end
end
