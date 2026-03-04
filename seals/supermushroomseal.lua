
SMODS.Seal {
    key = 'supermushroomseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            card_draw0 = 10
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Super Mushroom Seal',
        label = 'Super Mushroom Seal',
        text = {
            [1] = 'Discard this card to draw {C:attention}10 cards{}.'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(10)
            end
            return {
                message = "+"..tostring(10).." Cards Drawn"
            }
        end
    end
}