
SMODS.Joker{ --Forever Weed Brownie
    key = "foreverweedbrownie",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Forever Weed Brownie',
        ['text'] = {
            [1] = 'Polychromes your entire deck and all jokers present',
            [2] = 'but becomes eternal upon being obtained and',
            [3] = 'it also applies the polychrome effect to the entire screen.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
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
    
    set_ability = function(self, card, initial)
        card:set_edition("e_polychrome", true)
    end
}