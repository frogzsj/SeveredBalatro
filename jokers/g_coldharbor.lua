SMODS.Joker {
	key = "coldharbor",
	config = { extra = { } },
	loc_vars = function(self, info_queue, card)
		return { vars = { } }
	end,
	rarity = 3,
	atlas = "svrd_atlas",
	pos = { x = 6, y = 4 },
	cost = 15,
	-- unlocked = true,
	-- discovered = true,
	remove_from_deck = function(self, card, from_debuff)
		G.E_MANAGER:add_event(Event({
			func = function()
				add_tag(Tag("tag_negative"))
				play_sound("generic1", 0.9 + math.random()*0.1, 0.8)
				play_sound("holo1", 1.2 + math.random()*0.1, 0.4)
				return true
			end,
		}))
	end
}
