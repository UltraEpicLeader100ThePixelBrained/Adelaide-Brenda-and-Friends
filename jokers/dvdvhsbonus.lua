
SMODS.Joker{ --Yu-Gi-Oh! The Move: Pyramid Of Light
    key = "dvdvhsbonus",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Yu-Gi-Oh! The Move: Pyramid Of Light',
        ['text'] = {
            [1] = 'Gains {C:blue}+13{} Chips for every Light Monster you have in play',
            [2] = 'but removes all Light Monsters when this card is sold or destroyed.',
            [3] = '{C:inactive}(Currently{} {C:blue}+0{} {C:inactive}Chips){}',
            [4] = 'Animation/Family/Fantasy'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
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
    dependencies = {"kino","JoyousSpring"},
    pools = { ["adelmod_adelmod_jokers"] = true }
}