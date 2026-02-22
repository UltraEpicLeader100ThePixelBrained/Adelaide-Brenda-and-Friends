
SMODS.Consumable {
    key = 'debugmode',
    set = 'Spectral',
    pos = { x = 4, y = 0 },
    loc_txt = {
        name = 'Debug Mode',
        text = {
            [1] = 'Create a {C:attention}Monitor{} of your choice.'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    can_use = function(self, card)
        return true
    end
}