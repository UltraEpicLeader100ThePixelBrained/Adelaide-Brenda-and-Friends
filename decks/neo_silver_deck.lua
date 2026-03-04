
SMODS.Back {
    key = 'neo_silver_deck',
    pos = { x = 3, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Neo Silver Deck',
        text = {
            [1] = 'Start with a random {C:attention}Joker{} & a random {C:attention}Consumable{}.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    play_sound('timpani')
                    local sets = {'Tarot', 'Planet', 'Spectral'}
                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                    SMODS.add_card({ set = random_set, 
                    })
                    return true
                end
            }))
        end
    end
}