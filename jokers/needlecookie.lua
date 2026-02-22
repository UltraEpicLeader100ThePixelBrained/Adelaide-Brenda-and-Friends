
SMODS.Joker{ --Needle Cookie
    key = "needlecookie",
    config = {
        extra = {
            hands_change = '1',
            xmult0 = 2017
        }
    },
    loc_txt = {
        ['name'] = 'Needle Cookie',
        ['text'] = {
            [1] = 'Gain {X:red,C:white}X2017{} Mult but {C:red}you have only one hand{}.',
            [2] = '{C:inactive}\"If you know, you know.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            return {
                Xmult = 2017,
                message = "Mind your bite..."
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_hands = G.GAME.round_resets.hands
        G.GAME.round_resets.hands = 1
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_hands then
            G.GAME.round_resets.hands = card.ability.extra.original_hands
        end
    end
}