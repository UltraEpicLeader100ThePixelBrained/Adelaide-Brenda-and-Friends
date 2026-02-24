
SMODS.Joker{ --Baphin
    key = "baphin",
    config = {
        extra = {
            blind_size0 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Baphin',
        ['text'] = {
            [1] = 'Lowers Boss Blind requirements by 6%'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Flaming Sphere!", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips / 6
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
    end
}