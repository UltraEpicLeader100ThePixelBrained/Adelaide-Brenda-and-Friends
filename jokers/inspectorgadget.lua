
SMODS.Joker{ --Inspector Gadget
    key = "inspectorgadget",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Inspector Gadget',
        ['text'] = {
            [1] = '{C:inactive} FUCK DISNEY{}',
            [2] = 'Debuffs Jokers made by Disney',
            [3] = '{C:red}+4{} Mult for each debuffed Disney Joker.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
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
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true }
}