SMODS.Joker {
	key = "innieirv",
	config = { extra = { odds = 2, is_mdr_member = true } },
	loc_vars = function(self, info_queue, card)
		return { vars = { ""..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	rarity = 2,
	atlas = "svrd_atlas",
	pos = { x = 3, y = 0 },
	cost = 6,
	-- unlocked = true,
	-- discovered = true,
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.before then
			if pseudorandom("innieirv") < G.GAME.probabilities.normal / card.ability.extra.odds then
				local first = context.full_hand[1]
				if not first.debuff and not SMODS.has_enhancement(first, "m_svrd_goo") then
					G.E_MANAGER:add_event(Event({
						func = function()
							card_eval_status_text(card, "extra", nil, nil, nil, {
								message = localize("svrd_goo"),
								colour = HEX("000000"),
								instant = true,
							})
							card:juice_up(0.3, 0.4)
	
							first:flip()
							play_sound("generic1", 0.7, 0.35)
							return true
						end
					}))
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.4,
						func = function()
							first:set_ability(G.P_CENTERS.m_svrd_goo)
							return true
						end
					}))
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.15,
						func = function()
							first:flip()
							play_sound("tarot2", 0.85, 0.6)
							first:juice_up(0.3, 0.4)
							delay(0.5)
							return true
						end
					}))
				end
			end
		end
	end
}
