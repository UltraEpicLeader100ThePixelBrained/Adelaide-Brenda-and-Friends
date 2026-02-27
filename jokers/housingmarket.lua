
SMODS.Joker{ --Housing Market
    key = "housingmarket",
    config = {
        extra = {
            xmultvar = 8,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Housing Market',
        ['text'] = {
            [1] = '{X:red,C:white}X8{} Mult but the value goes up by {C:attention}+2{} for every Full House or Flush House.',
            [2] = '{C:red}Self Destructs if you play anything that ISN\'T a house!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmultvar, card.ability.extra.var1}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if next(context.poker_hands["Full House"]) then
                return {
                    Xmult = card.ability.extra.xmultvar
                }
            elseif next(context.poker_hands["Flush House"]) then
                return {
                    Xmult = card.ability.extra.xmultvar
                }
            elseif (next(context.poker_hands["High Card"]) and next(context.poker_hands["Pair"]) and next(context.poker_hands["Three of a Kind"]) and next(context.poker_hands["Straight"]) and next(context.poker_hands["Flush"]) and next(context.poker_hands["Four of a Kind"]) and next(context.poker_hands["Five of a Kind"]) and next(context.poker_hands["Straight Flush"]) and next(context.poker_hands["Flush Five"])) then
                card.ability.extra.var1 = 0
                local target_joker = card
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:explode({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Demolished...", colour = G.C.RED})
                end
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if next(context.poker_hands["Full House"]) then
                return {
                    func = function()
                        card.ability.extra.var1 = (card.ability.extra.var1) + 2
                        return true
                    end
                }
            elseif next(context.poker_hands["Flush House"]) then
                return {
                    func = function()
                        card.ability.extra.var1 = (card.ability.extra.var1) + 2
                        return true
                    end
                }
            end
        end
    end
}