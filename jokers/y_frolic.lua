SMODS.Joker {
	key = "frolic",
	config = { extra = { xmult = 1.25 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	rarity = "svrd_temper",
	atlas = "svrd_atlas",
	pos = { x = 3, y = 4 },
	cost = 8,
	-- unlocked = true,
	-- discovered = true,
	calculate = function(self, card, context)
		if context.individual and not context.other_card.debuff then
			if context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
				return {
					message = localize({ type = "variable", key = "svrd_mult", vars = { card.ability.extra.xmult } }),
					colour = G.C.MULT,
					card = context.other_card,
					Xmult_mod = card.ability.extra.xmult,
				}
			end
		end
	end
}
