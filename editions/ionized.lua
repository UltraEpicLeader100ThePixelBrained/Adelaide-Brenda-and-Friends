
SMODS.Shader({ key = 'ionized', path = 'ionized.fs' })

SMODS.Edition {
    key = 'ionized',
    shader = 'ionized',
    in_shop = false,
    weight = 1,
    apply_to_float = true,
    badge_colour = HEX('ff7300'),
    sound = { sound = "adelmod_Ionized", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Ionized',
        label = 'Ionized',
        text = {
            [1] = 'Applies a random Seal to each scored card'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("adelmod_ion-stamp")
                    SMODS.calculate_effect({message = "Card Stamped!"}, card)
                    return true
                end,
            }))
            local random_seal = SMODS.poll_seal({mod = 10})
            if random_seal then
                card:set_seal(random_seal, true)
            end
            return {
                message = "Card Modified!"
            }
        end
    end
}