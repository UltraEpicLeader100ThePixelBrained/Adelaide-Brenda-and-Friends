
SMODS.Joker{ --Justice League x RWBY: Super Heroes & Huntsmen
    key = "hellsmaw",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Justice League x RWBY: Super Heroes & Huntsmen',
        ['text'] = {
            [1] = '{C:inactive}The maw of{} {C:red}HELL{} {C:inactive}hungers...{}',
            [2] = 'Creates one of the Horsemen Of The Apocalypse at the start of each ante.',
            [3] = '{C:inactive}Feed it your soul...{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true, ["adelmod_adelmod_demons"] = true },
    
    calculate = function(self, card, context)
        if context.ante_change  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'adelmod_adelmod_demons' })
                            if joker_card then
                                
                                
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Damnation draws closer...", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}