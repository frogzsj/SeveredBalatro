SMODS.Joker {
	key = "waffleparty",
	config = { extra = { gold = 5 }},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.gold } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 1, y = 4 },
	cost = 8,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition then
			for i = 1, #G.jokers.cards do
				local jkr = G.jokers.cards[i]
				if jkr.config.center.rarity == "svrd_temper" then
					G.E_MANAGER:add_event(Event({
						func = function()
							card:juice_up(0.3, 0.4)
							card_eval_status_text(jkr, "extra", nil, nil, nil, {
								message = localize("$") .. card.ability.extra.gold,
								colour = G.C.GOLD,
								instant = true,
							})
							ease_dollars(card.ability.extra.gold, true)
							return true
						end
					}))
					delay(0.5)
				end
			end
		end
	end
}
