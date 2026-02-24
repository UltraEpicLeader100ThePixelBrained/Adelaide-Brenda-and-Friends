
SMODS.Joker{ --Furby
    key = "furby",
    config = {
        extra = {
            multvar = 4,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Furby',
        ['text'] = {
            [1] = '{C:red}+4{} Mult But gains {C:red}+2{} Mult every round you survive...'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar, card.ability.extra.var1}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            return {
                mult = card.ability.extra.multvar
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.var1 or 0)) >= to_big(4) then
                return {
                    func = function()
                        card.ability.extra.var1 = (card.ability.extra.var1) + 2
                        return true
                    end
                }
            end
        end
    end
}