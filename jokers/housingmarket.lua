
SMODS.Joker{ --Housing Market
    key = "housingmarket",
    config = {
        extra = {
            xmult0 = 8,
            repetitions = 1,
            xmult = 8
        }
    },
    loc_txt = {
        ['name'] = 'Housing Market',
        ['text'] = {
            [1] = '{X:red,C:white}X8{} Mult for every Full House or Flush House.',
            [2] = '{C:red}Resets if you play a hand that isn\'t a Full House.{}'
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
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Full House"]) then
                return {
                    Xmult = 8
                }
            elseif (next(context.poker_hands["High Card"]) and next(context.poker_hands["Pair"]) and next(context.poker_hands["Two Pair"]) and next(context.poker_hands["Three of a Kind"]) and next(context.poker_hands["Straight"]) and next(context.poker_hands["Flush"]) and next(context.poker_hands["Four of a Kind"]) and next(context.poker_hands["Five of a Kind"]) and next(context.poker_hands["Straight Flush"]) and next(context.poker_hands["Flush Five"])) then
                for i = 1, 1 do
                    card.ability.extra.var1 = (card.ability.extra.var1) + 0
                    
                end
            elseif next(context.poker_hands["Flush House"]) then
                return {
                    Xmult = 8
                }
            end
        end
    end
}