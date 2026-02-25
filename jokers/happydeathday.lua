
SMODS.Joker{ --Happy Death Day
    key = "happydeathday",
    config = {
        extra = {
            ante_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Happy Death Day',
        ['text'] = {
            [1] = 'The ante resets to {C:attention}1{} if you die.'
        },
        ['unlock'] = {
            [1] = 'Die {C:attention}11{} times.'
        }
    },
    pos = {
        x = 0,
        y = 5
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
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            return {
                saved = true,
                message = localize('k_saved_ex'),
                extra = {
                    
                    func = function()
                        
                        local mod = 1 - G.GAME.round_resets.ante
                        ease_ante(mod)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.round_resets.blind_ante = 1
                                return true
                            end,
                        }))
                        return true
                    end,
                    message = "Ante set to " .. 1 .. "!",
                    colour = G.C.YELLOW
                }
            }
        end
    end,
    check_for_unlock = function(self,args)
        if args.type == "career_stat" then
            local count = 0
            return G.PROFILES[G.SETTINGS.profile].career_stats.c_losses == to_big(11)
        end
        return false
    end
}