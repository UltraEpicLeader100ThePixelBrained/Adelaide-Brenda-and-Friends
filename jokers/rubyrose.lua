
SMODS.Joker{ --Death
    key = "rubyrose",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Death',
        ['text'] = {
            [1] = 'A {C:blue}custom{} joker with {C:red}unique{} effects.'
        },
        ['unlock'] = {
            [1] = 'The ruler of {C:red}HELL{} herself summoned via black magic.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "adelmod_horsemen_of_the_apocalypse",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true, ["adelmod_adelmod_demons"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end
}