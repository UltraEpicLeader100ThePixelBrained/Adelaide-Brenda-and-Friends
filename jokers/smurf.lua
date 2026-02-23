
SMODS.Joker{ --Smurf
    key = "smurf",
    config = {
        extra = {
            chips0 = 40
        }
    },
    loc_txt = {
        ['name'] = 'Smurf',
        ['text'] = {
            [1] = '{C:blue}+40 {}Chips.',
            [2] = '{C:red}Destroys Snorks!{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 40
            }
        end
        if context.before and context.cardarea == G.jokers  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_snorks" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        local target_joker = nil
                        for i, joker in ipairs(G.jokers.cards) do
                            if joker.config.center.key == "j_snorks" and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                target_joker = joker
                                break
                            end
                        end
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "You smurfing rip off!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}