SMODS.Joker {
	key = "glasglowblock",
	config = { extra = { rounds = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.rounds } }
	end,
	rarity = "svrd_protocol",
	atlas = "svrd_atlas",
	pos = { x = 1, y = 2 },
	cost = 12,
	-- unlocked = true,
	-- discovered = true,
	blueprint_compat = false,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.rounds = card.ability.extra.rounds - 1
			if card.ability.extra.rounds <= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))

				G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1

				return {
					message = localize({ type = "variable", key = "svrd_hands_inc", vars = { 1 } }),
					colour = G.C.CHIPS,
				}
			else
				return {
					message = localize({ type = "variable", key = "svrd_remaining", vars = { card.ability.extra.rounds } }),
					colour = G.C.FILTER,
				}
			end
		end
	end,
}
