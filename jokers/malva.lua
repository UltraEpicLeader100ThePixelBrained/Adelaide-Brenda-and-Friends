
SMODS.Joker{ --Mal^va
    key = "malva",
    config = {
        extra = {
            hands_change = '1',
            hands0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mal^va',
        ['text'] = {
            [1] = 'Gain an extra {C:blue}Hand{} every round.',
            [2] = 'Gain {C:attention}TWO{} extra {C:blue}Hands{} if {C:attention}Java{} is in play.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_java" then 
                        return true
                    end
                end
            end)() then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
                        ease_hands_played(2)
                        
                        return true
                    end
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
    end
}