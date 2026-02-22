
SMODS.Consumable {
    key = 'gravityisaharness',
    set = 'Tarot',
    pos = { x = 3, y = 0 },
    config = { 
        extra = {
            dollars0 = 5   
        } 
    },
    loc_txt = {
        name = 'Artificial Gravity',
        text = {
            [1] = 'Flips all of your jokers and gives you {C:money}x$5{} before flipping them back over.'
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
        if #G.jokers.cards > 0 then
            for _, joker in ipairs(G.jokers.cards) do
                joker:flip()
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars * 5
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "X"..tostring(5).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
        if #G.jokers.cards > 0 then
            for _, joker in ipairs(G.jokers.cards) do
                joker:flip()
            end
        end
        return {
            message = "Flip!",
            extra = {
                message = "Flip!",
                colour = G.C.ORANGE
            }
        }
    end,
    can_use = function(self, card)
        return true
    end
}