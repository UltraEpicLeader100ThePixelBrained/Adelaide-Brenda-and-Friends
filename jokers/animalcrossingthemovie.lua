
SMODS.Joker{ --Animal Crossing: The Movie
    key = "animalcrossingthemovie",
    config = {
        extra = {
            dollars0 = 30
        }
    },
    loc_txt = {
        ['name'] = 'Animal Crossing: The Movie',
        ['text'] = {
            [1] = 'Sell this joker to gain {C:gold}$30{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 30
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(30), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}