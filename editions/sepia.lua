
SMODS.Shader({ key = 'sepia', path = 'sepia.fs' })

SMODS.Edition {
    key = 'sepia',
    shader = 'sepia',
    in_shop = false,
    weight = 1.5,
    apply_to_float = true,
    badge_colour = HEX('704214'),
    sound = { sound = "adelmod_Sepia", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Sepia',
        label = 'Sepia',
        text = {
            [1] = 'Creates a {C:tarot}Tarot{} card when held at the end of a round'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}