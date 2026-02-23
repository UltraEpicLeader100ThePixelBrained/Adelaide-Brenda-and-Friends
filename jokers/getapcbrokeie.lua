
SMODS.Joker{ --No mod for you
    key = "getapcbrokeie",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'No mod for you',
        ['text'] = {
            [1] = 'Fuck off mobile peasant.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["adelmod_adelmod_jokers"] = true, ["adelmod_detrimental"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if love.system.getOS() == "Android" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("adelmod_nope")
                        SMODS.calculate_effect({message = "Nope!"}, card)
                        return true
                    end,
                }))
                error("Save the modding for PC.")
            elseif love.system.getOS() == "iOS" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("adelmod_nope")
                        SMODS.calculate_effect({message = "Nope!"}, card)
                        return true
                    end,
                }))
                error("Save the modding for PC.")
            elseif love.system.getOS() == "Windows" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("adelmod_good")
                        SMODS.calculate_effect({message = "Safe!"}, card)
                        return true
                    end,
                }))
            elseif love.system.getOS() == "Linux" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("adelmod_good")
                        SMODS.calculate_effect({message = "Safe!"}, card)
                        return true
                    end,
                }))
            elseif love.system.getOS() == "OS X" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("adelmod_good")
                        SMODS.calculate_effect({message = "Safe!"}, card)
                        return true
                    end,
                }))
            end
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_adelmod_getapcbrokeie" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_adelmod_getapcbrokeie" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end