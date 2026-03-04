
SMODS.Joker{ --Love Live! The School Idol Movie
    key = "lovelivetheschoolidolmovie",
    config = {
        extra = {
            multvar = 9
        }
    },
    loc_txt = {
        ['name'] = 'Love Live! The School Idol Movie',
        ['text'] = {
            [1] = 'Gains {C:red}+9{} Mult for every {X:edition,C:default}Polychrome{} {C:attention}9{} in your deck.',
            [2] = '{C:inactive}(Currently{} {C:red}+#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (G.GAME.current_round.rankvar_card.rank == "[object Object]" and G.GAME.current_round.rankvar_card.id == "[object Object]" and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.edition and playing_card.edition.key == "polychrome" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)()) then
                return {
                    mult = card.ability.extra.multvar
                }
            end
        end
    end
}