
SMODS.Joker{ --Flask of Ichor
    key = "flaskofichor",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Flask of Ichor',
        ['text'] = {
            [1] = 'Reduces Blind Requirements by {C:attention}15%{} for 3 rounds...',
            [2] = '{C:red}Self destructs when after the third round.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true, ["adelmod_adelmod_beverages"] = true }
}