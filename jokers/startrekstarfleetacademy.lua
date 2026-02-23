
SMODS.Joker{ --Star Trek: Starfleet Academy
    key = "startrekstarfleetacademy",
    config = {
        extra = {
            mult0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Star Trek: Starfleet Academy',
        ['text'] = {
            [1] = '{C:red}+5{} Mult for every planet you are holding onto.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, consumable_card in pairs(G.consumeables.cards or {}) do
                    if consumable_card.ability.set == 'Planet' then
                        count = count + 1
                    end
                end
                return to_big(count) <= to_big(1)
            end)() then
                return {
                    mult = 5
                }
            end
        end
    end
}