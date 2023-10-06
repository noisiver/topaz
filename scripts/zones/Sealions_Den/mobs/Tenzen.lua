-----------------------------------
-- Area: Sealion's Den
--  NPC: Tenzen
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function defeated(mob)
    mob:showText(mob, 7913) -- I am defeated... My honor is as dust before the wind...
    local mobId = mob:getID()
    local makki = GetMobByID(mobId + 1)
    makki:showText(makki, 7920) -- What? Nooo!
    local kukki = GetMobByID(mobId + 2)
    kukki:showText(kukki, 7926) -- We're doomed!
    local cheru = GetMobByID(mobId + 3)
    cheru:showText(cheru, 7932) -- Our samurai life is over!
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setLocalVar("progress", 100)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 10)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobEngaged(mob,target)
    mob:SetAutoAttackEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:setLocalVar("nextmsg", math.random(3, 4))
    mob:showText(mob, 7911) -- You will fall to my blade!
    local mobId = mob:getID()

    local makki = GetMobByID(mobId + 1)
    makki:showText(makki, 7915) -- Samurai Sky Pirate Power!
    local kukki = GetMobByID(mobId + 2)
    kukki:showText(kukki, 7921) -- Chebukki Sumo Siblings!
    local cheru = GetMobByID(mobId + 3)
    cheru:showText(cheru, 7927) -- Feel the fear! The Chebukkis are here!

    -- three tarus fight with tenzen
    local offset = mobId - ID.mob.WARRIORS_PATH_OFFSET
    if offset >= 0 and offset <= 8 then
        for i = mobId + 1, mobId + 3 do
            GetMobByID(i):updateEnmity(target)
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 730 then
        mob:setLocalVar("meikyo_shisui", 1)
        mob:setLocalVar("meikyo_shisui_time", mob:getBattleTime())
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
    end
end

function onMobFight(mob)
    local now = mob:getBattleTime()
    local nextmsg = mob:getLocalVar("nextmsg")
    local progress = mob:getLocalVar("progress")
    local meikyoShisui = mob:getLocalVar("meikyo_shisui")
    local meikyoShisuiTime = mob:getLocalVar("meikyo_shisui_time") + meikyoShisui * 4

    if mob:getHPP() <= 15 then
        defeated(mob)
        mob:getBattlefield():win()
        return
    end

    if meikyoShisui ~= 0 and now >= meikyoShisuiTime then
    -- 2h after 5 minutes with about 4.5 seconds between each WS
    -- 2h = Amatsu: Hanaikusa > Amatsu: Torimai > Amatsu: Kazakiri > Amatsu: Tsukikage > Skillchain: Cosmic Elucidation (fight ends)
        if meikyoShisui == 1 then
            mob:useMobAbility(1394)
            meikyoShisui = 2
        elseif meikyoShisui == 2 then
            mob:useMobAbility(1390)
            meikyoShisui = 3
        elseif meikyoShisui == 3 then
            mob:useMobAbility(1391)
            if progress >= 400 then
                meikyoShisui = 4
            else
                meikyoShisui = 0
            end
        elseif meikyoShisui == 4 then
            mob:useMobAbility(1395)
            meikyoShisui = 5
        elseif meikyoShisui == 5 then
            mob:useMobAbility(1399)
            meikyoShisui = 6
        elseif meikyoShisui == 6 then
            mob:showText(mob, 7912) -- Tenzen: Your life is but a fading dream...
            for _, player in pairs(mob:getBattlefield():getPlayers()) do
                player:showText(player, 7878) -- You are overwhelmed by Tenzen's Cosmic Elucidation.
            end
            mob:getBattlefield():lose()
        end
        if meikyoShisui == 0 then
            mob:SetAutoAttackEnabled(true)
            mob:SetMobAbilityEnabled(true)
        end
        mob:setLocalVar("meikyo_shisui", meikyoShisui)
    elseif now >= progress then
        if progress == 100 then
            mob:showText(mob, 7914) -- Tenzen uses a shogun rice ball....
            mob:useMobAbility(1398)
            mob:setLocalVar("progress", 105)
        elseif progress == 105 then
            mob:useMobAbility(730)
            mob:setLocalVar("progress", 200)
        elseif progress == 200 then
            mob:useMobAbility(730)
            mob:setLocalVar("progress", 300)
        elseif progress == 300 then
            mob:useMobAbility(730)
            mob:setLocalVar("progress", 400)
        end
    end

    if now > nextmsg then
        local offset = math.random(2, 4)
        mob:setLocalVar("nextmsg", now + math.random(4, 5))
        for i = ID.mob.WARRIORS_PATH_OFFSET + 1, ID.mob.WARRIORS_PATH_OFFSET + 3 do
            local taru = GetMobByID(i)
            taru:showText(taru, taru:getLocalVar("text") + offset)
        end
    end
end

function onMagicHit(caster, target, spell)
    target:setLocalVar("nextmsg", target:getBattleTime() + math.random(4, 5))
    local mobId = target:getID()
    local makki = GetMobByID(mobId + 1)
    makki:showText(makki, 7916) -- Lord Tenzen is invincible!
    local kukki = GetMobByID(mobId + 2)
    kukki:showText(kukki, 7922) -- Eye of the tiger!
    local cheru = GetMobByID(mobId + 3)
    cheru:showText(cheru, 7928) -- Go for the eyes! The eyes!
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller then
        defeated(mob)
    end
end
