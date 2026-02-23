
SMODS.Joker{ --Happy Death Day
    key = "happydeathday",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Happy Death Day',
        ['text'] = {
            [1] = 'The ante resets if you die.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
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