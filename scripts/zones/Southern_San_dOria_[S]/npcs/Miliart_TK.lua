-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Miliart T.K
-- Type: Sigil NPC
-- !pos 107 1 -31 80
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/campaign")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local notes = player:getCurrency("allied_notes")
    local freelances = 99 -- Faking it for now
    local avilableCiphers = 0 -- 4 = Valaineral, 8 = Adelheid
    local medalRank = getMedalRank(player)
    local bonusEffects = 0 -- 1 = regen, 2 = refresh, 4 = meal duration, 8 = exp loss reduction, 15 = all
    local timeStamp = 0 -- getSigilTimeStamp(player)

    -- if ( medal_rank > 25 and nation controls Throne_Room_S ) then
        -- medal_rank = 32
        -- this decides if allied ring is in the Allied Notes item list.
    -- end

    if (medalRank == 0) then
        player:startEvent(111)
    elseif player:getCampaignAllegiance() == 1 then
        -- Event Option 1 Denotes San d'Oria Allegience --
        player:startEvent(110, 1, notes, freelances, avilableCiphers, medalRank, bonusEffects, timeStamp, 0)
    else
        player:startEvent(110, 0, notes, freelances, avilableCiphers, medalRank, bonusEffects, timeStamp, 0)
    end

end

function onEventUpdate(player, csid, option)
    local itemid = 0
    local canEquip = 2 -- Faking it for now.
    -- 0 = Wrong job, 1 = wrong level, 2 = Everything is in order, 3 or greater = menu exits...
    if (csid == 110 and option >= 2 and option <= 2562) then
        itemid = getSandOriaNotesItem(option)
        player:updateEvent(0, 0, 0, 0, 0, 0, 0, canEquip) -- canEquip(player, itemid));  <- works for sanction NPC, wtf?
    end
end

function onEventFinish(player, csid, option)
    local medalRank = getMedalRank(player)
    if (csid == 110) then
        -- Note: the event itself already verifies the player has enough AN, so no check needed here.
        if (option >= 2 and option <= 2562) then -- player bought item
            if player:getCampaignAllegiance() == 1 then
            -- Pricing for Those Allied with San d'Oria --
            -- currently only "ribbons" rank coded.
                item, price = getSandOriaNotesItemAllegience(option)
                if (npcUtil.giveItem(player, item)) then
                    player:delCurrency("allied_notes", price)
                end
            else 
            -- Pricing For Everyone Else -- 
            -- currently only "ribbons" rank coded.
                item, price = getSandOriaNotesItem(option)
                if (npcUtil.giveItem(player, item)) then
                    player:delCurrency("allied_notes", price)
                end
            end

        -- Please, don't change this elseif without knowing ALL the option results first.
        elseif (option == 1 or option == 4097 or option == 8193 or option == 12289 or option == 16385
        or option == 20481 or option == 24577 or option == 28673 or option == 36865 or option == 40961
        or option == 45057 or option == 49153 or option == 53249 or option == 57345 or option == 61441) then
            local cost = 0
            local power = ( (option - 1) / 4096 )
            local duration = 10800+((15*medalRank)*60) -- 3hrs +15 min per medal (minimum 3hr 15 min with 1st medal)
            local subPower = 35 -- Sets % trigger for regen/refresh. Static at minimum value (35%) for now.

            if (power == 1 or power == 2 or power == 4) then
            -- 1: Regen,  2: Refresh,  4: Meal Duration
                cost = 50
            elseif (power == 3 or power == 5 or power == 6 or power == 8 or power == 12) then
            -- 3: Regen + Refresh,  5: Regen + Meal Duration,  6: Refresh + Meal Duration,
            -- 8: Reduced EXP loss,  12: Meal Duration + Reduced EXP loss
                cost = 100
            elseif (power == 7 or power == 9 or power == 10 or power == 11 or power == 13 or power == 14) then
            -- 7: Regen + Refresh + Meal Duration,  9: Regen + Reduced EXP loss,
            -- 10: Refresh + Reduced EXP loss,  11: Regen + Refresh + Reduced EXP loss,
            -- 13: Regen + Meal Duration + Reduced EXP loss,  14: Refresh + Meal Duration + Reduced EXP loss
                cost = 150
            elseif (power == 15) then
            -- 15: Everything
                cost = 200
            end

            player:delStatusEffectsByFlag(tpz.effectFlag.INFLUENCE, true)
            player:addStatusEffect(tpz.effect.SIGIL, power, 0, duration, 0, subPower, 0)
            player:messageSpecial(ID.text.ALLIED_SIGIL)

            if (cost > 0) then
                player:delCurrency("allied_notes", cost)
            end
        end
    end
end