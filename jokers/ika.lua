
SMODS.Joker{ --Ika
    key = "ika",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ika',
        ['text'] = {
            [1] = 'Prevents Death if you have at least one {X:edition,C:default}Editioned{} card in your deck.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if next(SMODS.get_enhancements(playing_card)) then
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