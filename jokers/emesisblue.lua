
SMODS.Joker{ --Emesis Blue
    key = "emesisblue",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Emesis Blue',
        ['text'] = {
            [1] = 'Prevents death',
            [2] = 'Swaps your jokers with different ones of equal value.',
            [3] = 'Each swap has a 1/6 chance of outright {C:red}destroying{} the joker rather than swapping it out.',
            [4] = '{C:red}Self destructs{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end
}