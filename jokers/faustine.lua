
SMODS.Joker{ --Faustine
    key = "faustine",
    config = {
        extra = {
            xmult0 = 8,
            chips0 = 49
        }
    },
    loc_txt = {
        ['name'] = 'Faustine',
        ['text'] = {
            [1] = '{C:blue}+49{} Chips.',
            [2] = 'Gain {X:mult,C:white}+8{} XMult on your final hand.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
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
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big(G.GAME.current_round.hands_left) == to_big(1) then
                return {
                    Xmult = 8,
                    message = "Enlarge!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 49
            }
        end
    end
}