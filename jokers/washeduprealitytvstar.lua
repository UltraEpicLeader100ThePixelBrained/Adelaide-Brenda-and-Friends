
SMODS.Joker{ --Washed Up Reality TV Star
    key = "washeduprealitytvstar",
    config = {
        extra = {
            dollars0 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Washed Up Reality TV Star',
        ['text'] = {
            [1] = 'Sets Money to {C:money}$0{} at the start of every ante'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.ante_change  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = 0
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(0), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}