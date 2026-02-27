
SMODS.Joker{ --Tentacle Monster
    key = "tentaclemonster",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Tentacle Monster',
        ['text'] = {
            [1] = '{C:red}Sell this joker to instantly die...{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("itsrapeoclock")
                    SMODS.calculate_effect({message = "Its raping time!"}, card)
                    return true
                end,
            }))
            return {
                func = function()
                    
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                            if G.STAGE == G.STAGES.RUN then 
                                G.STATE = G.STATES.GAME_OVER
                                G.STATE_COMPLETE = false
                            end
                        end
                    }))
                    
                    return true
                end
            }
        end
    end
}