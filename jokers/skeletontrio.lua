
SMODS.Joker{ --Skeleton Trio
    key = "skeletontrio",
    config = {
        extra = {
            xmult0 = 6,
            xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Skeleton Trio',
        ['text'] = {
            [1] = 'Hold onto this joker to gain {X:red,C:white}X3{} Mult',
            [2] = 'Gives {X:red,C:white}X6{} Mult if Mal\'va is in play while you hold this joker.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
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
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_malva" then 
                        return true
                    end
                end
            end)() then
                return {
                    Xmult = 6
                }
            else
                return {
                    Xmult = 3
                }
            end
        end
    end
}