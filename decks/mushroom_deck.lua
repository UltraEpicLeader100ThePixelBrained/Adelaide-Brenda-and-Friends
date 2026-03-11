
SMODS.Back {
    key = 'mushroom_deck',
    pos = { x = 4, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Mushroom Deck',
        text = {
            [1] = 'Start with 52 {C:attention}Brick Blocks{}.
            [2] = '{C:inactive}Try not to smash the entire deck to peices...{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    v:set_ability(G.P_CENTERS['m_adelmod_brickblock'])
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}
