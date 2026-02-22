
SMODS.Consumable {
    key = 'Forced Feminization',
    set = 'Tarot',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            jacksindeck = 1,
            kingsindeck = 1   
        } 
    },
    loc_txt = {
        name = 'Forced Feminization',
        text = {
            [1] = 'Turns {C:attention}Kings{} & {C:attention}Jacks{} into {C:blue}Queens{}.'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if ((function()
            local count = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if playing_card:get_id() == 11 then
                    count = count + 1
                end
            end
            return to_big(count) == to_big(1)
        end)() and (function()
            local count = 0
            for _, playing_card in pairs(G.playing_cards or {}) do
                if playing_card:get_id() == 13 then
                    count = count + 1
                end
            end
            return to_big(count) == to_big(1)
        end)()) then
            local affected_cards = {}
            local temp_hand = {}
            
        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )
            
            pseudoshuffle(temp_hand, 12345)
            
        for i = 1, math.min(card.ability.extra.jacksindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 11 then count = count + 1 end end; return count end)()) * 1.0000000000000003e+21, #temp_hand) do 
            affected_cards[#affected_cards + 1] = temp_hand[i] 
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #affected_cards do
            local percent = 1.15 - (i - 0.999) / (#affected_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    affected_cards[i]:flip()
                    play_sound('card1', percent)
                    affected_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #affected_cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    assert(SMODS.change_base(affected_cards[i], nil, '12'))
                    return true
                end
            }))
        end
        for i = 1, #affected_cards do
            local percent = 0.85 + (i - 0.999) / (#affected_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    affected_cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    affected_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
        local affected_cards = {}
        local temp_hand = {}
        
    for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )
        
        pseudoshuffle(temp_hand, 12345)
        
    for i = 1, math.min(card.ability.extra.kingsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()) * 1.0000000000000003e+21, #temp_hand) do 
        affected_cards[#affected_cards + 1] = temp_hand[i] 
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            play_sound('tarot1')
            used_card:juice_up(0.3, 0.5)
            return true
        end
    }))
    for i = 1, #affected_cards do
        local percent = 1.15 - (i - 0.999) / (#affected_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                affected_cards[i]:flip()
                play_sound('card1', percent)
                affected_cards[i]:juice_up(0.3, 0.3)
                return true
            end
        }))
    end
    delay(0.2)
    for i = 1, #affected_cards do
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                assert(SMODS.change_base(affected_cards[i], nil, '12'))
                return true
            end
        }))
    end
    for i = 1, #affected_cards do
        local percent = 0.85 + (i - 0.999) / (#affected_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                affected_cards[i]:flip()
                play_sound('tarot2', percent, 0.6)
                affected_cards[i]:juice_up(0.3, 0.3)
                return true
            end
        }))
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            G.hand:unhighlight_all()
            return true
        end
    }))
    delay(0.5)
    return {
        message = "Genderswaped!",
        extra = {
            message = "Genderswaped!",
            colour = G.C.SECONDARY_SET.Tarot
        }
    }
end
end,
can_use = function(self, card)
return (((function()
    local count = 0
    for _, playing_card in pairs(G.playing_cards or {}) do
        if playing_card:get_id() == 11 then
            count = count + 1
        end
    end
    return to_big(count) == to_big(1)
end)() and (function()
    local count = 0
    for _, playing_card in pairs(G.playing_cards or {}) do
        if playing_card:get_id() == 13 then
            count = count + 1
        end
    end
    return to_big(count) == to_big(1)
end)()))
end
}