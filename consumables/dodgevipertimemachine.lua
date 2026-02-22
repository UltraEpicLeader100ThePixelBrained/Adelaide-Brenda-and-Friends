
SMODS.Consumable {
    key = 'dodgevipertimemachine',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'Dodge Viper Time Machine',
        text = {
            [1] = 'Defeat the current blind and go back to an Ante of your choice.',
            [2] = '{C:inactive}(Starts from Ante 0).{}'
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