
SMODS.Joker{ --Happy Death Day
    key = "happydeathday",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Happy Death Day',
        ['text'] = {
            [1] = 'The ante resets to {C:attention}1{} if you die.'
        },
        ['unlock'] = {
            [1] = 'Die {C:attention}11{} times.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    dependencies = {"kino"},
    pools = { ["adelmod_adelmod_jokers"] = true },
    check_for_unlock = function(self,args)
        if args.type == "career_stat" then
            local count = 0
            return G.PROFILES[G.SETTINGS.profile].career_stats.c_losses == to_big(11)
        end
        return false
    end
}