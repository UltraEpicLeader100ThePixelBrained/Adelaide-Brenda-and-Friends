SMODS.Rarity {
    key = "horsemen_of_the_apocalypse",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.006,
    badge_colour = HEX('380707'),
    loc_txt = {
        name = "Horsemen Of The Apocalypse"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}