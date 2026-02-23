
SMODS.Joker{ --Challenger
    key = "challenger",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Challenger',
        ['text'] = {
            [1] = 'Gains {C:blue}+40{} Chips every time a Card or Joker is destroyed.',
            [2] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {}}
    end
}