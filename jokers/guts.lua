
SMODS.Joker{ --Guts
    key = "guts",
    config = {
        extra = {
            chips0 = 100,
            mult0 = 10,
            mult = 10,
            chips = 100
        }
    },
    loc_txt = {
        ['name'] = 'Guts',
        ['text'] = {
            [1] = 'Gains {C:red}+10{} Mult & {C:blue}+100{} Chips for every {C:attention}Metal{} Card you have in your deck.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
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
    pools = { ["adelmod_adelmod_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if SMODS.get_enhancements(playing_card)["m_steel"] == true then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
                return {
                    chips = 100,
                    extra = {
                        mult = 10
                    }
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if SMODS.get_enhancements(playing_card)["m_gold"] == true then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
                return {
                    mult = 10,
                    extra = {
                        chips = 100,
                        colour = G.C.CHIPS
                    }
                }
            end
        end
    end
}