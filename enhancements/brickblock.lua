
SMODS.Enhancement {
    key = 'brickblock',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 30,
        mult = 4,
        extra = {
            dollars0 = 10
        }
    },
    loc_txt = {
        name = 'Brick Block',
        text = {
            [1] = 'No suit or Rank.',
            [2] = 'Gives {C:blue}+10{} Chips, {C:red}+5{} Mult, & {C:money}+$10{}.',
            [3] = '{C:red}Self Destructs{}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 0.25,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_destroy = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("adelmod_block_smash")
                    
                    return true
                end,
            }))
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 10
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}