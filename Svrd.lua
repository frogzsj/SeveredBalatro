SMODS.current_mod.optional_features = {
  cardareas = {
    unscored = true,
  },
  retrigger_joker = true,
}

_ = SMODS.load_file("lodash.lua")()

SMODS.Atlas {
  key = "svrd_atlas",
  path = "svrdAtlas.png",
  px = 71,
  py = 95,
}

G.C.SVRD_PROTOCOL = HEX("303030")
SMODS.Rarity{
  key = "protocol",
  badge_colour = G.C.SVRD_PROTOCOL,
  default_weight = 0.001,
  pools = {["Joker"] = true},
}

G.C.SVRD_TEMPER = HEX("d4e04c")
SMODS.Rarity{
  key = "temper",
  badge_colour = G.C.SVRD_TEMPER,
  badge_text_colour = G.C.BLACK,
  default_weight = 0.001,
  pools = {["Joker"] = true},
}

local function has_value(tab, val)
  for i, value in ipairs(tab) do
      if value == val then
          return true
      end
  end
  return false
end

function GetIndex(list, item)
  for i = 1, #list do
    if list[i] == item then
      return i
    end
  end
  return -1
end

scary_nums = {4, 5, 6, 9}
happy_nums = {2, 3, 7, 8}
function IsScary(number) return has_value(scary_nums, number) end
function IsHappy(number) return has_value(happy_nums, number) end
function IsMdrMember(joker_card) return _.get(joker_card, { "ability", "extra", "is_mdr_member" }, false) end

local mod_path = "" .. SMODS.current_mod.path
local function load_folder(folder)
	local files = NFS.getDirectoryItems(mod_path .. folder)
	for i, file in ipairs(files) do
		SMODS.load_file(folder .. "/" .. file)()
	end
end

load_folder("enhancements")
load_folder("tarots")
load_folder("jokers")
load_folder("spectrals")

