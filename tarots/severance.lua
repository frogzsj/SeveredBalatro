SMODS.Consumable{
	set = "Tarot",
	key = "severance",
    atlas = "svrd_atlas",
	pos = { x = 3, y = 5 },
	config = {
		min_highlighted = 1,
		max_highlighted = 1,
	},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	can_use = function(self, card)
		if #G.hand.highlighted ~= self.config.max_highlighted then
			return false
		end
	    return G.hand.highlighted[1]:get_id() > 3
	end,
	use = function(self, card)
		local _card = G.hand.highlighted[1]
		local _copy1 = copy_card(_card, nil, nil, G.playing_card)
		local _copy2 = copy_card(_card, nil, nil, G.playing_card)

		G.E_MANAGER:add_event(Event({
			func = function()
				local id = _copy1:get_id()
				if id == 14 then id = 11
				elseif id > 10 then id = 10 end
				local split = math.random(2, id - 2)
				local suit_prefix = string.sub(_card.base.suit, 1, 1)..'_'
				local rank_suffix1 = split
				local rank_suffix2 = tostring(id - split)
				_copy1:set_base(G.P_CARDS[suit_prefix..rank_suffix1])
				_copy2:set_base(G.P_CARDS[suit_prefix..rank_suffix2])
				_card:start_dissolve()
				return true
			end
		}))

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.5,
			func = function()
				_copy1:add_to_deck()
				_copy2:add_to_deck()
				G.deck.config.card_limit = G.deck.config.card_limit + 2
				table.insert(G.playing_cards, _copy1)
				table.insert(G.playing_cards, _copy2)
				G.hand:emplace(_copy1, nil, true)
				G.hand:emplace(_copy2, nil, true)
				_copy1:start_materialize()
				_copy2:start_materialize()
				play_sound("tarot2", 0.85, 0.36)
				return true
			end
		}))

		delay(0.5)
	end,
}
