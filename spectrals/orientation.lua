SMODS.Consumable{
	set = "Spectral",
	key = "orientation", 
    atlas = "svrd_atlas",
	pos = { x = 1, y = 5 },
	config = {extra = {gold = 10}},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return {vars = {card and card.ability.extra.gold or self.config.extra.gold}}
	end,
	can_use = function(self, card)
		return #G.jokers.cards < G.jokers.config.card_limit
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local _card = create_card("Joker", G.jokers, nil, "svrd_temper", nil, nil, nil, "c_svrd_temper")
				_card:add_to_deck()
				G.jokers:emplace(_card)
				_card:juice_up(0.3, 0.5)
				ease_dollars(self.config.extra.gold, true)
				return true
			end,
		}))
		delay(0.6)
	end,
}
