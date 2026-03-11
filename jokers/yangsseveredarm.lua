
SMODS.Joker{ --Yangs Severed Arm
    key = "yangsseveredarm",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Yangs Severed Arm',
        ['text'] = {
            [1] = 'Every scored card becomes {C:attention}Burnt{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    dependencies = {"aikoyorisshenanigans"},
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    scored_card:set_edition("e_burnt", true)
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Scorched!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
    end
}