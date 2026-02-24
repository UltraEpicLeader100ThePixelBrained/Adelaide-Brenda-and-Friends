
SMODS.Joker{ --Java Naesala
    key = "javanaesala",
    config = {
        extra = {
            discards_change = '1',
            discards0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Java Naesala',
        ['text'] = {
            [1] = 'Gain an extra {C:red}Discard{}.',
            [2] = 'Gain {C:attention}TWO {}extra {C:red}Discards{} if {C:attention}Mal\'va{} is in play.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
                    if v.config.center.key == "j_malva" then 
                        return true
                    end
                end
            end)() then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Discards", colour = G.C.GREEN})
                        
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
                        ease_discard(2)
                        
                        return true
                    end
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
    end
}