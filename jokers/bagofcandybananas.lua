
SMODS.Joker{ --Bag Of Candy Bananas
    key = "bagofcandybananas",
    config = {
        extra = {
            multvar = 15
        }
    },
    loc_txt = {
        ['name'] = 'Bag Of Candy Bananas',
        ['text'] = {
            [1] = '{C:mult}+15{} Mult',
            [2] = '{C:mult}-3{} Mult per round played'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true, ["adelmod_Food"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.multvar or 0)) <= to_big(3) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.multvar = math.max(0, (card.ability.extra.multvar) - 3)
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.multvar
            }
        end
    end
}