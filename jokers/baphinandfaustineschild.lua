
SMODS.Joker{ --Baphin and Faustines Child
    key = "baphinandfaustineschild",
    config = {
        extra = {
            hand_size_increase = '5'
        }
    },
    loc_txt = {
        ['name'] = 'Baphin and Faustines Child',
        ['text'] = {
            [1] = '+5 Hand Size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(5)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-5)
    end
}