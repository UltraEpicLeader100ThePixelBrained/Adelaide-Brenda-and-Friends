SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {25,58,57,23,53,64,31,22,56,49,10,47,33,12,16,19,20,4,21,60,26,15,7,42,32,46,28,67,14,63,34,69,1,40,59,52,48,11,45,62,39,61,17,8,54,35,38,51,27,29,36,65,66,3,30,68,71,9,13,55,18,37,41,5,43,44,70,2,50,6,24}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {4,3,1,5,2}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local editionIndexList = {2,1}

local function load_editions_folder()
    local mod_path = SMODS.current_mod.path
    local editions_path = mod_path .. "/editions"
    local files = NFS.getDirectoryItemsInfo(editions_path)
    for i = 1, #editionIndexList do
        local file_name = files[editionIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. file_name))()
        end
    end
end


local voucherIndexList = {4,3,2,1}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {1,2,3,4}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_editions_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "adelmod_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "adelmod_adelmod_jokers",
    cards = {
        ["j_adelmod_akira"] = true,
        ["j_adelmod_animalcrossingthemovie"] = true,
        ["j_adelmod_bagofcandybananas"] = true,
        ["j_adelmod_baphin"] = true,
        ["j_adelmod_baphinandfaustineschild"] = true,
        ["j_adelmod_bibleblack"] = true,
        ["j_adelmod_blakebelladonna"] = true,
        ["j_adelmod_challenger"] = true,
        ["j_adelmod_cowboybebopthemovie"] = true,
        ["j_adelmod_cumchalice"] = true,
        ["j_adelmod_death"] = true,
        ["j_adelmod_dvdvhsbonus"] = true,
        ["j_adelmod_eggnog"] = true,
        ["j_adelmod_emesisblue"] = true,
        ["j_adelmod_flaskofdistilledwisdom"] = true,
        ["j_adelmod_flaskofichor"] = true,
        ["j_adelmod_foreverweedbrownie"] = true,
        ["j_adelmod_foxinthe20thcentury"] = true,
        ["j_adelmod_getapcbrokeie"] = true,
        ["j_adelmod_glassyonahole"] = true,
        ["j_adelmod_gremlins2thenewbatch"] = true,
        ["j_adelmod_guts"] = true,
        ["j_adelmod_happydeathday"] = true,
        ["j_adelmod_hellsmaw"] = true,
        ["j_adelmod_homelander"] = true,
        ["j_adelmod_housingmarket"] = true,
        ["j_adelmod_infinitevendingmachine"] = true,
        ["j_adelmod_inspectorgadget"] = true,
        ["j_adelmod_interspeciesreviewers"] = true,
        ["j_adelmod_isitwrongtotrytopickupgirlsinadungeon"] = true,
        ["j_adelmod_java"] = true,
        ["j_adelmod_killlakill"] = true,
        ["j_adelmod_lucifer"] = true,
        ["j_adelmod_lupiniiithecastleofcagliostro"] = true,
        ["j_adelmod_malva"] = true,
        ["j_adelmod_needlecookie"] = true,
        ["j_adelmod_nikkilom"] = true,
        ["j_adelmod_nyankalee"] = true,
        ["j_adelmod_paprika"] = true,
        ["j_adelmod_parademon"] = true,
        ["j_adelmod_pitchimperfect"] = true,
        ["j_adelmod_psychopassthemovie"] = true,
        ["j_adelmod_raveninthe20thcentury"] = true,
        ["j_adelmod_rennishikinomiya"] = true,
        ["j_adelmod_rosariovampire"] = true,
        ["j_adelmod_sailormoonrthemovie"] = true,
        ["j_adelmod_shangtsung"] = true,
        ["j_adelmod_shimonetaaboringworldwheretheconceptofdirtyjokesdoesntexist"] = true,
        ["j_adelmod_sinisterfountain"] = true,
        ["j_adelmod_slothinthe20thcentury"] = true,
        ["j_adelmod_splitdecision"] = true,
        ["j_adelmod_sportsalmanac"] = true,
        ["j_adelmod_startrekstarfleetacademy"] = true,
        ["j_adelmod_sweettooth"] = true,
        ["j_adelmod_theadventuresofmiloandotis"] = true,
        ["j_adelmod_thejudge"] = true,
        ["j_adelmod_thephantomtollbooth"] = true,
        ["j_adelmod_thetransformersthemovie"] = true,
        ["j_adelmod_washeduprealitytvstar"] = true,
        ["j_adelmod_weissschnee"] = true,
        ["j_adelmod_wizards"] = true,
        ["j_adelmod_xeneaalba"] = true,
        ["j_adelmod_yangxaiolong"] = true
    },
})

SMODS.ObjectType({
    key = "adelmod_Food",
    cards = {
        ["j_adelmod_bagofcandybananas"] = true,
        ["j_adelmod_cumchalice"] = true,
        ["j_adelmod_eggnog"] = true
    },
})

SMODS.ObjectType({
    key = "adelmod_adelmod_demons",
    cards = {
        ["j_adelmod_blakebelladonna"] = true,
        ["j_adelmod_death"] = true,
        ["j_adelmod_hellsmaw"] = true,
        ["j_adelmod_weissschnee"] = true,
        ["j_adelmod_yangxaiolong"] = true
    },
})

SMODS.ObjectType({
    key = "adelmod_adelmod_beverages",
    cards = {
        ["j_adelmod_cumchalice"] = true,
        ["j_adelmod_eggnog"] = true,
        ["j_adelmod_flaskofdistilledwisdom"] = true,
        ["j_adelmod_flaskofichor"] = true
    },
})

SMODS.ObjectType({
    key = "adelmod_jokers",
    cards = {
        ["j_adelmod_eggman"] = true,
        ["j_adelmod_gimmiemoarslots"] = true
    },
})

SMODS.ObjectType({
    key = "adelmod_detrimental",
    cards = {
        ["j_adelmod_getapcbrokeie"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end