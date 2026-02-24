
SMODS.Joker{ --Nikki Lom
    key = "nikkilom",
    config = {
        extra = {
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Nikki Lom',
        ['text'] = {
            [1] = 'At the end of shop generate a random consumable at the cost of {C:red}$5{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.ending_shop  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars - 5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Thanks for the patronage.", colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    local sets = {'Tarot', 'Planet', 'Spectral'}
                                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                    SMODS.add_card({ set = random_set, })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end,
                    colour = G.C.PURPLE
                }
            }
        end
    end
}