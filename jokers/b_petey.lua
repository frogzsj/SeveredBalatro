SMODS.Joker {
	key = "petey",
	config = { extra = {
		mult = 25,
		rounds = 3,
		is_mdr_member = true,
	}},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.rounds } }
	end,
	rarity = 1,
	atlas = "svrd_atlas",
	pos = { x = 3, y = 1 },
	cost = 5,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = "variable", key = "a_mult", vars = { card.ability.extra.mult } }
			}
		end
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
				return {
					message = localize("svrd_destroyed"),
					colour = G.C.MULT,
					remove = true,
				}
			else
				return {
					message = localize({ type = "variable", key = "svrd_remaining", vars = { card.ability.extra.rounds } }),
					colour = G.C.FILTER,
				}
			end
		end
	end
}
