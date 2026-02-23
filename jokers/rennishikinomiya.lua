
SMODS.Joker{ --Ren Nishikinomiya
    key = "rennishikinomiya",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ren Nishikinomiya',
        ['text'] = {
            [1] = 'Prevents {C:attention}Horror Cards{} from {C:red}awakening{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
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
    discovered = true,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true }
}