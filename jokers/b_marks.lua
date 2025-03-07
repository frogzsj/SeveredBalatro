SMODS.Joker {
	key = "marks",
	config = { extra = {
		xmult_gain = 1,
		xmult = 1,
		is_mdr_member = true,
	}},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_gain } }
	end,
	rarity = 3,
	atlas = "svrd_atlas",
	pos = { x = 0, y = 4 },
	cost = 11,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.xmult = 1
		elseif context.other_joker and context.other_joker.ability.set == "Joker"
			and not context.other_joker.debuff and IsMdrMember(context.other_joker)
			and not context.retrigger_joker and not context.retrigger_joker_check
			and not context.blueprint and context.other_joker ~= self then
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.3, 0.4)
						return true
					end,
				}))
				return {
					message = localize({
						type = "variable",
						key = "svrd_xmult_gain",
						vars = { card.ability.extra.xmult_gain },
					}),
					colour = G.C.MULT,
				}
		elseif context.joker_main then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.xmult } }),
				colour = G.C.MULT,
				Xmult_mod = card.ability.extra.xmult,
			}
		end
	end
}
