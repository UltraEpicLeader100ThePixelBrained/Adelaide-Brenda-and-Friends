
SMODS.Joker{ --The Judge
    key = "thejudge",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Judge',
        ['text'] = {
            [1] = 'Gains 5X Mult per defeated blind.',
            [2] = '{C:inactive}(Currently{} {C:attention}0X{} {C:inactive}Mult){}',
            [3] = '{C:red}Resets if a blind is skipped.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
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
    dependencies = {"finity"},
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