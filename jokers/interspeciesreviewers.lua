
SMODS.Joker{ --Interspecies Reviewers
    key = "interspeciesreviewers",
    config = {
        extra = {
            chips0 = 69
        }
    },
    loc_txt = {
        ['name'] = 'Interspecies Reviewers',
        ['text'] = {
            [1] = '{C:blue}+69{} Chips for every {C:attention}Joker{} you currently have in play.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
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
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#G.jokers.cards) >= to_big(1) then
                return {
                    chips = 69
                }
            end
        end
    end
}