
SMODS.Joker{ --Flask of Distilled Wisdom
    key = "flaskofdistilledwisdom",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Flask of Distilled Wisdom',
        ['text'] = {
            [1] = 'Doubles {C:blue}Chips{} earned for {C:attention}3{} rounds.',
            [2] = '{C:red}Self destructs when after the third round.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
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
    pools = { ["adelmod_adelmod_beverages"] = true, ["adelmod_adelmod_jokers"] = true }
}