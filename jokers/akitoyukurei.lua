
SMODS.Joker{ --Akito Yukurei
    key = "akitoyukurei",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Akito Yukurei',
        ['text'] = {
            [1] = 'Prevents Death if at least one card has a Seal on it.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if playing_card.seal ~= nil then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
                return {
                    saved = true,
                    message = localize('k_saved_ex')
                }
            end
        end
    end
}