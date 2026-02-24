
SMODS.Joker{ --Akira
    key = "akira",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Akira',
        ['text'] = {
            [1] = 'A {C:blue}custom{} joker with {C:red}unique{} effects.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true }
}