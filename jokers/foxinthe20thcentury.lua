
SMODS.Joker{ --Fox
    key = "foxinthe20thcentury",
    config = {
        extra = {
            xmult0 = 10,
            xmult = 10
        }
    },
    loc_txt = {
        ['name'] = 'Fox',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X10{} Mult per friend she has.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.other_joker  and not context.blueprint then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_raveninthe20thcentury" then 
                        return true
                    end
                end
            end)() then
                return {
                    Xmult = 10
                }
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_slothinthe20thcentury" then 
                        return true
                    end
                end
            end)() then
                return {
                    Xmult = 10
                }
            end
        end
    end
}