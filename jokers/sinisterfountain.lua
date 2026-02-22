
SMODS.Joker{ --Sinister Fountain
    key = "sinisterfountain",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Sinister Fountain',
        ['text'] = {
            [1] = 'When a hand is played,',
            [2] = 'destroy all consumables and create consumables equal to the amount destroyed.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true }
}