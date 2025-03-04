SMODS.Consumable{
	set = "Tarot",
	key = "reintegration",
    atlas = "svrd_atlas",
	pos = { x = 2, y = 5 },
	config = {
		min_highlighted = 2,
		max_highlighted = 2,
	},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	can_use = function(self, card)
		if #G.hand.highlighted ~= self.config.max_highlighted then
			return false
		end
		for i = 1, #G.hand.highlighted do
			local _c = G.hand.highlighted[i]
			if _c.base.id > 10 then
				return false
			end
		end
	    return true
	end,
	use = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.hand.highlighted[1]:flip()
				G.hand.highlighted[2]:flip()
				play_sound("generic1", 0.7, 0.35)
				return true
			end
		}))

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 1,
			func = function()
				local new_rank = math.min(10,
					G.hand.highlighted[1].base.id + G.hand.highlighted[2].base.id
				)

				local new_suit = tostring(pseudorandom_element({
					G.hand.highlighted[1].base.suit,
					G.hand.highlighted[2].base.suit,
				}, pseudoseed('reintegration_suit')))

				local seals = {}
				if G.hand.highlighted[1].seal then table.insert(seals, G.hand.highlighted[1].seal) end
				if G.hand.highlighted[2].seal then table.insert(seals, G.hand.highlighted[2].seal) end
				local new_seal = #seals and pseudorandom_element(seals, pseudoseed('reintegration_seal')) or nil

				local ms = {}
				if G.hand.highlighted[1].config.center.key ~= 'c_base' then
					table.insert(ms, G.hand.highlighted[1].config.center.key)
				end
				if G.hand.highlighted[2].config.center.key ~= 'c_base' then
					table.insert(ms, G.hand.highlighted[2].config.center.key)
				end
				local new_m = #ms and pseudorandom_element(ms, pseudoseed('reintegration_m')) or nil

				local editions = {}
				if (G.hand.highlighted[1].edition or {}).key then
					table.insert(editions, G.hand.highlighted[1].edition)
				end
				if (G.hand.highlighted[2].edition or {}).key then
					table.insert(editions, G.hand.highlighted[2].edition)
				end
				local new_edition = pseudorandom_element(editions, pseudoseed('reintegration_editions'))

				G.hand.highlighted[2]:start_dissolve()

				local suit_prefix = string.sub(new_suit, 1, 1)..'_'
				local rank_suffix = new_rank < 10 and new_rank or 'T'
				G.hand.highlighted[1]:set_base(G.P_CARDS[suit_prefix..rank_suffix])
				if new_seal then G.hand.highlighted[1]:set_seal(new_seal) end
				if new_m then G.hand.highlighted[1]:set_ability(G.P_CENTERS[new_m]) end
				if new_edition then G.hand.highlighted[1]:set_edition(new_edition) end
				return true
			end
		}))

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.15,
			func = function()
				G.hand.highlighted[1]:flip()
				play_sound("tarot2", 0.85, 0.6)
				G.hand.highlighted[1]:juice_up(0.3, 0.4)
				return true
			end
		}))

		delay(0.5)
	end,
}
